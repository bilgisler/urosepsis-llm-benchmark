# Metodoloji Özeti

## 1. Çalışma Tipi
Prospektif, kör değerlendirmeli, LLM performans karşılaştırma çalışması.

**Araştırma sorusu:** Frontier LLM'ler, ürosepsis yönetimi gibi multidisipliner (üroloji + yoğun bakım) klinik karar gerektiren senaryolarda güncel kılavuzlara uygun, güvenli ve klinik olarak doğru yanıtlar üretebilir mi?

## 2. Katılımcılar
**Yanıt verenler:** 3 frontier LLM (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1). OpenRouter API, temperature=0.0, seed=2026, zero-shot, sistem promptu yok.

**Değerlendiriciler:** 1 Üroloji Profesörü + 1 YBÜ Profesörü (≥10 yıl). 96 yanıtın tamamını bağımsız puanlar. İki farklı disiplinden değerlendirici, ürosepsisin multidisipliner doğasını yansıtır.

## 3. Vinyetler
32 klinik vinyet (16 konu × 2). Bir üroloji + bir YBÜ uzmanı ortaklaşa geliştirir. Her vinyet SSC 2026 + EAU 2026'ya dayalı altın standart yanıt anahtarına sahiptir. Content validity: 2 bağımsız klinisyen.

**16 konu:** BCG ürosepsisi, obstrükte üreter taşı, prostat/mesane kanseri, TURP sonrası sepsis, gebelikte ürosepsis, BPH postrenal ABY + sepsis, prostat biyopsisi sonrası sepsis, sondalı bakım hastası sepsis, sistektomili ileal mesane sepsis, URS kink/DJ takılamıyor, akut prostatit/prostat absesi, koroner YBÜ orşit ürosepsis, böbrek taşı pyonefroz, perirenal abse, PNL sonrası sepsis, Fournier gangreni.

## 4. Yanıt Toplama
OpenRouter API, aynı prompt, zero-shot, temperature=0.0. Yanıt süresi ve token kullanımı loglanır. Reproduktibilite: ilk 3 vinyette 2. çalıştırma ile doğrulanır.

## 5. Körleme
3 LLM yanıtı anonimize kodlarla sunulur (Yanıt A, B, C). Sıra rastgeleleştirilir. Uzunluk 800–1200 kelimeye standardize edilir. LLM ipuçları temizlenir.

## 6. Değerlendirme
**Katman 1 — Boolean:** 28 çekirdek + vinyete özgü + 8 güvenlik + 6 hallüsinasyon.

**Katman 2 — 5-Puanlık Likert:**
| Puan | Doğruluk | Kılavuz Uyumu | Güvenlik | Multidisipliner |
|---|---|---|---|---|
| 1 | Tamamen yanlış | Hiç uyumsuz | Ölümcül zarar | Tamamen yetersiz |
| 2 | Çoğunlukla yanlış | Çoğunlukla uyumsuz | Ciddi zarar | Çoğunlukla yetersiz |
| 3 | Kısmen doğru | Kısmen uyumlu | Potansiyel zarar | Kısmen yeterli |
| 4 | Çoğunlukla doğru | Çoğunlukla uyumlu | Minimal risk | Çoğunlukla yeterli |
| 5 | Tamamen doğru | Tamamen uyumlu | Güvenli | Mükemmel |

Tutarsızlık (≥2 puan): konsensüs toplantısı.

## 7. Referans Kılavuzlar
1. SSC 2026 (Prescott et al., Crit Care Med, April 2026)
2. EAU 2026 Urological Infections (Limited Update March 2026)
