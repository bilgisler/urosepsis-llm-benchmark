# CHART (Chatbot Assessment Reporting Tool) Checklist

**Referans:** Protocol for the development of the Chatbot Assessment Reporting Tool (CHART) for clinical advice. *BMJ Open* 2024;14(5):e081155. PMID 38772889. DOI 10.1136/bmjopen-2023-081155.

> **Not:** CHART, TRIPOD-LLM'in tamamlayıcısıdır. Bu checklist özellikle chatbot/LLM'in **clinical advice** vermesini değerlendiren çalışmalar için tasarlanmıştır. Aşağıdaki maddeler CHART pilot kılavuzuna göre adapte edilmiştir.

---

## TITLE & ABSTRACT

| # | Madde | Plan |
|---|---|---|
| 1 | Başlık: chatbot/LLM klinik tavsiye değerlendirmesi olduğu açık | ✅ "Klinik Karar Destek Performansı" |
| 2 | Abstract: 3 LLM, vinyet sayısı, kılavuz referansı | ✅ |

## INTRODUCTION

| # | Madde | Plan |
|---|---|---|
| 3 | Klinik gereksinim ve LLM rolünün açıklanması | ✅ OSF §1.3 |
| 4 | Hipotezler/sorular pre-spec | ✅ OSF §2 |

## METHODS — CHATBOT/LLM DESCRIPTION

| # | Madde | Plan |
|---|---|---|
| 5a | Chatbot/LLM ürün adı + sürüm + üretici | ✅ GPT-5.5/OpenAI, Opus 4.7/Anthropic, Pro 3.1/Google |
| 5b | Erişim modalitesi (web, API, mobil) | ✅ API (OpenRouter) |
| 5c | Erişim tarihi (her sorgu) | ✅ Loglama |
| 5d | Kullanıcı arayüzü vs API ayrımı | ✅ API-only |
| 5e | Multimodal mı? (görsel, ses) | ✅ Text-only |
| 5f | Chatbot'un eğitim verisi sınırları | 📝 Discussion |
| 5g | LLM safety/refusal filtreleri | 📝 Discussion |

## METHODS — QUERY DESIGN

| # | Madde | Plan |
|---|---|---|
| 6a | Sorgu/prompt tasarımı (kelime kelime) | ✅ API config §4 |
| 6b | Tek-turlu vs çok-turlu konuşma | ✅ Tek-turlu (single-shot) |
| 6c | Bağlam pencere yönetimi | ✅ Her vinyet bağımsız |
| 6d | Dil (Türkçe/İngilizce) | ✅ Türkçe (uygulama dili) |
| 6e | Sorgu kelime/karakter sınırı | ✅ Vinyet ~400-800 kelime |
| 6f | Tekrar sorgu protokolü | ✅ Reproducibility sub-study |

## METHODS — EVALUATION

| # | Madde | Plan |
|---|---|---|
| 7a | Reference standard (kılavuz) | ✅ SSC 2026 + EAU 2026 |
| 7b | Outcome ölçüm aracı (Boolean + Likert) | ✅ §5 OSF |
| 7c | Doğruluk + tamlık + güvenlik ayrı ayrı ölçüldü mü? | ✅ 4 Likert boyut + 8 güvenlik + 6 hallüsinasyon |
| 7d | Klinik açıdan tehlikeli yanıt tanımı | ✅ §C güvenlik checklist |
| 7e | Hallucination tanımı ve ölçümü | ✅ §D hallüsinasyon checklist |
| 7f | Değerlendiriciler (sayı, uzmanlık) | ✅ 2 prof + 1 adjudikatör |
| 7g | Blinding | ✅ OSF §3.2 |

## METHODS — STATISTICAL

| # | Madde | Plan |
|---|---|---|
| 8a | Birincil analiz modeli | ✅ CLMM + GLMM, stat plan §5 |
| 8b | Multiple comparison correction | ✅ Holm-Bonferroni |
| 8c | Inter-rater reliability | ✅ ICC + Gwet AC2 + weighted κ |
| 8d | Eksik veri / refusal yönetimi | ✅ Stat plan §8 |
| 8e | Reproducibility analizi | ✅ Krippendorff α, 10 vinyet × 3 run |

## RESULTS

| # | Madde | Plan |
|---|---|---|
| 9a | Yanıt başarı oranı (refusal dahil) | 📝 Manuscript Table 2 |
| 9b | Yanıt uzunluğu, süre, token | 📝 Manuscript Table 2 |
| 9c | LLM'ler arası performans karşılaştırma sonuçları | 📝 Tables 3-5 |
| 9d | Hallucination/safety olaylarının nitel örnekleri | 📝 Supplement vignettes |
| 9e | IRR sonuçları | 📝 Table 4 |
| 9f | Reproducibility sonuçları | 📝 Table 5 |

## DISCUSSION

| # | Madde | Plan |
|---|---|---|
| 10a | Klinik anlam | 📝 Discussion |
| 10b | Limitasyonlar (özellikle generalizability) | 📝 Discussion |
| 10c | LLM sürüm değişimi riski (zaman geçtikçe model değişir) | 📝 Discussion |
| 10d | Türkçe dil performansı kısıtı | 📝 Discussion — uygulama dili |
| 10e | Klinik deployment için öneriler | 📝 Discussion |

## OTHER

| # | Madde | Plan |
|---|---|---|
| 11 | Veri + kod açık paylaşım | ✅ GitHub + Zenodo |
| 12 | Funding ve çıkar çatışması | 📝 Manuscript |
| 13 | LLM provider ile ilişki bildirme | 📝 Disclosure |
| 14 | Etik onay (sentetik veri) | 📝 IRB exempt mektubu |

---

## CHART vs TRIPOD-LLM Tamamlayıcılık Matrisi

| Konu | TRIPOD-LLM | CHART | Bu çalışmada |
|---|---|---|---|
| Model adı/sürüm | ✅ | ✅ | Her ikisinde belgelendi |
| Erişim modalitesi | ✅ | ✅ | API, OpenRouter |
| Prompt design | ✅ | ✅✅ (daha detaylı) | API config §4 |
| Chatbot safety filtreleri | — | ✅ | Discussion'da |
| Multi-turn vs single-turn | — | ✅ | Single-turn (CHART maddesi 6b) |
| Hallucination | ✅ | ✅ | 6 madde HL |
| Calibration | ✅ | — | Stat plan keşifsel |
| Klinik deployment risk | — | ✅ | Discussion |

**Karar:** Her iki standardın da supplement olarak verilmesi Q1-yakın metodoloji standardı sağlar.
