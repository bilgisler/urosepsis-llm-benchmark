# Urosepsis LLM Benchmark

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20133737.svg)](https://doi.org/10.5281/zenodo.20133737)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Frontier Büyük Dil Modellerinin Ürosepsis Yönetiminde Multidisipliner Klinik Karar Destek Performansı — SSC 2026 ve EAU 2026 Kılavuz Bazlı Kör Benchmark Çalışması

> **Archived on Zenodo:** [10.5281/zenodo.20133737](https://doi.org/10.5281/zenodo.20133737) (concept DOI, points to latest version)
> **Pre-registered on OSF:** *[DOI eklenecek]*
> **Reporting:** TRIPOD-LLM (Nat Med 2025, PMID 39779929) + CHART (BMJ Open 2024, PMID 38772889)
> **License:** Code MIT, Data + Vignettes CC-BY 4.0

---

## Hızlı Bakış

| Bileşen | Değer |
|---|---|
| Tasarım | Prospektif, çift-kör, benchmark karşılaştırma |
| LLM | 3 frontier (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1) |
| Vinyet | 32 (16 ürosepsis konusu × 2) |
| Rater | 2 ana (üro + YBÜ) + 1 adjudikatör (enf. hast.) |
| Kılavuz | SSC 2026 (Apr 2026) + EAU 2026 Urological Infections (Mar 2026) |
| Birincil analiz | CLMM (Likert) + GLMM-binomial (Boolean) |
| Reporting | TRIPOD-LLM + CHART + STROBE |

## Dizin Yapısı

```
urosepsis-llm-benchmark/
├── README.md                         <- Bu dosya
├── LICENSE                           <- MIT (kod) + CC-BY-4.0 (data)
├── CITATION.cff                      <- Atıf bilgisi
├── .gitignore
│
├── protocol/                         <- OSF pre-registration ve protokoller
│   ├── 01_osf_pre_registration.md
│   ├── 02_methodology_summary.md
│   ├── 03_statistical_analysis_plan.md
│   ├── 04_irr_adjudication_protocol.md
│   └── 05_data_management_plan.md
│
├── vignettes/                        <- 32 klinik vinyet (kilitli)
│   ├── README.md
│   ├── locked_hash.txt               <- SHA256 hash (değişmezlik kanıtı)
│   ├── v01_bcg_urosepsis_a.md
│   ├── ... (V01-V32)
│   └── gold_standard/                <- Altın standart yanıt anahtarları
│
├── data/
│   ├── raw_responses/                <- 96 + 90 LLM yanıtı (JSON)
│   │   ├── primary_run/              <- 96 birincil
│   │   └── reproducibility_run/      <- 90 reproducibility
│   ├── processed/
│   │   ├── standardized_responses/   <- Anonimize, A/B/C
│   │   ├── rater_scores.csv          <- Boolean + Likert
│   │   └── adjudication_log.csv
│   └── checklists/
│       ├── boolean_28_core.md        <- Çekirdek 28 madde
│       ├── boolean_vignette_specific.md
│       ├── safety_8items.md
│       └── hallucination_6items.md
│
├── scripts/
│   ├── 01_collection/
│   │   ├── api_collect.R             <- OpenRouter API çağrıları
│   │   ├── config.yaml               <- Model ID, params (API key git'e DAHİL DEĞİL)
│   │   └── log_template.json
│   ├── 02_standardization/
│   │   ├── deidentify.R              <- LLM ipuçlarını temizle
│   │   ├── randomize_abc.R           <- A/B/C kodlama
│   │   └── word_count_normalize.R    <- 800-1200 kelime
│   ├── 03_analysis/
│   │   ├── 01_power_analysis.Rmd     <- simr ile güç hesabı
│   │   ├── 02_descriptive.Rmd        <- Yanıt karakteristikleri
│   │   ├── 03_primary_clmm.Rmd       <- Birincil CLMM
│   │   ├── 04_primary_glmm.Rmd       <- Birincil GLMM-binomial
│   │   ├── 05_irr.Rmd                <- ICC + Gwet AC2 + κ
│   │   ├── 06_safety_hallucination.Rmd
│   │   ├── 07_reproducibility.Rmd    <- Krippendorff α
│   │   ├── 08_subgroup_explore.Rmd   <- 16 konu + IRT 2PL
│   │   └── 99_session_info.R
│   └── 04_figures/
│       ├── fig01_overview_boxplot.R
│       ├── fig02_heatmap_boolean.R
│       ├── fig03_forest_topics.R
│       ├── fig04_radar_domains.R
│       └── fig05_hallucination_bars.R
│
├── results/
│   ├── tables/                       <- Manuscript tabloları (auto-generated)
│   └── figures/                      <- Manuscript figürleri (auto-generated)
│
├── supplement/
│   ├── tripod_llm_checklist.md
│   ├── chart_checklist.md
│   ├── ssc_2026_locked.pdf
│   ├── eau_2026_locked.pdf
│   ├── power_simulation_results.csv
│   └── randomization_seeds.txt
│
└── docs/                             <- GitHub Pages için ek dokümantasyon
    ├── how_to_reproduce.md
    └── faq.md
```

## Nasıl Çoğaltılır

### 1. Ortam kurulumu
```bash
git clone https://github.com/bilgisler/urosepsis-llm-benchmark.git
cd urosepsis-llm-benchmark
```

R ortamı:
```r
renv::restore()  # renv.lock'tan paketleri kur
```

### 2. API anahtarı
```bash
cp scripts/01_collection/config.yaml.example scripts/01_collection/config.yaml
# OPENROUTER_API_KEY değerini doldur
```

> ⚠️ `config.yaml` `.gitignore`'da. Asla commit etmeyin.

### 3. Veri toplama (opsiyonel — tüm 186 yanıt zaten `data/raw_responses/`'da)
```r
source("scripts/01_collection/api_collect.R")
```

### 4. Analiz akışı
```r
# Sırasıyla:
rmarkdown::render("scripts/03_analysis/01_power_analysis.Rmd")
rmarkdown::render("scripts/03_analysis/02_descriptive.Rmd")
rmarkdown::render("scripts/03_analysis/03_primary_clmm.Rmd")
rmarkdown::render("scripts/03_analysis/04_primary_glmm.Rmd")
rmarkdown::render("scripts/03_analysis/05_irr.Rmd")
rmarkdown::render("scripts/03_analysis/06_safety_hallucination.Rmd")
rmarkdown::render("scripts/03_analysis/07_reproducibility.Rmd")
rmarkdown::render("scripts/03_analysis/08_subgroup_explore.Rmd")
```

## Reproducibility Statement

- R sürümü: ≥4.4
- `renv` ile paket sürümleri kilitli (`renv.lock`)
- Tüm `set.seed()` çağrıları script'lerde sabit (`2026`)
- LLM yanıtları zaten alınmış; yeni API çağrısı yapmaya gerek yok
- 90 reproducibility yanıtının her biri farklı saat dilimlerinde alınmıştır (intra-model determinism testi)

## Veri ve Etik

- Tüm vinyetler sentetiktir; gerçek hasta verisi yoktur
- IRB exempt (kurum belgesi `supplement/` içinde)
- Tüm LLM yanıtları **anonim** olarak paylaşılır (API anahtarı, kullanıcı kimlik bilgisi yok)
- Vinyetler ve checklist'ler CC-BY 4.0 ile lisanslanmıştır → türev/replikasyon serbest

## Çıkar Çatışması

Yazarların OpenAI, Anthropic, Google ile mali ilişkisi yoktur (varsa açıkça beyan edilir).
Hiçbir LLM provider çalışmanın tasarımına, veri toplama veya analizine katkıda bulunmamıştır.

## Atıf

Çalışmayı kullanırsanız lütfen şu şekilde atıf yapın:

**Repo / dataset citation (Zenodo):**

```bibtex
@software{bayraktar_urosepsis_llm_benchmark_2026,
  author    = {Bayraktar, Yeşim and İşler, Bilgi and Bayraktar, Ahmet Murat},
  title     = {Urosepsis LLM Benchmark — Multidisciplinary Clinical Decision
               Support Performance of Frontier Large Language Models},
  year      = {2026},
  publisher = {Zenodo},
  version   = {v0.1.2},
  doi       = {10.5281/zenodo.20133737},
  url       = {https://doi.org/10.5281/zenodo.20133737},
  note      = {OSF pre-registration: [DOI eklenecek]}
}
```

**Manuscript citation (yayınlandıktan sonra eklenecek):**

```bibtex
@article{bayraktar_urosepsis_llm_benchmark_manuscript,
  author  = {Bayraktar, Yeşim and İşler, Bilgi and Bayraktar, Ahmet Murat},
  title   = {Multidisciplinary Clinical Decision Support Performance of Frontier
             Large Language Models in Urosepsis Management},
  journal = {[Dergi — yayınlandığında]},
  year    = {2026},
  doi     = {[Manuscript DOI — yayınlandığında]},
  note    = {Zenodo: 10.5281/zenodo.20133737; OSF: [OSF DOI]}
}
```

## Yazarlar ve Kontakt

| Sıra | Ad Soyad | Kurum | ORCID | Email |
|---|---|---|---|---|
| 1 (PI / Corresponding) | Yeşim Bayraktar | Selçuk University Faculty of Medicine, Department of Intensive Care | [0000-0001-5156-7064](https://orcid.org/0000-0001-5156-7064) | bayraktaryesim83@gmail.com |
| 2 | Bilgi İşler | Department of Urology, Konya City Hospital, University of Health Sciences | [0000-0003-1243-9072](https://orcid.org/0000-0003-1243-9072) | bilgi.isler249@gmail.com |
| 3 | Ahmet Murat Bayraktar | Department of Urology, Konya City Hospital, University of Health Sciences | [0000-0002-4913-8698](https://orcid.org/0000-0002-4913-8698) | drahmetbayraktar@gmail.com |

- **Corresponding Author:** Yeşim Bayraktar — bayraktaryesim83@gmail.com
- **Issues:** [GitHub Issues](https://github.com/bilgisler/urosepsis-llm-benchmark/issues)
