# İstatistiksel Analiz Planı (CLMM Bazlı, Pre-Registered)

> Bu plan OSF pre-registration ile birlikte kilitlenir. Sapmalar manuscript "Protocol Deviations" bölümünde gerekçelendirilerek raporlanır.

## 1. Tasarım
Prospektif, çift-kör, benchmark LLM karşılaştırma. İnsan karşılaştırma kolu yoktur. 3 LLM × 32 vinyet × 2 rater eşleştirilmiş yapı.

## 2. Örneklem ve Veri Yapısı
| Parametre | Sayı |
|---|---|
| Vinyet | 32 (16 konu × 2) |
| LLM | 3 (GPT-5.5, Claude Opus 4.7, Gemini Pro 3.1) |
| Birincil yanıt | 3 × 32 = **96** |
| Reproducibility ek yanıt | 3 × 10 × 3 = **90** |
| Ana rater | 2 (1 üro prof. + 1 YBÜ prof.) |
| Adjudikatör | 1 (enf. hast./klinik mikrobiyolog, ≥2 puan tutarsızlık trigger) |
| Likert ordinal observation | 96 × 4 boyut × 2 rater = **768** |
| Boolean çekirdek karar | 96 × 28 madde × 2 rater = **5.376** |
| Güvenlik ihlali kararı | 96 × 8 × 2 = **1.536** |
| Hallüsinasyon kararı | 96 × 6 × 2 = **1.152** |

**Veri yapısı:** Crossed random effects (vinyet × rater), nested fixed effects (LLM, dimension/domain).

## 3. Güç Analizi (Simulation-Based)
- **R paketi:** `simr` (1000 Monte Carlo simülasyon)
- **Model:** CLMM ile random intercepts (vinyet, rater)
- **Assumption:** Orta etki büyüklüğü (OR=2.0, log-odds ≈ 0.69)
- **α** = 0.05 (iki yönlü), **β** hedef ≤ 0.20
- **Beklenen güç:** 4 Likert kategorisinin her birinde ≥ 0.80
- Script ve çıktı: `power_analysis.Rmd` (supplement)

## 4. Sonlanım Noktaları

### Birincil
**P1:** 3 LLM arasında 4 Likert boyutunda klinik doğruluk puanı dağılımı

### İkincil
- **S1:** Boolean çekirdek 28 madde uyum oranı (3 LLM arası)
- **S2:** Güvenlik ihlali sıklığı (3 LLM arası)
- **S3:** Hallüsinasyon sıklığı (3 LLM arası)
- **S4:** Rater specialty (üro vs YBÜ) × LLM etkileşimi
- **S5:** Domain (4: hemo/AB/source/adj) × LLM etkileşimi
- **S6:** Intra-model reproducibility (Krippendorff α)

### Keşifsel (BH-FDR ile)
- Konu bazlı (16) performans (forest plot)
- Item Response Theory (2PL) ile vinyet zorluk
- Likert ↔ Boolean kalibrasyon korelasyonu
- Token kullanımı × performans ilişkisi

## 5. Ana Modeller

### 5.1 Birincil — Likert (CLMM)
**R kodu:**
```r
library(ordinal)
mod_lik <- clmm(
  likert_score ~ llm * dimension + rater_specialty +
    (1 | vignette_id) + (1 | rater_id),
  data = df,
  link = "logit",
  threshold = "flexible"
)
summary(mod_lik)
```

- **Fixed effects:** LLM (3 düzey, ref=GPT-5.5) + dimension (4) + LLM × dimension + rater specialty
- **Random effects:** vinyet (intercept), rater (intercept)
- **Link:** cumulative logit
- **Threshold:** flexible

**Pairwise:**
```r
library(emmeans)
emm <- emmeans(mod_lik, ~ llm | dimension, mode = "linear.predictor")
contrast(emm, method = "pairwise", adjust = "holm")
```

**Effect size:** log odds ratio + %95 CI; tamamlayıcı olarak Cliff's δ.

### 5.2 Birincil — Boolean Çekirdek (GLMM-binomial)
```r
library(lme4)
mod_bool <- glmer(
  item_correct ~ llm * domain + (1 | vignette_id) +
    (1 | rater_id) + (1 | item_id:domain),
  data = df_bool,
  family = binomial(link = "logit"),
  control = glmerControl(optimizer = "bobyqa")
)
```

- **Fixed:** LLM + domain (hemo/AB/source/adj) + LLM × domain
- **Random:** vinyet + rater + item (domain içinde nested)
- **Marginal probabilities:** `emmeans` ile, Holm correction

### 5.3 Güvenlik İhlali (S2)
```r
mod_safe <- glmer(
  violation ~ llm + (1 | vignette_id) + (1 | rater_id),
  data = df_safety, family = binomial
)
```
- Tanımlayıcı: ihlal türü × LLM çapraz tablosu
- Alternatif marginal: Cochran's Q + McNemar pairwise (Holm)

### 5.4 Hallüsinasyon (S3)
- 5.3 ile aynı yapı, outcome = hallüsinasyon var/yok
- Tanımlayıcı: HL1-HL6 tipi × LLM çapraz tablosu

### 5.5 Rater Specialty × LLM (S4)
- 5.1 modelinin rater_specialty × llm interaction term anlamlılığı
- LRT (likelihood ratio test) ile interaction-suz model vs interaction-lı model

### 5.6 Domain × LLM (S5)
- 5.1 ve 5.2 modellerindeki interaction term'lerden çıkarılır
- Stratified analiz: 4 ayrı CLMM (her domain için)

### 5.7 Reproducibility (S6)
```r
library(irr)
kripp.alpha(matrix_runs, method = "ordinal")  # Likert
kripp.alpha(matrix_runs, method = "nominal")  # Boolean
```
- 10 vinyet × 3 run, intra-model α
- Hedef: α ≥ 0.80 (substantial)

## 6. Inter-Rater Reliability (IRR)
| Metric | R paketi | Hedef |
|---|---|---|
| ICC(2,k) two-way random, absolute agreement | `psych::ICC` | ≥ 0.75 |
| Gwet's AC2 | `irrCAC::gwet.ac2.raw` | ≥ 0.61 |
| Weighted Cohen's κ (quadratic) | `irr::kappa2` | ≥ 0.61 |

### Adjudikasyon Trigger
- **Likert:** ≥2 puan fark (herhangi bir boyutta, herhangi bir yanıtta)
- **Boolean:** İki rater arası uyumsuzluk (madde bazında)
- **Adjudikatör (enf. hast.):** Bağımsız olarak puanlar; final = adjudikatör puanı.
- Adjudikasyon trigger oranı (% yanıt) raporlanır.

## 7. Çoklu Test Düzeltmesi
| Aile | Tür | Yöntem |
|---|---|---|
| Birincil P1 (4 Likert kategorisi) | A priori | Holm-Bonferroni (FWER) |
| İkincil S1-S6 | A priori | Holm-Bonferroni per aile |
| Post-hoc pairwise (3 LLM) | Tukey-equivalent | `emmeans` ile Holm |
| Keşifsel | İnceleme | BH-FDR (q=0.10) |

## 8. Eksik Veri ve Hassasiyet Analizleri
- **Listwise deletion** birincil analiz için.
- Missing rate > 5% → **multiple imputation** (R: `mice`, m=20) ile sensitivity analizi.
- **API refusal'lar:** LLM "yanıt veremem" derse 2 retry; üç başarısızlıkta missing. Bu durumlar TRIPOD-LLM'in "deployment failure" maddesi olarak raporlanır.
- **Sensitivity:** (a) Adjudikatörsüz analiz (sadece ortalama 2 rater), (b) Reproducibility run #1 vs #2 vs #3 ayrı ayrı analizler.

## 9. Etki Büyüklüğü ve Klinik Anlam
- Log odds ratio (%95 CI) — birincil
- Cliff's δ — Likert için non-parametrik effect size
- Number-Needed-to-Compare (NNC) — yorumlama için
- Kendall's W — tamamlayıcı ranking concordance

## 10. Görselleştirme
- Boxplot + jitter (3 LLM × 4 dimension)
- Heatmap (28 Boolean × 3 LLM, uyum %)
- Forest plot (16 konu × 3 LLM)
- Radar plot (4 dimension × 3 LLM)
- Hallüsinasyon türü bar chart
- Inter-rater scatter (üro vs YBÜ Likert)
- Reproducibility consistency plot (run-to-run değişkenlik)

## 11. Yazılım Stack
```
R 4.4+
├── ordinal         # CLMM
├── lme4            # GLMM
├── emmeans         # marginal means + pairwise
├── irr             # Cohen κ, Krippendorff α
├── irrCAC          # Gwet AC2
├── psych           # ICC
├── simr            # simulation-based power
├── mice            # multiple imputation
├── ggplot2         # görselleştirme
└── tidyverse       # veri işleme
```

## 12. Raporlama Standartları
- **TRIPOD-LLM** (Gallifant et al., Nat Med 2025, PMID 39779929) — 26 madde supplement
- **CHART** (BMJ Open 2024, PMID 38772889) — chatbot-spesifik checklist
- **STROBE** — gözlemsel bileşen için
- **OSF pre-registration DOI** — manuscript'in başında atıf

## 13. Veri ve Kod Paylaşımı
- Tüm 186 yanıt (raw JSON) → Zenodo DOI
- R analiz script'leri → GitHub + Zenodo arşiv
- Vinyetler, checklist'ler, prompt → CC-BY 4.0
