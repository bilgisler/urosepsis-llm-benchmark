# Adjudikatör Daveti ve Inter-Rater Reliability Protokolü

> Bu doküman iki bölümden oluşur:
> 1. **Resmi davet metni** (enfeksiyon hastalıkları / klinik mikrobiyolog uzmanına e-posta ile gönderilir)
> 2. **IRR ve adjudikasyon prosedürü** (tüm rater'ların imzalayacağı protokol)

---

## BÖLÜM 1 — ADJUDİKATÖR DAVET METNİ (E-posta Şablonu)

**Konu:** Ürosepsis LLM Benchmark Çalışması — Adjudikatör Davet

**Sayın Prof. Dr. [Ad Soyad],**

Yürütmekte olduğumuz "**Frontier Büyük Dil Modellerinin Ürosepsis Yönetiminde Multidisipliner Klinik Karar Destek Performansı**" başlıklı, OSF'e pre-registered (DOI: [---]) prospektif benchmark çalışmamızda **adjudikatör** olarak yer almanızı rica ederiz.

### Çalışmanın özeti
- **Tasarım:** Prospektif, çift-kör, benchmark karşılaştırma
- **Materyal:** 32 ürosepsis klinik vinyeti × 3 frontier LLM (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1) = 96 yanıt
- **Referans kılavuzlar:** SSC 2026 (Prescott et al., Crit Care Med, Apr 2026) + EAU 2026 Urological Infections
- **Ana değerlendiriciler:** 1 üroloji profesörü + 1 yoğun bakım profesörü (her ikisi ≥10 yıl)
- **Reporting:** TRIPOD-LLM (Nat Med 2025) + CHART (BMJ Open 2024)
- **Hedef dergi:** JMIR AI / JMIR Med Inform / World J Urol / Front Digit Health

### Adjudikatör rolü ve iş yükü
**Rolünüz:** Ana iki rater (üro + YBÜ) arasında ≥2 puan Likert farkı veya Boolean uyumsuzluk olduğunda **bağımsız, kör** olarak puanlamak. Final puan sizin değerlendirmenizdir.

**Beklenen iş yükü:**
- Anketlerinize tahminen yanıtların %15-25'i (=15-25 yanıt) düşecektir
- Her yanıt: ~10-15 dk değerlendirme (800-1200 kelime + 28 Boolean + 4 Likert + 8 güvenlik + 6 hallüsinasyon)
- **Toplam tahmini zaman: 4-6 saat, ~3 hafta'ya yayılmış**

### Disiplin yetkinliği gerekçesi
Ürosepsis tedavisinde **ampirik antibiyotik seçimi**, **rezistans profili (ESBL, MRSA)**, **kaynak kontrolü zamanlaması ile antimikrobiyal stratejinin entegrasyonu** kritik karar noktalarıdır. Üroloji ve yoğun bakım perspektifleri arasında muhtemel uyumsuzlukların çözümünde **enfeksiyon hastalıkları / klinik mikrobiyolog** uzmanlığı yansız ve uzman bakış sağlayacaktır.

### Yazarlık ve katkı
- **Yazarlık:** Çalışma manuscript'inde **co-author** olarak yer alacaksınız (ICMJE kriterleri karşılanır: substantial contribution to data interpretation + critical revision + final approval)
- **Veri ve kod paylaşımı:** Tüm veri ve kodlar GitHub + Zenodo'da CC-BY 4.0 ile açık paylaşılacak
- **OSF pre-registration:** Co-author olarak listelenir
- **Acknowledgments:** Çalışmaya başlamadan önce **OSF pre-registration güncellemesinde** isminiz eklenir

### Zaman çizelgesi
| Hafta | Sizden beklenen |
|---|---|
| 1-6 | Yok (vinyet hazırlık + content validity) |
| 7-8 | Yok (veri toplama + standardizasyon) |
| 9 | **Kalibrasyon toplantısı** (1 saat): rubrik, Boolean tanımları, örnek vinyet (V01 üzerinden) — 2 ana rater + siz |
| 9-11 | Yok (ana rater'lar 96 yanıtı bağımsız puanlar) |
| 12-13 | **Adjudikasyon dönemi** (4-6 saat toplam): uyumsuz yanıtları bağımsız puanlama |
| 14 | **Konsensüs toplantısı** (1 saat): genel bulgular, hallüsinasyon türleri |
| 15-16 | Manuscript yazımına katkı + final approval |

### Materyaller (davet kabulü sonrası paylaşılır)
- OSF pre-registration tam metni
- 32 vinyet + altın standart yanıtlar
- Boolean checklist (28 madde + 8 güvenlik + 6 hallüsinasyon)
- 5-puanlık Likert rubrik (4 boyut)
- Anonimleştirme protokolü (rater'lar A/B/C kodlarını görür, LLM kimliklerini değil)
- Web tabanlı puanlama formu (REDCap veya benzeri)

### Sonraki adım
Bu daveti **kabul etmeniz** durumunda, sizin için bir **20 dk video görüşme** ayarlayıp soruları yanıtlayabiliriz. Lütfen [tarih] tarihine kadar yanıt verebilirseniz çalışma planlamasını kilitleyebiliriz.

Teşekkürler ve saygılar,

**[PI Ad Soyad]**
[Unvan, Kurum]
[email] | [telefon]
OSF: [DOI link] | GitHub: [link]

---

## BÖLÜM 2 — INTER-RATER RELIABILITY (IRR) VE ADJUDİKASYON PROTOKOLÜ

### 2.1 Rater Profilleri (final lock)
| Rol | Disiplin | Deneyim | Sertifika | Görev kapsamı |
|---|---|---|---|---|
| Rater 1 (R1) | Üroloji | ≥10 yıl prof. | EAU member | Tüm 96 yanıt × tüm madde |
| Rater 2 (R2) | Yoğun Bakım | ≥10 yıl prof. | ESICM/SCCM member | Tüm 96 yanıt × tüm madde |
| Adjudikatör (R3) | Enf. Hast. / Klinik Mikrobiyoloji | ≥10 yıl prof. | — | Sadece tutarsız yanıtlar |

### 2.2 Kör Değerlendirme Garantileri
- **A/B/C kodlama:** Standardizasyon editörü (ekipte 7. kişi) randomize ataması yapar; rater'lar A/B/C arasındaki LLM eşlemesini görmez
- **LLM ipuçları temizliği:** "GPT", "Claude", "Gemini", "OpenAI", "Anthropic", "Google" gibi kelimeler, karakteristik biçimlendirme (örn. Claude'un başlık stili) standardize edilir
- **Uzunluk standardize:** Tüm yanıtlar 800-1200 kelime aralığında
- **Sıra rastgeleleştirme:** Her vinyet için bağımsız A/B/C permutation; randomization seed OSF supplement'inde

### 2.3 Kalibrasyon Toplantısı (Hafta 9, ~1 saat)
**Katılımcılar:** R1, R2, R3, PI, biostatistician.

**Gündem:**
1. (15 dk) Rubrik review — 4 Likert boyut tanımları, sınır örnekleri
2. (20 dk) Boolean checklist madde madde walk-through — özellikle ambigü maddeler
3. (15 dk) **Örnek vinyet (V01) pilotu** — herkes bağımsız puanlar, sonra karşılaştırılır
4. (10 dk) Kalıcı sorular, Slack/email kanalı kurulumu

**Çıktı:** Kalibrasyon notları (`calibration_notes_YYYYMMDD.md`) — repo'ya commit edilir.

> **NOT:** Kalibrasyon sırasında ortaya çıkan rubrik açıklığı eksiklikleri, çalışma başlamadan **rubriğe işlenir** ve OSF protokolüne minor amendment olarak eklenir. Veri toplama başladıktan sonra rubrik değişmez.

### 2.4 Puanlama Akışı
```
[Anonimize yanıt — A/B/C]
         │
         ▼
   ┌─────────────┐
   │  R1 ve R2   │ ← bağımsız, kör, eş zamanlı
   │  her yanıtı │
   │  puanlar    │
   └─────────────┘
         │
         ▼
  [Boolean + Likert
   tüm madde × yanıt]
         │
         ▼
   ┌─────────────────────────────┐
   │ Uyumsuzluk kontrolü:        │
   │ • Likert ≥2 puan fark? VEYA │
   │ • Boolean disagreement?     │
   └─────────────────────────────┘
         │
    Evet ▼          ▼ Hayır
  ┌──────────┐  ┌─────────────┐
  │ R3       │  │ Final =     │
  │ bağımsız │  │ R1, R2      │
  │ puanlar  │  │ ortalaması  │
  │ (Final)  │  │             │
  └──────────┘  └─────────────┘
```

### 2.5 Adjudikasyon Tetikleyici Kuralları (kilitli)

#### Likert için
- **Tetikleyici:** Herhangi 1 boyutta R1 ve R2 puanları arasında **|R1 − R2| ≥ 2** fark
- **Eylem:** R3 o yanıtın tüm 4 Likert boyutunu bağımsız puanlar (sadece tetikleyici boyutu değil)
- **Final puan:** R3 puanı (R1 ve R2 puanları sensitivity analizi için saklanır)

#### Boolean için
- **Tetikleyici:** R1 ve R2 herhangi bir maddede farklı işaretledi (0 vs 1)
- **Eylem:** R3 o maddede bağımsız karar verir
- **Final değer:** R3 kararı

### 2.6 IRR Hesaplama (Stat plan §6 ile uyumlu)
Tüm IRR metrikleri **R1 ve R2 ham puanları üzerinden** hesaplanır (adjudikasyon ÖNCESİ). Adjudikasyon trigger oranı (% yanıt) ayrı raporlanır.

| Metric | R paketi | Hedef | Raporlama |
|---|---|---|---|
| ICC(2,k) two-way random, absolute agreement | `psych::ICC` | ≥ 0.75 | Likert |
| Gwet's AC2 | `irrCAC::gwet.ac2.raw` | ≥ 0.61 | Boolean + Likert |
| Weighted Cohen's κ (quadratic) | `irr::kappa2` | ≥ 0.61 | Likert |
| Krippendorff's α (ordinal) | `irr::kripp.alpha` | ≥ 0.67 | Likert tamamlayıcı |
| Cohen's κ (nominal) | `irr::kappa2` | ≥ 0.61 | Boolean tamamlayıcı |

### 2.7 IRR Yetersizliği Durumunda Eylem Planı
Eğer **hedef IRR değerlerine ulaşılamazsa**:
1. **Hangi madde grubunda düşük olduğu** identifiye edilir (per-domain Gwet AC2)
2. R1 ve R2 ile **kısa kalibrasyon revize toplantısı** (rubrik geçici netleştirme)
3. O alt-grupta tüm yanıtlar **R3 tarafından zorunlu adjudike edilir**
4. Bu sapma OSF "Protocol Deviations" bölümüne kaydedilir ve manuscript Limitations'da raporlanır

### 2.8 Veri Yönetimi
- **Form:** REDCap (veya Google Forms + sheet kombinasyonu)
- **Per-rater per-response data point sayısı:**
  - 28 Boolean çekirdek + ~5 vinyete-özgü Boolean + 8 güvenlik + 6 hallüsinasyon + 4 Likert = **~51 data point**
- **Per-rater toplam:** 96 yanıt × 51 = **~4896 data point**
- **Tahmini puanlama süresi:** Yanıt başı 12-15 dk → toplam 19-24 saat / rater (5 hafta'ya yayılı)

### 2.9 Çıkar Çatışması ve Bağımsızlık
- R1, R2, R3 hiçbir aşamada **birbirlerinin puanlarını görmez** (web form bağımsız oturumlar)
- **Adjudikasyon esnasında** R3, R1 ve R2'nin puanlarını **görmez**; sadece o yanıt için bağımsız puanlar
- Konsensüs toplantısı **veri kilitlendikten sonra** yapılır

### 2.10 Adjudikasyon Hızı ve Yedek Plan
- Adjudikatör 3 hafta içinde yanıt veremezse: ikinci enf. hastalıkları uzmanı yedek (önceden onay alınmış)
- Adjudikatör hiç ulaşılamaz hale gelirse: 2 rater ortalaması (sensitivity analysis ile raporlanır)

---

## BÖLÜM 3 — TÜM RATER'LARIN İMZALAYACAĞI ONAY METNİ

```
Ben, aşağıda imzası bulunan, "Ürosepsis LLM Benchmark" çalışmasında
[Rater 1 / Rater 2 / Adjudikatör] rolünde görev almayı kabul ediyorum.

Şunları onaylıyorum:
☐ Çalışmanın amaçlarını, OSF pre-registered protokolünü ve rubrikleri okudum
☐ Puanlama sürecinde diğer rater'larla puan paylaşmayacağım (kör değerlendirme)
☐ Adjudikasyon sırasında diğer rater'ların puanlarını görmeyeceğim
☐ Manuscript'te co-author olarak yer almayı kabul ediyorum
☐ Çıkar çatışması beyanımı yaptım (varsa)
☐ Veri ve analiz kodunun açık (CC-BY 4.0 + MIT) paylaşılmasına onay veriyorum

Ad Soyad: ________________
Unvan: __________________
Kurum: __________________
İmza: ___________________
Tarih: __________________
```

---

**Bu protokol, OSF pre-registration ile birlikte kilitlenir ve manuscript'in Methods bölümünde özetlenir.**
