# Çalışma Planı

## Başlık
Ürosepsis Yönetiminde Büyük Dil Modellerinin Multidisipliner Klinik Karar Destek Performansı: Kılavuz Bazlı Kör Değerlendirme Çalışması

## 1. Araştırma Sorusu
**Birincil:** 3 frontier LLM, 16 farklı ürosepsis senaryosunda SSC 2026 ve EAU 2026 kılavuzlarına uygun yanıtlar üretebilir mi ve aralarında performans farkı var mıdır?

**İkincil:** Güvenlik profili; hallüsinasyon sıklığı/türleri; üroloji vs YBÜ değerlendirici perspektif farkı; konu ve zorluk bazlı performans değişimi; ürolojik (kaynak kontrolü) vs yoğun bakım (hemodinamik) bileşenlerinde performans farkı.

## 2. Akış
```
HAZIRLIK (6 hafta)
├── 32 vinyet geliştirme + altın standart + Boolean checklist
├── Content validity (2 bağımsız klinisyen)
└── OpenRouter API kurulumu

VERİ TOPLAMA (1 hafta)
└── 3 LLM × 32 vinyet = 96 yanıt + reproduktibilite kontrolü

KÖR DEĞERLENDİRME (5 hafta)
├── Standardizasyon ve anonimizasyon
├── 2 değerlendirici × 96 yanıt (Boolean + Likert)
└── Konsensüs toplantısı

ANALİZ + MAKALE (4 hafta)
```
**Toplam: ~16 hafta**

## 3. Katılımcılar
| Rol | N |
|---|---|
| LLM (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1) | 3 |
| YBÜ Profesörü (değerlendirici) | 1 |
| Üroloji Profesörü (değerlendirici) | 1 |
| Vinyet geliştiriciler | 2 |
| Content validity paneli | 2 |
| Standardizasyon editörü | 1 |
| **Toplam ekip** | **~7** |

## 4. 32 Vinyet Konu Dağılımı
| No | Konu | Vinyetler |
|---|---|---|
| 1 | BCG Ürosepsisi | V01–V02 |
| 2 | Obstrükte Üreter Taşı | V03–V04 |
| 3 | Prostat/Mesane Kanseri | V05–V06 |
| 4 | TURP Sonrası Sepsis | V07–V08 |
| 5 | Gebelikte Ürosepsis | V09–V10 |
| 6 | BPH Postrenal ABY + Sepsis | V11–V12 |
| 7 | Prostat Biyopsisi Sonrası Sepsis | V13–V14 |
| 8 | Sondalı Bakım Hastası Sepsis | V15–V16 |
| 9 | Sistektomili İleal Mesane Sepsis | V17–V18 |
| 10 | URS + Kink DJ Takılamıyor | V19–V20 |
| 11 | Akut Prostatit Prostat Absesi | V21–V22 |
| 12 | Koroner YBÜ Orşit Ürosepsis | V23–V24 |
| 13 | Böbrek Taşı Pyonefroz | V25–V26 |
| 14 | Perirenal Abse | V27–V28 |
| 15 | PNL Sonrası Sepsis | V29–V30 |
| 16 | Fournier Gangreni | V31–V32 |

## 5. Raporlanacak Sonuçlar
**Tablolar:** LLM model bilgileri; Likert puanları 3 LLM × 4 kategori; Friedman sonuçları; post-hoc; Boolean uyum yüzdeleri (genel + alt başlık + konu bazlı); güvenlik ihlalleri; hallüsinasyon türleri/sıklıkları; üroloji vs YBÜ değerlendirici farkı; inter-rater reliability.

**Görseller:** Kutu grafikleri, ısı haritası (28 Boolean × 3 LLM), radar grafik, hallüsinasyon çubuk grafik, konu bazlı performans grafiği.

## 6. Hedef Dergiler
| Dergi | Gerekçe |
|---|---|
| European Urology Focus | EAU kılavuz, multidisipliner, 32 vinyet kapsamlı |
| BJU International | Dijital üroloji |
| World Journal of Urology | Ürosepsis + teknoloji |
| JMIR | Tıp bilişimi |

## 7. Güçlü Yanlar
- Ürosepsis + YBÜ + LLM kesişiminde literatürde ilk
- 32 vinyet, 16 farklı ürosepsis konusu — kapsamlı
- SSC 2026 (Nisan 2026) referans: güncellik avantajı
- Multidisipliner değerlendirme: üroloji + YBÜ ayrı perspektif
- Boolean + Likert + hallüsinasyon analizi üçlü değerlendirme
- Yapılabilir tasarım (~7 kişilik ekip, ~16 hafta)

## 8. Limitasyonlar
- Doktor karşılaştırma kolu yok
- 2 değerlendirici
- Temperature 0.0 gerçek kullanıcı deneyimini tam yansıtmaz
- LLM versiyonları zamana bağlı güncellenir
- EAU 2026 ürosepsis bölümü revizyon altında
