# OpenRouter API ile 3 LLM × 32 vinyet toplama + reproducibility sub-study
# Konfigürasyon: scripts/01_collection/config.yaml
# Çıktı: data/raw_responses/primary_run/ + reproducibility_run/

suppressPackageStartupMessages({
  library(httr2)
  library(yaml)
  library(jsonlite)
  library(digest)
  library(fs)
})

# --- Konfigürasyon ---
cfg <- yaml::read_yaml("scripts/01_collection/config.yaml")
stopifnot(nchar(cfg$api$key) > 20, !grepl("BURAYA", cfg$api$key))

# --- Vinyet yükleme ---
load_vignettes <- function(dir = "vignettes") {
  files <- list.files(dir, pattern = "^v\\d{2}_.*\\.md$", full.names = TRUE)
  setNames(lapply(files, readLines), tools::file_path_sans_ext(basename(files)))
}

# --- API çağrısı ---
call_llm <- function(model_id, vignette_text, params, system_prompt = "",
                     user_template, api_cfg) {
  user_msg <- gsub("\\{VIGNETTE\\}", paste(vignette_text, collapse = "\n"), user_template)

  body <- list(
    model = model_id,
    messages = list(
      list(role = "user", content = user_msg)
    ),
    temperature = params$temperature,
    top_p = params$top_p,
    max_tokens = params$max_tokens,
    presence_penalty = params$presence_penalty,
    frequency_penalty = params$frequency_penalty,
    stream = params$stream,
    seed = params$seed
  )
  if (nchar(system_prompt) > 0) {
    body$messages <- c(list(list(role = "system", content = system_prompt)),
                       body$messages)
  }

  t0 <- Sys.time()
  resp <- httr2::request(api_cfg$base_url) |>
    httr2::req_headers(
      Authorization = paste("Bearer", api_cfg$key),
      `Content-Type` = "application/json"
    ) |>
    httr2::req_body_json(body) |>
    httr2::req_timeout(api_cfg$timeout_seconds) |>
    httr2::req_retry(max_tries = api_cfg$max_retries,
                     backoff = ~ api_cfg$rate_limit_retry_seconds) |>
    httr2::req_perform()
  t1 <- Sys.time()

  parsed <- httr2::resp_body_json(resp)

  list(
    timestamp_utc = format(t0, "%Y-%m-%dT%H:%M:%OS3", tz = "UTC"),
    duration_ms = as.numeric(difftime(t1, t0, units = "secs")) * 1000,
    model_id = model_id,
    response_text = parsed$choices[[1]]$message$content,
    finish_reason = parsed$choices[[1]]$finish_reason,
    usage = parsed$usage,
    response_hash = digest::digest(parsed$choices[[1]]$message$content, algo = "sha256"),
    raw = parsed
  )
}

# --- Birincil run (96 yanıt) ---
run_primary <- function() {
  vignettes <- load_vignettes()
  dir.create(cfg$logging$output_dir, recursive = TRUE, showWarnings = FALSE)
  log_path <- file.path(cfg$logging$output_dir,
                       paste0("primary_run_",
                              format(Sys.time(), "%Y%m%d_%H%M%S"), ".jsonl"))

  for (m in cfg$models) {
    for (vid in names(vignettes)) {
      message(sprintf("[Primary] %s | %s ...", m$name, vid))
      result <- call_llm(
        model_id = m$id,
        vignette_text = vignettes[[vid]],
        params = cfg$parameters,
        system_prompt = cfg$prompts$system,
        user_template = cfg$prompts$user_template,
        api_cfg = cfg$api
      )
      result$vignette_id <- vid
      result$run_label <- "primary"
      result$run_number <- 1L
      cat(jsonlite::toJSON(result, auto_unbox = TRUE, null = "null"), "\n",
          file = log_path, append = TRUE, sep = "")
      Sys.sleep(2)  # nezaket aralığı
    }
  }
  message("✅ Primary run tamamlandı: ", log_path)
}

# --- Reproducibility sub-study (90 yanıt) ---
run_reproducibility <- function() {
  vignettes <- load_vignettes()
  set.seed(cfg$reproducibility$seed)
  sampled <- sample(names(vignettes), cfg$reproducibility$n_vignettes_sampled)
  message("Reproducibility için seçilen vinyetler: ",
          paste(sampled, collapse = ", "))

  dir.create(cfg$logging$reproducibility_dir, recursive = TRUE, showWarnings = FALSE)
  log_path <- file.path(cfg$logging$reproducibility_dir,
                       paste0("repro_run_",
                              format(Sys.time(), "%Y%m%d_%H%M%S"), ".jsonl"))

  for (run_n in seq_len(cfg$reproducibility$runs_per_vignette)) {
    for (m in cfg$models) {
      for (vid in sampled) {
        message(sprintf("[Repro run %d] %s | %s ...", run_n, m$name, vid))
        result <- call_llm(
          model_id = m$id,
          vignette_text = vignettes[[vid]],
          params = cfg$parameters,
          system_prompt = cfg$prompts$system,
          user_template = cfg$prompts$user_template,
          api_cfg = cfg$api
        )
        result$vignette_id <- vid
        result$run_label <- "reproducibility"
        result$run_number <- run_n
        cat(jsonlite::toJSON(result, auto_unbox = TRUE, null = "null"), "\n",
            file = log_path, append = TRUE, sep = "")
        Sys.sleep(2)
      }
    }
    if (run_n < cfg$reproducibility$runs_per_vignette) {
      message(sprintf("Run %d bitti — sonraki run için %d saniye bekleniyor (≥1 saat)...",
                      run_n, cfg$reproducibility$min_gap_seconds))
      Sys.sleep(cfg$reproducibility$min_gap_seconds)
    }
  }
  message("✅ Reproducibility run tamamlandı: ", log_path)
}

# --- Çalıştır ---
if (sys.nframe() == 0L) {
  args <- commandArgs(trailingOnly = TRUE)
  mode <- if (length(args) >= 1) args[1] else "primary"
  switch(mode,
    primary       = run_primary(),
    reproducibility = run_reproducibility(),
    both          = { run_primary(); run_reproducibility() },
    stop("Mode: primary | reproducibility | both")
  )
}
