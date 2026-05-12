# API Yapılandırması

## 1. Platform
OpenRouter API: `https://openrouter.ai/api/v1/chat/completions`

## 2. Modeller (2026-05 itibariyle frontier)
| Model | OpenRouter ID (placeholder, veri toplama anında kilitlenir) |
|---|---|
| GPT-5.5 | `openai/gpt-5.5` |
| Claude Opus 4.7 | `anthropic/claude-opus-4-7` |
| Gemini Pro 3.1 | `google/gemini-pro-3.1` |

> **TRIPOD-LLM gereği:** Veri toplama anında erişilen tam model ID'si, sürüm tarihi ve (varsa) model hash'i loglanıp supplement'e işlenir.

## 3. Parametreler
```json
{
  "temperature": 0.0,
  "top_p": 1.0,
  "max_tokens": 4096,
  "presence_penalty": 0.0,
  "frequency_penalty": 0.0,
  "stream": false,
  "seed": 2026
}
```
Temperature 0.0 ve sabit seed: deterministik hedef. Reasoning/thinking modu kapalı (frontier modellerin "extended thinking" gibi özellikleri devre dışı bırakılır).

## 4. Prompt (Free-Recall, Pre-Registered)
**System prompt:** Yok (sistem promptu varyasyonu kontrolünü en aza indirmek için boş bırakılır).

**User prompt (kilitli şablon):**
```
Sen deneyimli bir yoğun bakım uzmanı ve üroloji uzmanısın. Aşağıdaki klinik senaryoyu oku.

Bu hastanın yoğun bakım kabul anından itibaren ilk 6 saatlik yönetim planını detaylı olarak açıkla. Her önerini gerekçelendir ve dayandığın güncel kanıta dayalı kılavuz önerilerini açıkça belirt.

[VİNYET METNİ]
```

> **Önemli:** Alt başlıklar (hemodinamik / antibiyoterapi / kaynak kontrolü / adjuvan) verilmiyor. LLM'in proaktif olarak bu boyutları ele alması bir performans göstergesidir.

## 5. Reproducibility Sub-Study
- Random seed (R: `set.seed(2026)`) ile 32 vinyetten 10 vinyet seçilir.
- Her seçilen vinyet × 3 LLM × 3 run = **90 ek yanıt**.
- Run'lar arasında ≥1 saat boşluk bırakılır.
- Intra-model Krippendorff's α hesaplanır (Likert için ordinal, Boolean için nominal).

## 6. Loglama (Her API çağrısı için kaydedilen alanlar)
- UTC timestamp (ISO 8601, milisaniye)
- Model ID + sürüm + (varsa) hash
- Vinyet kodu (V01-V32) + run numarası
- Raw user prompt + raw response (JSON)
- Token kullanımı (prompt + completion + total)
- Yanıt süresi (ms)
- finish_reason
- Cost (USD)

Tüm log JSON satır formatında (`logs/run_YYYYMMDD.jsonl`). Public repo'ya **anonim** olarak (API key olmadan) yüklenir.

## 7. Hata Yönetimi
- HTTP 429 (rate limit): 60 sn bekle, max 3 retry
- HTTP 5xx: 120 sn bekle, max 3 retry
- `finish_reason=length`: max_tokens → 8192 ile tek retry; hâlâ length ise yanıt eksik kabul edilir
- LLM refusal ("yanıt veremem", "bu soruyu cevaplayamam"): 2 ek deneme; üç başarısızlıkta missing data (TRIPOD-LLM uyarınca raporlanır)

## 8. Maliyet Tahmini
- Birincil: 3 model × 32 vinyet = 96 çağrı
- Reproducibility: 3 model × 10 vinyet × 3 run = 90 çağrı
- **Toplam: 186 API çağrısı**
- Frontier modellerle ortalama ~2-4K input + ~1-2K output token → **tahmini ~$80-200 USD**
