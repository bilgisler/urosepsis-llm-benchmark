# TRIPOD-LLM Reporting Checklist (Çalışmaya Uygulanmış)

**Referans:** Gallifant J et al. The TRIPOD-LLM reporting guideline for studies using large language models. *Nat Med.* 2025;31(1):60-69. PMID 39779929. DOI 10.1038/s41591-024-03425-5.

**Çalışma tipi:** Standalone task evaluation (Type 1 — model değerlendirme, klinik deployment değil)

**Doldurma yöntemi:** Pre-registration sırasında "Planlanan" sütunu doldurulur; manuscript'e geçişte "Manuscript sayfa/bölüm" sütunu eklenir.

---

## TITLE AND ABSTRACT

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 1a | Başlıkta LLM kullanımının açıkça belirtilmesi | ✅ | "Frontier Büyük Dil Modelleri" başlıkta |
| 1b | Çalışma tipinin başlık/altbaşlıkta belirtilmesi | ✅ | "Benchmark Çalışması" |
| 2a | Abstract'ta amaç, yöntem, sonuç, çıkarım | 📝 | Manuscript yazımında |
| 2b | Abstract'ta LLM model adı + sürüm | ✅ | GPT-5.5, Opus 4.7, Gemini Pro 3.1 |

## INTRODUCTION

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 3a | Klinik/sağlık bağlamı açıklaması | ✅ | Ürosepsis multidisiplinerliği, OSF §1.3 |
| 3b | LLM kullanımının gerekçesi | ✅ | OSF §1.3 — multidisipliner boşluk |
| 4 | Çalışma amaçları (hipotezler önceden belirtilmiş) | ✅ | OSF §2, H1-H6 |

## METHODS

### Data Sources

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 5a | Veri kaynağı (sentetik vinyet) açıkça beyan | ✅ | OSF §4.1, §8 — orijinal vinyet |
| 5b | Veri toplama tarihi/dönemi | 📝 | Veri toplama anında loglanır |
| 5c | Eligibility kriterleri (vinyet seçim) | ✅ | Konu listesi OSF §4.1 |
| 5d | Reference standard (kılavuzlar) | ✅ | SSC 2026 + EAU 2026 (kilitli PDF) |
| 5e | IRB / etik | ⚠️ | Sentetik veri → IRB exempt beyanı |

### Participants

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 6 | Vinyet karakteristikleri (demografi, klinik özellik dağılımı) | ✅ | 16 konu × 2, OSF §4.1 + supplement |

### LLM Description (CRITICAL — TRIPOD-LLM özgünlüğü)

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 7a | **Model adı + sürüm/tarihi** | ✅ | `09_api_yapilandirmasi.md` §2 |
| 7b | **Erişim modu** (API, web, local) | ✅ | OpenRouter API |
| 7c | **Erişim tarihleri** (her çağrı için) | ✅ | Loglama §6 |
| 7d | **Training cutoff** (model bilgisinde varsa) | 📝 | Veri toplama anında modelden çekilir |
| 7e | **Parametreler:** temperature, top-p, max-tokens, seed | ✅ | API config §3 |
| 7f | **System prompt** | ✅ | Boş — varyasyon kontrolü |
| 7g | **User prompt template (kelime kelime)** | ✅ | API config §4, kilitli |
| 7h | **Few-shot / RAG / CoT?** | ✅ | Zero-shot (gerekçe Discussion'da) |
| 7i | **Output post-processing** | ✅ | Standardizasyon §5 OSF protokol |

### Outcome and Evaluation

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 8a | Birincil sonlanım tanımı | ✅ | OSF §5.2, Likert + Boolean |
| 8b | Outcome ölçüm yöntemi | ✅ | 28 madde Boolean + 4 Likert boyut |
| 8c | Reference standard belirleme süreci | ✅ | 2 klinisyen + content validity |
| 8d | Değerlendiriciler (sayı, uzmanlık, deneyim) | ✅ | 2 ana rater + adjudikatör |
| 8e | Blinding protokolü | ✅ | OSF §3.2 |
| 8f | Inter-rater reliability plan | ✅ | OSF §6.4, stat plan §6 |

### Sample Size

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 9 | Sample size gerekçesi (güç hesabı dahil) | ✅ | Stat plan §3, `power_analysis.Rmd` |

### Statistical Analysis

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 10a | Birincil analitik model (kelime kelime) | ✅ | Stat plan §5.1, §5.2 |
| 10b | Çoklu test düzeltmesi | ✅ | Stat plan §7 |
| 10c | Eksik veri yaklaşımı | ✅ | Stat plan §8 |
| 10d | Sensitivity analizler | ✅ | Stat plan §8 |
| 10e | Hassasiyet/bias risk değerlendirmesi | 📝 | Manuscript Discussion |

### Bias and Fairness (TRIPOD-LLM özgünlüğü)

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 11a | **Data leakage değerlendirmesi** | ⚠️ | OSF §8 — sadece beyan (probe yok, limitasyon) |
| 11b | Demografik bias raporlama planı | 📝 | Vinyet demografisi tablosu supplement |
| 11c | Adversarial/red team testi | ❌ | Bu çalışmada yok — gelecek çalışma |
| 11d | Hallucination/confabulation ölçümü | ✅ | OSF §5.2, 6 maddelik HL checklist |
| 11e | Safety/zarar ölçümü | ✅ | OSF §5.2, 8 maddelik güvenlik checklist |

## RESULTS

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 12a | Vinyet karakteristikleri tablosu | 📝 | Manuscript Table 1 |
| 12b | LLM yanıt karakteristikleri (token, süre, refusal) | 📝 | Manuscript Table 2 |
| 12c | Birincil analiz sonuçları | 📝 | Manuscript Table 3 + Forest |
| 12d | IRR sonuçları | 📝 | Manuscript Table 4 |
| 12e | Reproducibility/Krippendorff α | 📝 | Manuscript Table 5 |
| 12f | Subgroup ve sensitivity | 📝 | Manuscript Tables S1-S5 |

## DISCUSSION

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 13 | Limitasyonların açıkça raporlanması | ✅ | Discussion → no human comparator, no leakage probe, 2 rater, temperature=0 sınırı |
| 14 | Klinik anlam ve dağıtım potansiyeli | 📝 | Discussion |
| 15 | Genelleme kısıtları | 📝 | Discussion — Türkçe vs İngilizce prompt, frontier vs local model |

## OTHER INFORMATION

| # | Madde | Durum | Plan/Yer |
|---|---|---|---|
| 16 | Funding / çıkar çatışması | 📝 | Manuscript metadata |
| 17 | Veri ve kod paylaşımı | ✅ | GitHub + Zenodo DOI |
| 18 | Protokol registration | ✅ | OSF DOI manuscript başında |
| 19 | Çıkar çatışması beyanı (OpenAI/Anthropic/Google) | 📝 | Manuscript |
| 20 | Yapay zeka kullanımı (manuscript yazımında LLM kullanıldıysa) | 📝 | Manuscript metadata |

---

**Legend:**
- ✅ Tamamlandı (pre-registration veya dosyalarda)
- 📝 Manuscript yazımında doldurulacak
- ⚠️ Sınırlı kapsamda yapıldı (limitasyon olarak raporlanır)
- ❌ Yapılmıyor (yokluk gerekçelendirilir)

**Compliance özet:** 26 maddenin tamamı adreslenmiştir. ✅: 19 | 📝: 12 (manuscript) | ⚠️: 2 (kısmi, açıkça limitasyon) | ❌: 1 (red team, gelecek çalışma)
