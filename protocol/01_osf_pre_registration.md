# OSF Pre-Registration Protocol
**Çalışma:** Ürosepsis Yönetiminde Frontier Büyük Dil Modellerinin Multidisipliner Klinik Karar Destek Performansı — Kılavuz Bazlı Kör Benchmark Çalışması

**Pre-registration date:** [Veri toplamadan önce kilitlenir]
**Anticipated start of data collection:** [TBD]
**Anticipated completion:** [TBD + 16 hafta]
**Reporting framework:** TRIPOD-LLM (Gallifant et al., Nat Med 2025, PMID 39779929) + CHART (BMJ Open 2024, PMID 38772889)

---

## 1. STUDY INFORMATION

### 1.1 Title
**Frontier Büyük Dil Modellerinin Ürosepsis Yönetiminde Multidisipliner Klinik Karar Destek Performansı: SSC 2026 ve EAU 2026 Kılavuz Bazlı Kör Benchmark Çalışması**

*English title:* Multidisciplinary Clinical Decision Support Performance of Frontier Large Language Models in Urosepsis Management: A Guideline-Based Blinded Benchmark Study Using SSC 2026 and EAU 2026 Recommendations

### 1.2 Authors and Roles
- **Principal Investigator (PI):** [İsim, Unvan, Kurum]
- **Co-Investigator (Üroloji):** [İsim] — vinyet geliştirme, klinik değerlendirme (rater 1)
- **Co-Investigator (Yoğun Bakım):** [İsim] — vinyet geliştirme, klinik değerlendirme (rater 2)
- **Adjudikatör (Enfeksiyon Hastalıkları / Klinik Mikrobiyoloji):** [İsim] — ≥2 puan tutarsızlıkta hakem
- **Biostatistician:** [İsim] — CLMM/GLMM analizi, güç hesabı
- **Methodologist (AI/LLM):** [İsim] — API erişim, reproducibility, leakage assessment

### 1.3 Background and Rationale
Büyük dil modelleri (LLM'ler) sağlık ortamında giderek artan kabul görmektedir, ancak çok-disiplinli kararlar gerektiren durumlarda performansları yeterince çalışılmamıştır. Ürosepsis, üroloji (kaynak kontrolü) ve yoğun bakım (hemodinamik resüsitasyon, ampirik antibiyoterapi) kılavuzlarının kesiştiği prototipik bir multidisipliner durumdur. EAU 2026 ve SSC 2026 (Prescott et al., Crit Care Med, Nisan 2026) kılavuzları paralel önerilerle bu hastaların yönetimini düzenler.

Literatürde LLM'lerin tek-disiplinli kılavuz uyumu çalışılmıştır (örn. Sarikonda 2024 NASS spine; Alnuwaysir 2026 HF; Gu 2026 caries; Fernandes 2026 TUD; Saposnik 2026 MS). Ancak **iki kılavuzun kesişimi gerektiren multidisipliner senaryolar henüz benchmark edilmemiştir**. Bu boşluk, frontier LLM triadı (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1) ile multidisipliner ürosepsis senaryolarında pre-registered, kör, kılavuz bazlı benchmark çalışması ile doldurulacaktır.

### 1.4 Research Questions
**Birincil (RQ1):** Üç frontier LLM (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1), 32 ürosepsis vinyetinde SSC 2026 ve EAU 2026 kılavuzlarına uygun yanıtlar üretebilir mi ve aralarında performans farkı var mıdır?

**İkincil (RQ2):** Üç LLM arasında güvenlik ihlali ve hallüsinasyon sıklığı farklı mıdır?

**İkincil (RQ3):** Üroloji ve YBÜ değerlendirici perspektifleri arasında LLM yanıtlarının değerlendirmesinde sistematik fark var mıdır?

**İkincil (RQ4):** LLM performansı, ürolojik (kaynak kontrolü) vs yoğun bakım (hemodinamik/antibiyoterapi/adjuvan) boyutlarında farklılaşıyor mu?

**İkincil (RQ5):** Frontier LLM'ler determinist çıktı üretiyor mu (temperature=0.0 ile reproducibility)?

---

## 2. HYPOTHESES (Pre-specified, directional/non-directional belirtilmiştir)

### Birincil
**H1 (non-directional):** Üç LLM arasında birincil klinik doğruluk Likert puanı dağılımları farklıdır (CLMM global testi anlamlı, p<0.05).

### İkincil
**H2 (non-directional):** Üç LLM arasında güvenlik ihlali oranı farklıdır (GLMM-binomial, p<0.05).

**H3 (non-directional):** Üç LLM arasında hallüsinasyon sıklığı farklıdır (GLMM-binomial, p<0.05).

**H4 (non-directional):** Üroloji ve YBÜ değerlendiriciler arasında LLM yanıtlarının değerlendirmesinde rater×LLM etkileşimi vardır (CLMM interaction term, p<0.05).

**H5 (non-directional):** LLM performansı kaynak kontrolü, hemodinamik resüsitasyon, ampirik antibiyoterapi ve adjuvan tedavi boyutları arasında farklılaşır (CLMM domain×LLM interaction, p<0.05).

**H6 (exploratory):** İntra-model reproducibility (Krippendorff's α) ≥ 0.80 (substantial agreement).

> **Not:** Tüm hipotezler iki yönlüdür; başarısızlık karşıtı (null) sonuçlar da bilimsel olarak raporlanacaktır.

---

## 3. DESIGN PLAN

### 3.1 Study Type
Prospektif, çift-kör, benchmark karşılaştırma (LLM-only — insan karşılaştırma kolu yoktur; bu sınırlama bilinçli bir tasarım kararıdır ve Limitations bölümünde tartışılır).

### 3.2 Blinding
- **Değerlendiriciler kör:** LLM yanıtları anonimize kodlarla (Yanıt A, B, C) sunulur. Her vinyette sıra rastgeleleştirilir (her vinyet için bağımsız random permutation).
- **LLM ipuçları kaldırılır:** "OpenAI", "Claude", "Gemini", "Anthropic", "Google", model versiyon ifadeleri, karakteristik biçimlendirme (markdown header pattern'leri vs.) standardize editör tarafından temizlenir.
- **Standardizasyon:** Tüm yanıtlar 800-1200 kelime aralığına sıkıştırılır (orijinal anlam korunur); başlık biçimi homojenleştirilir.
- **Standardizasyon editörü kör:** Yanıtların orijinal LLM kimliklerini görmez; randomizasyon kodlarını ayrı bir kişi tutar.

### 3.3 Randomization
- Vinyet sunum sırası her değerlendirici için bağımsız olarak randomize edilir (R `sample()`).
- Her vinyet içinde A/B/C kod ataması randomize edilir.
- Randomizasyon seed'leri OSF supplement'inde donmuş halde saklanır.

### 3.4 Study Design Schema
```
1. HAZIRLIK (6 hafta)
   ├── 32 vinyet + altın standart + Boolean checklist
   ├── Content validity (2 bağımsız klinisyen) → final lock
   └── OSF pre-registration → DOI
2. VERİ TOPLAMA (1 hafta)
   ├── OpenRouter API: 3 LLM × 32 vinyet × 1 = 96 birincil yanıt
   └── Reproducibility: 10 random vinyet × 3 LLM × 3 run = 90 yanıt
3. STANDARDİZASYON (1 hafta)
   └── Anonimizasyon + LLM ipuçları temizliği
4. KÖR DEĞERLENDİRME (5 hafta)
   ├── 2 rater × 96 yanıt × (28 Boolean + 4 Likert + 8 güvenlik + 6 hallüsinasyon)
   └── Adjudikasyon paneli (≥2 puan tutarsızlık)
5. ANALİZ + RAPOR (3 hafta)
```

---

## 4. SAMPLING PLAN

### 4.1 Vignette Sample
- **N = 32** klinik vinyet (16 ürosepsis konusu × 2 varyant).
- Konular: BCG ürosepsisi, obstrükte üreter taşı, prostat/mesane kanseri, TURP sonrası sepsis, gebelikte ürosepsis, BPH postrenal ABY + sepsis, prostat biyopsisi sonrası sepsis, sondalı bakım hastası sepsis, sistektomili ileal mesane sepsis, URS + kink DJ, akut prostatit/prostat absesi, koroner YBÜ orşit, böbrek taşı pyonefroz, perirenal abse, PNL sonrası sepsis, Fournier gangreni.
- Her vinyet ürolojik kaynak kontrolü + yoğun bakım hemodinamik/antibiyotik/adjuvan boyutlarını test eder.

### 4.2 LLM Sample
- **N = 3 frontier LLM:** GPT-5.5 (OpenAI), Claude Opus 4.7 (Anthropic), Gemini Pro 3.1 (Google) — 2026-05 itibariyle erişilebilir en güncel sürümler.
- **Erişim:** OpenRouter API, single user prompt, sıfır sistem promptu varyasyonu.
- **Erişim tarihleri ve model ID hash'leri** veri toplama bittiğinde tablo olarak supplement'e işlenir.

### 4.3 Rater Sample
- **N = 2 ana rater:** 1 üroloji profesörü (≥10 yıl) + 1 YBÜ profesörü (≥10 yıl).
- **N = 1 adjudikatör:** Enfeksiyon hastalıkları / klinik mikrobiyolog uzmanı (sadece ≥2 puan tutarsızlıkta devreye girer).

### 4.4 Sample Size Justification (Simulation-Based Power Analysis)
- **Tool:** R `simr` paketi, 1000 simülasyon.
- **Varsayımlar:**
  - Etki büyüklüğü: orta (OR=2.0, log-odds farkı ≈0.69)
  - α = 0.05 (iki yönlü), 1−β hedef ≥0.80
  - Model: CLMM with random intercepts for vignette and rater
  - 32 vinyet × 3 LLM × 2 rater × 4 Likert boyut = 768 ordinal observation
- **Beklenen güç:** 4 Likert kategorisinde de ≥0.80 (sonuç supplement'te raporlanır).
- **Stopping rule:** N=32 vinyet sabit; ek vinyet toplanmaz. Veri kaybı (LLM refusal, API error) durumunda eksik vinyetler iki kez daha denenir; üç başarısızlıkta gözlem missing kabul edilir.

### 4.5 Data Collection Procedures
- Tüm 3 LLM aynı user prompt'u alır (bkz. Section 5.1).
- API parametreleri sabit: `temperature=0.0`, `top_p=1.0`, `max_tokens=4096`, sistem promptu yok.
- API çağrı timestamp + raw JSON response + token kullanımı + cost loglanır.
- Yanıt süresi ve refusal/error oranları raporlanır.

---

## 5. VARIABLES

### 5.1 Manipulated Variable
- **LLM identity** (3 düzey): GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1

**Standart user prompt (kilitli, değişmez):**
> "Sen deneyimli bir yoğun bakım uzmanı ve üroloji uzmanısın. Aşağıdaki klinik senaryoyu oku. Bu hastanın yoğun bakım kabul anından itibaren ilk 6 saatlik yönetim planını detaylı olarak açıkla. Her bir önerini gerekçelendir ve dayandığın güncel kanıta dayalı kılavuz önerilerini açıkça belirt.
>
> [Hasta vinyeti buraya eklenir]"

> **Not:** Alt başlık verilmez (free-recall tasarımı). LLM'in proaktif olarak hemodinamik, antibiyoterapi, kaynak kontrolü ve adjuvan tedavi başlıklarını ele almasının kendisi bir performans göstergesidir.

### 5.2 Measured Variables

#### Birincil — Likert (5 puan, 4 boyut)
1. Klinik Doğruluk (1=Tamamen yanlış, 5=Tamamen doğru)
2. Kılavuz Uyumu (SSC 2026 + EAU 2026)
3. Güvenlik
4. Multidisipliner Beceri

#### Birincil — Boolean Çekirdek Checklist (28 madde × 4 alt başlık)
- A1. Hemodinamik Resüsitasyon (7 madde, SSC 2026 referansları)
- A2. Ampirik Antibiyoterapi (7 madde)
- A3. Kaynak Kontrolü (7 madde, SSC + EAU)
- A4. Adjuvan Tedaviler (7 madde)

Detaylı liste: bkz. `05_boolean_checklist.md`.

#### Vinyete Özgü Boolean (2-8 madde / vinyet)
Detay: `11_vinyete_ozgu_checklist.md`.

#### Güvenlik İhlali (8 madde, Evet=zarar)
G1-G8: bkz. `05_boolean_checklist.md`.

#### Hallüsinasyon (6 madde)
HL1-HL6: bkz. `05_boolean_checklist.md`.

### 5.3 Reference Standard
- **SSC 2026:** Prescott et al., Crit Care Med, Nisan 2026 — kilitlenmiş PDF sürümü supplement'e eklenir
- **EAU 2026 Urological Infections:** Limited Update Mart 2026 — kilitlenmiş PDF supplement'e eklenir
- **Altın standart yanıtlar:** 2 bağımsız klinisyen (üroloji + YBÜ) ortaklaşa geliştirir; pre-registration öncesi donmuş hali `12_altin_standart_yanitlar.md`.

---

## 6. ANALYSIS PLAN

### 6.1 Birincil Analiz — Likert (4 boyut × 3 LLM)
**Model:** Cumulative Link Mixed Model (CLMM)
- R paketi: `ordinal::clmm`
- **Fixed effects:** LLM (3 düzey, referans=GPT-5.5) + dimension (4 kategori) + LLM × dimension interaction
- **Random effects:** vignette intercept, rater intercept
- **Link function:** cumulative logit
- **Threshold:** flexible
- **Pairwise post-hoc:** `emmeans` paketi ile Tukey-equivalent kontrastlar
- **Multiple testing:** Holm-Bonferroni (4 Likert kategorisi için FWER)
- **Effect size:** log odds ratio ile %95 CI; cliff's δ tamamlayıcı

### 6.2 Birincil Analiz — Boolean (Çekirdek 28 madde)
**Model:** Generalized Linear Mixed Model (GLMM-binomial)
- R paketi: `lme4::glmer` (family=binomial, link=logit)
- **Fixed effects:** LLM + domain (4: hemo/AB/source/adj) + LLM × domain interaction
- **Random effects:** vignette, rater, checklist item (nested in domain)
- **Marginal predicted probabilities:** `emmeans` ile
- **Multiple testing:** Holm-Bonferroni

### 6.3 İkincil Analizler

#### Güvenlik İhlali (RQ2)
- Model: GLMM-binomial (8 madde toplam)
- Tanımlayıcı: ihlal türü × LLM tablosu
- Cochran's Q (alternatif marginal test)

#### Hallüsinasyon (RQ2)
- Model: GLMM-binomial (6 madde)
- Tanımlayıcı: hallüsinasyon türü × LLM tablosu

#### Rater × LLM Etkileşimi (RQ3)
- CLMM modelinde rater specialty × LLM interaction term anlamlılığı

#### Domain × LLM Etkileşimi (RQ4)
- 6.1'deki CLMM interaction term'inden çıkarılır
- Stratified analiz: 4 ayrı CLMM (her domain için)

#### Reproducibility (RQ5)
- 10 random vinyet × 3 run intra-model
- **Krippendorff's α** (R: `irr::kripp.alpha`)
- Hedef: α ≥ 0.80

### 6.4 Inter-Rater Reliability
- **ICC(2,k)** two-way random, absolute agreement — hedef ≥0.75 (Cicchetti 1994)
- **Gwet's AC2** (R: `irrCAC::gwet.ac2.raw`) — hedef ≥0.61 (kappa paradox koruması)
- **Weighted Cohen's κ** (quadratic weights, Likert için) — hedef ≥0.61
- **Adjudication trigger:** ≥2 puan Likert farkı VEYA Boolean disagreement → 3. uzman (enf. hast.) bağımsız puanlar; final = adjudikatör puanı.

### 6.5 Exploratory Analyses
*Birincil/ikincil hipotezler tanımlanmıştır; aşağıdakiler keşifseldir ve BH-FDR ile düzeltilir.*
- Per-konu (16) forest plot
- Item Response Theory (2PL) ile vinyet zorluk parametresi
- Hierarchical clustering (vinyetlerin LLM performans profiline göre)
- Calibration: Likert puan ↔ Boolean uyum yüzdesi korelasyonu (Spearman ρ)
- Token kullanımı × performans ilişkisi

### 6.6 Data Exclusion Criteria
- **API refusal:** LLM "yanıt veremem" gibi geri çevirme verirse 2 ek deneme yapılır; üç başarısızlıkta missing kabul edilir ve sensitivity analysis'te raporlanır.
- **Eksik veri:** Boolean ve Likert için listwise deletion; missing rate >5% ise multiple imputation (R: `mice`) sensitivity olarak yapılır.
- **Aykırı değer:** Yok (Likert sınırlı ölçek; Boolean ikili).

### 6.7 Software
- **R 4.4+** with packages: `ordinal`, `lme4`, `emmeans`, `irr`, `irrCAC`, `simr`, `mice`, `ggplot2`, `rcompanion`
- Analiz script'leri GitHub repo'da; çıktılar Zenodo DOI ile arşivlenir.

---

## 7. DETERMINISM AND REPRODUCIBILITY PROTOCOL

- **Sub-sample:** 32 vinyetten 10 tanesi pre-registered random seed (set.seed(2026)) ile seçilir.
- **Runs:** Her seçilmiş vinyet, 3 LLM ile 3 ayrı API çağrısında (zaman aralığı ≥1 saat) tekrarlanır.
- **Toplam:** 10 × 3 × 3 = 90 ek yanıt.
- **Metric:** Krippendorff's α (ordinal Likert için + binary Boolean için).
- **Reporting:** Hangi LLM'in non-determinism gösterdiği, hangi Boolean maddelerinde değişkenlik olduğu raporlanır.

---

## 8. DATA LEAKAGE STATEMENT

Vinyetler ekip tarafından (üroloji + YBÜ + enf. hast.) **orijinal olarak yazılmıştır**; herhangi bir yayınlanmış vaka veya kılavuz örneğinden kopyalanmamıştır. Bu beyan, vinyet metinleri ve geliştirme süreci OSF supplement'inde dokümante edilerek desteklenir.

> **Limitation:** Active probe testi (LLM'e vinyetin başlangıcı verilip devamını tahmin etmesini istemek) bu çalışmada yapılmamıştır; bu sınırlama Discussion'da açıkça belirtilir. Gelecek çalışmalarda öneriliyor.

---

## 9. ETHICS

- **IRB:** Sentetik vinyet kullanımı, gerçek hasta verisi yok → çoğu kurumda IRB exempt. Kurum yerel kuralları uygulanır; muafiyet yazısı supplement'e eklenir.
- **Çıkar çatışması:** Yazarlar OpenAI, Anthropic, Google ile mali ilişkilerini bildirir.
- **Funding:** [Belirtilecek]

---

## 10. OPEN PRACTICES (TOP Guidelines, Tier 3)

| Practice | Plan |
|---|---|
| Citation Standards | Tier 3 — TRIPOD-LLM + CHART supplement |
| Data Transparency | Tier 3 — Tüm 96 birincil + 90 reproducibility yanıtı + rater puanları Zenodo'da DOI ile |
| Analytic Methods (Code) Transparency | Tier 3 — R script'leri GitHub'da, Zenodo'da arşivlenir |
| Research Materials Transparency | Tier 3 — 32 vinyet, altın standart yanıtlar, Boolean checklist, system+user prompts |
| Design and Analysis Transparency | TRIPOD-LLM + CHART compliance |
| Preregistration of Studies | Bu doküman — OSF DOI |
| Preregistration of Analysis Plans | Bu dokümanın Section 6 |
| Replication | Reproducibility sub-study (Section 7) |

---

## 11. TIMELINE

| Hafta | Aşama |
|---|---|
| 0 (mevcut) | OSF pre-registration kilitlenir; DOI alınır |
| 1-6 | Vinyet finalizasyonu, content validity, altın standart kilidi |
| 7 | Veri toplama (API çağrıları + reproducibility) |
| 8 | Standardizasyon + anonimizasyon |
| 9-13 | Kör değerlendirme (2 rater + adjudikasyon) |
| 14-16 | Analiz + manuscript |

---

## 12. ANTICIPATED CHANGES AND DEVIATIONS

Pre-registration'dan herhangi bir sapma (ek analiz, dışlama kriteri değişikliği, hipotez modifikasyonu) **manuscript'in dedicated "Protocol Deviations" bölümünde** açıkça ve gerekçelendirilerek raporlanır.

> **Beklenen olası sapmalar:**
> - SSC 2026'nın geç revizyonu (April 2026'dan sonra) → referans dondurma tarihi: pre-registration tarihi
> - LLM API'lerinin önemli güncelleme alması → model ID hash'i değişirse "yeni model" olarak kabul edilir ve sensitivity analiz yapılır
> - Adjudikatörün ulaşılamaz olması → ikinci enf. hast. uzmanı yedek olarak listede

---

## 13. SUPPLEMENTARY FILES (OSF'e yüklenecek)

1. `01_soru_llm_vinyeti.md` — örnek vinyet ve prompt
2. `05_boolean_checklist.md` — 28 çekirdek + güvenlik + hallüsinasyon checklist
3. `10_klinik_vinyetler.md` — 32 vinyet (kilitli)
4. `11_vinyete_ozgu_checklist.md` — vinyete özgü maddeler
5. `12_altin_standart_yanitlar.md` — altın standart yanıt anahtarları
6. `tripod_llm_checklist.pdf` — TRIPOD-LLM 26-madde compliance (sonradan eklenir)
7. `chart_checklist.pdf` — CHART checklist compliance (sonradan eklenir)
8. `power_analysis.Rmd` — `simr` simülasyon güç hesabı (sonradan eklenir)
9. `randomization_seeds.txt` — vinyet sırası ve A/B/C ataması seed'leri
10. `SSC_2026_locked.pdf` ve `EAU_2026_locked.pdf` — referans kılavuz sürümleri

---

## 14. CONTACT AND PRINCIPAL INVESTIGATOR

- **PI:** [Ad Soyad], [Unvan], [Kurum]
- **Email:** [email]
- **ORCID:** [ORCID]
- **Corresponding author:** [Aynı/Farklı]

---

**Bu protokol, herhangi bir veri toplama veya API çağrısı yapılmadan önce OSF'e yüklenir ve kilitlenir. DOI alındıktan sonra çalışma bu DOI'ye atıf yapılarak yürütülür.**
