# Referans Listesi — Ürosepsis LLM Benchmark Çalışması

> Bu dosya, çalışma planlama aşamasında PubMed E-utilities API ile yapılan literatür taramasında bulunan + manuel olarak eklenen kılavuz/metodoloji referanslarını içerir.
>
> Her referans için: PMID, DOI, Vancouver-stili atıf ve **bizim çalışmada kullanım amacı** belirtilmiştir.
>
> Kategoriler:
> - **R-A** Reporting Standards (TRIPOD-LLM, CHART) — Methods + Discussion'da atıf
> - **R-B** Methodology Frameworks — Methods'da atıf
> - **R-C** LLM Clinical Decision Support — Background + Discussion'da atıf
> - **R-D** Clinical Guidelines — Reference standard (Methods)
> - **R-E** LLM Guideline Adherence Studies (alan benzeri) — Discussion'da atıf
> - **R-F** Head-to-Head LLM Comparison Studies — Background + Discussion
> - **R-G** Statistical Methods References — Methods'da atıf

---

## R-A — Reporting Standards (ZORUNLU CITATIONS)

### R-A1. TRIPOD-LLM Reporting Guideline
- **PMID:** 39779929
- **DOI:** 10.1038/s41591-024-03425-5
- **PubMed:** https://pubmed.ncbi.nlm.nih.gov/39779929/
- **Vancouver:** Gallifant J, Afshar M, Ameen S, Aphinyanaphongs Y, Chen S, Cacciamani G, et al. The TRIPOD-LLM reporting guideline for studies using large language models. Nat Med. 2025;31(1):60-69.
- **Kullanım:** Methods bölümünün "Reporting Standards" alt başlığında. **Tam compliance** supplement olarak verilecek (`14_tripod_llm_checklist.md`).

### R-A2. TRIPOD-LLM Statement (Preprint)
- **PMID:** 39211885
- **DOI:** 10.1101/2024.07.24.24310930
- **Vancouver:** Gallifant J, Afshar M, Ameen S, Aphinyanaphongs Y, Chen S, Cacciamani G, et al. The TRIPOD-LLM Statement: A Targeted Guideline For Reporting Large Language Models Use. medRxiv. 2024.
- **Kullanım:** Methods'ta primary version (Nat Med 2025) yanında secondary atıf olarak verilebilir; veya çıkarılabilir.

### R-A3. CHART (Chatbot Assessment Reporting Tool)
- **PMID:** 38772889
- **DOI:** 10.1136/bmjopen-2023-081155
- **PubMed:** https://pubmed.ncbi.nlm.nih.gov/38772889/
- **Vancouver:** Protocol for the development of the Chatbot Assessment Reporting Tool (CHART) for clinical advice. BMJ Open. 2024;14(5):e081155.
- **Kullanım:** Methods'ta TRIPOD-LLM ile birlikte. Chatbot-spesifik checklist `15_chart_checklist.md` supplement olarak.

---

## R-B — Methodology Frameworks

### R-B1. PIEE Cycle — Red Teaming LLMs in Clinical Decision-Making
- **PMID:** 40722398
- **DOI:** 10.3390/bioengineering12070706
- **Vancouver:** Trabilsy M, Prabha S, Gomez-Cabello CA, Haider SA, Genovese A, Borna S, et al. The PIEE Cycle: A Structured Framework for Red Teaming Large Language Models in Clinical Decision-Making. Bioengineering (Basel). 2025;12(7).
- **Kullanım:** Discussion → "future work: adversarial/red team testing" sınırlamamızı destekler.

### R-B2. Prompting Best Practices in Clinical Context
- **PMID:** 41757194
- **DOI:** 10.64898/2026.02.12.26346005
- **Vancouver:** Dymm B, Goldenholz DM. Prompting is All You Need: How to Make LLMs More Helpful for Clinical Decision Support. medRxiv. 2026.
- **Kullanım:** Methods → zero-shot prompt seçimimizin gerekçelendirilmesinde + Discussion'da future work (prompt engineering varyasyonu).

### R-B3. CPGPrompt — Translating Guidelines to LLM-Executable Decision Support
- **PMID:** 41746783
- **DOI:** 10.1093/jamia/ocag026
- **Vancouver:** Deng R, Martin G, Wang T, Zhang G, Liu Y, Weng C, et al. CPGPrompt: translating clinical guidelines into large language model-executable decision support. J Am Med Inform Assoc. 2026;33(4):855-862.
- **Kullanım:** Background → "guideline-based decision support" çalışmaları öncülü; Discussion → RAG alternatif.

---

## R-C — LLM Clinical Decision Support (Foundational)

### R-C1. LLM Pipeline for Clinical Notes Severity Assessment
- **PMID:** 40659653
- **DOI:** 10.1038/s41598-025-07649-4
- **Vancouver:** Gao H, Wang K, Yuan Y, Wang Y, Liu Q, Wang Y, et al. A large language model based pipeline for extracting information from patient complaint and anamnesis in clinical notes for severity assessment. Sci Rep. 2025;15(1):25345.
- **Kullanım:** Background → LLM'lerin yapılandırılmış klinik bilgi işleme yeteneği.

### R-C2. LLM-Augmented Reasoning in Nephrology Fellows
- **PMID:** 41888321
- **DOI:** 10.1007/s11255-026-05118-z
- **Vancouver:** Meshram HS, Bhagat C, Puri S, Gadireddy SR, Modasia B, Batheja V, et al. Effect of large language model on diagnostic accuracy and clinical completeness among nephrology fellows managing transplant infection. Int Urol Nephrol. 2026.
- **Kullanım:** Discussion → enfeksiyon hastalıkları + LLM kesişimi, fellow-augmentation modeli (bizim çalışmada bu yok, future work).

---

## R-D — Clinical Guidelines (REFERENCE STANDARD — ZORUNLU)

### R-D1. SSC 2026 (Surviving Sepsis Campaign 2026)
- **PMID:** (yayın PMID'i bekleniyor — Apr 2026)
- **DOI:** (yayın DOI'si bekleniyor)
- **Vancouver:** Prescott HC, et al. Surviving Sepsis Campaign: International Guidelines for the Management of Sepsis and Septic Shock. Crit Care Med. April 2026.
- **Kullanım:** **Birincil reference standard.** Methods'ta kilitli PDF olarak supplement'e eklenecek (`supplement/ssc_2026_locked.pdf`).

### R-D2. EAU 2026 Urological Infections Guidelines
- **PMID:** Yayınlanmadı (online, EAU.org)
- **URL:** https://uroweb.org/guidelines/urological-infections (Limited Update March 2026)
- **Vancouver:** Bonkat G, et al. EAU Guidelines on Urological Infections. European Association of Urology. Limited Update Mar 2026.
- **Kullanım:** **İkincil reference standard.** Kilitli PDF supplement (`supplement/eau_2026_locked.pdf`).

---

## R-E — LLM Guideline Adherence Studies (Direct Comparators)

### R-E1. Surgical Guideline Adherence — NASS Spine (LLM)
- **PMID:** 39364514
- **DOI:** 10.7759/cureus.68521
- **Vancouver:** Sarikonda A, Isch E, Self M, Sambangi A, Carreras A, Sivaganesan A, et al. Evaluating the Adherence of Large Language Models to Surgical Guidelines: A Comparative Analysis of Chatbot Recommendations and North American Spine Society (NASS) Coverage Criteria. Cureus. 2024;16(9):e68521.
- **Kullanım:** Introduction → "LLM'lerin tek-disiplinli guideline uyumu çalışılmış" örneği. Discussion → kapsam farkı (bizim multidisipliner).

### R-E2. Heart Failure Guideline Adherence (ChatGPT, ESC + ACC/AHA/HFSA)
- **PMID:** 42090596
- **DOI:** 10.1080/00015385.2026.2668803
- **Vancouver:** Alnuwaysir MJ, Aljama AS, Galib AKA, Aldawood WA, AlRatrout FNT, AlSulaiman RS, et al. Evaluating ChatGPT's adherence to evidence-based heart failure guidelines: a comparative analysis using the 2023 ESC and 2022 ACC/AHA/HFSA recommendations. Acta Cardiol. 2026.
- **Kullanım:** Introduction → tek-LLM guideline uyumu örneği; Discussion → multidisipliner extension'ımızın özgünlüğü.

### R-E3. Caries Guidelines LLM Interpretation
- **PMID:** 42045862
- **DOI:** 10.1186/s12903-026-08430-3
- **Vancouver:** Gu N, Fan B, Yuan Y, Duan X, Han S, Tang Z, et al. Evaluating large language models for interpreting and applying caries guidelines in clinical decision support. BMC Oral Health. 2026.
- **Kullanım:** Introduction → guideline interpretation literatürü.

### R-E4. Tobacco Use Disorder (TUD) — Multi-domain LLM Evaluation
- **PMID:** 41789824
- **DOI:** 10.1080/10550887.2026.2636620
- **Vancouver:** Fernandes TP, Dahlgren L, Santos NA, Degraff Z. Assessing the clinical competence of large language models for tobacco use disorder: A multi-domain expert evaluation. J Addict Dis. 2026.
- **Kullanım:** Introduction → multi-domain expert evaluation metodolojisi; bizim çalışmaya en yakın yapı.

### R-E5. MS / NMOSD — GPT-4o vs Neurologists
- **PMID:** 41993106
- **DOI:** 10.1177/20552173261438268
- **Vancouver:** Saposnik G, Solanes A, Monreal E, Sepúlveda M, Hernández MÁ, Cuello JP, et al. Large language models as clinical decision-support tools in multiple sclerosis and neuromyelitis optica spectrum disorders: A comparative study of ChatGPT-4o and neurologists. Mult Scler J Exp Transl Clin. 2026;12(2):20552173261438268.
- **Kullanım:** Discussion → "doktor karşılaştırma kolu" ekleyen çalışmalara örnek; bizim limitation'ımızı bağlamlaştırır.

### R-E6. Ophthalmology Primary Care LLM Systematic Review
- **PMID:** 41987787
- **DOI:** 10.3389/fmed.2026.1810098
- **Vancouver:** Li S, Wang X, Chen Y, Tian M, Lin P, Lai M, et al. Large language models for primary care ophthalmic education: a systematic review. Front Med (Lausanne). 2026;13:1810098.
- **Kullanım:** Background → spesialty-specific LLM literatürü; sistematik review örneği.

---

## R-F — Head-to-Head LLM Comparison Studies

### R-F1. Multi-LLM Comparison in Trichoscopy (vs Dermatologists)
- **PMID:** 41515664
- **DOI:** 10.3390/diagnostics16010169
- **Vancouver:** Signer B, Mokhtari A, Cazzaniga S, Brand F, Caro G, de Viragh PA, et al. Publicly Available Large Language Models for Trichoscopy: A Head-to-Head Comparison with Dermatologists. Diagnostics (Basel). 2026;16(1).
- **Kullanım:** Background → head-to-head LLM comparison metodolojisi.

### R-F2. DeepSeek vs ChatGPT — Urinary Incontinence
- **PMID:** 40771241
- **DOI:** 10.3389/fpubh.2025.1605908
- **Vancouver:** Cao H, Hao C, Zhang T, Zheng X, Gao Z, Wu J, et al. Battle of the artificial intelligence: a comprehensive comparative analysis of DeepSeek and ChatGPT for urinary incontinence-related questions. Front Public Health. 2025;13:1605908.
- **Kullanım:** Discussion → üroloji + AI kesişiminde literatür örneği.

### R-F3. FRCS Multispecialty LLM Performance
- **PMID:** 40652730
- **DOI:** 10.1016/j.jss.2025.06.026
- **Vancouver:** Ahmed HS. Evaluating the Performance of Large Language Models on Multispecialty FRCS Section 1 Questions. J Surg Res. 2025;313:66-77.
- **Kullanım:** Background → cerrahi LLM benchmark literatürü.

### R-F4. GPT-4 vs GPT-4o vs GPT-3.5 in Medical Licensing
- **PMID:** 40465748
- **DOI:** 10.1371/journal.pone.0324841
- **Vancouver:** Wu YC, Wu YC, Chang YC, Yu CY, Wu CL, Sung WW. Advancing medical AI: GPT-4 and GPT-4o surpass GPT-3.5 in Taiwanese medical licensing exams. PLoS One. 2025;20(6):e0324841.
- **Kullanım:** Discussion → frontier modelin önceki nesle üstünlüğü; bizim güncel frontier triadımız.

### R-F5. ChatGPT in Urodynamics QC
- **PMID:** 40537498
- **DOI:** 10.1038/s41598-025-01752-2
- **Vancouver:** Zeng X, Mo H, Shen H, Jin T. Evaluating the utility of ChatGPT in addressing conceptual and non-conceptual questions related to urodynamic quality control and trace analysis. Sci Rep. 2025;15(1):20091.
- **Kullanım:** Discussion → üroloji-spesifik LLM çalışma örneği.

### R-F6. Multi-LLM GDM Information Validity
- **PMID:** 41717624
- **DOI:** 10.3389/fpubh.2026.1760871
- **Vancouver:** Wang X, Lin S, Liu H, Li C, Zhou L, Li R. Evaluation of validity, reliability, and readability of AI chatbots for gestational diabetes mellitus: a multi-model comparative study. Front Public Health. 2026;14:1760871.
- **Kullanım:** Background → multi-LLM komparatif methodology örneği.

### R-F7. AI Ambient Scribe Scoping Review
- **PMID:** 40779760
- **DOI:** 10.2196/73602
- **Vancouver:** Garcia Sanchez C, Kharko A, Hägglund M, Riggare S, Blease C. Health Care Professionals' Experiences and Opinions About Generative AI and Ambient Scribes in Clinical Documentation: Protocol for a Scoping Review. JMIR Res Protoc. 2025;14:e73602.
- **Kullanım:** Background → genel sağlık AI literatürü kontekst.

### R-F8. Generative AI in Dementia Care — Scoping
- **PMID:** 41734929
- **DOI:** 10.1136/bmjopen-2025-114064
- **Vancouver:** Chen YC, Nieh HC, Chen HC, Chen JC, Chang MY, Wu PO. Generative artificial intelligence in dementia care: a scoping review protocol on nursing roles, experiences and ethical perspectives. BMJ Open. 2026;16(2):e114064.
- **Kullanım:** Opsiyonel; sadece geniş AI sağlık konteksti gerekirse.

### R-F9. Critical Care Conference Proceedings (Sepsis Foundational)
- **PMID:** 27885969
- **DOI:** 10.1186/s13054-016-1208-6
- **Vancouver:** Bateman RM, Sharpe MD, Jagger JE, Ellis CG, Solé-Violán J, López-Rodríguez M, et al. 36th International Symposium on Intensive Care and Emergency Medicine: Brussels, Belgium. 15-18 March 2016. Crit Care. 2016;20(Suppl 2):94.
- **Kullanım:** Marjinal — sepsis foundational literatürünü göstermek için opsiyonel.

---

## R-G — Statistical Methods References

### R-G1. SIMR — Power Analysis for Mixed Models (R Package)
- **Vancouver:** Green P, MacLeod CJ. SIMR: an R package for power analysis of generalized linear mixed models by simulation. Methods Ecol Evol. 2016;7(4):493-498.
- **DOI:** 10.1111/2041-210X.12504
- **Kullanım:** Methods → güç hesaplama metodolojisi.

### R-G2. ordinal R Package — CLMM
- **Vancouver:** Christensen RHB. ordinal—Regression Models for Ordinal Data. R package version 2023.12-4.1. https://CRAN.R-project.org/package=ordinal
- **Kullanım:** Methods → birincil Likert analiz model uygulaması.

### R-G3. Gwet's AC2 — Inter-Rater Reliability
- **Vancouver:** Gwet KL. Handbook of Inter-Rater Reliability. 4th ed. Gaithersburg, MD: Advanced Analytics, LLC; 2014.
- **Kullanım:** Methods → IRR metric gerekçesi; kappa paradox koruması.

### R-G4. Krippendorff's Alpha (Reproducibility için)
- **Vancouver:** Krippendorff K. Content Analysis: An Introduction to Its Methodology. 4th ed. Thousand Oaks, CA: Sage Publications; 2019.
- **Kullanım:** Methods → intra-model reproducibility metric.

### R-G5. ICC Interpretation (Cicchetti)
- **Vancouver:** Cicchetti DV. Guidelines, criteria, and rules of thumb for evaluating normed and standardized assessment instruments in psychology. Psychol Assess. 1994;6(4):284-290.
- **DOI:** 10.1037/1040-3590.6.4.284
- **Kullanım:** Methods → IRR hedef değerlerinin gerekçesi (ICC ≥ 0.75).

---

## ÖZET — Çalışmada Kullanım Yoğunluğu

| Bölüm | Zorunlu | Beklenen | Toplam |
|---|---|---|---|
| **Introduction** | R-D1, R-D2 | R-A1, R-C, R-E, R-F | ~10-12 atıf |
| **Methods** | R-A1, R-A3, R-D1, R-D2 | R-B, R-G | ~10-12 atıf |
| **Discussion** | R-A1 | R-B1, R-C2, R-E1-6, R-F1-6 | ~15-20 atıf |
| **Supplement** | R-A1, R-A3 (compliance checklists) | — | — |

**Toplam tahmini atıf:** 30-40 referans (Q2 dergiler için tipik).

---

## SONRADAN EKLENECEK (placeholder)

Bunlar manuscript yazımında final search ile eklenecek:
- ⏳ Sepsis hipoperfuzyon biomarker review (laktat, CRT)
- ⏳ ESBL üropatojen rezistans paterni 2024-2026 review
- ⏳ Üroseps mortalite epidemiyoloji (2025-2026)
- ⏳ AI bias literatürü (Discussion için)
- ⏳ LLM safety filter / refusal literatürü (Discussion için)
- ⏳ Bonkat G et al. EAU Urolithiasis Guidelines 2026 (taş vinyetleri için)

**Önerilen yöntem:** Manuscript draft hazır olduğunda her bölüm için targeted PubMed search yapılır; bu liste güncellenir.
