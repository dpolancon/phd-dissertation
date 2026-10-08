# 01 — Change Ledger: Implementation Pass 02

**Session:** EDITORIAL INTEGRATION PASS 02  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Title & Preamble Changes

| File | Line(s) | Prior State | Implemented State | Rationale |
|:---|:---:|:---|:---|:---|
| `working_paper.tex` | 126 | *Productive Capacity as an Institutional Settlement: A Critical Replication and Distributional Extension of Shaikh's Capacity Utilization Measure* | *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution* | Implemented Title Lock: establishes exact evidentiary ordering (Replication $\to$ Specification Sensitivity $\to$ Distribution). |
| `working_paper.tex` | 137–139 | 179-word abstract with "we", asserted weak exogeneity, and title-level institutional settlement | 147-word abstract in first-person singular ("I"), calibrated claims, structured around replication, sensitivity, distribution, and conceptual handoff | Working-paper standard abstract (120–150 words) reflecting title hierarchy and calibrated claims. |

---

## 2. Section 1 (Introduction) Changes

| File | Target Paragraph | Prior State | Implemented State | Rationale |
|:---|:---:|:---|:---|:---|
| `sections/01_introduction.tex` | Para 1 (Context & Problem) | Conflated technical engineering with institutional struggle in opening sentence | Crisp statement of unobserved capacity ceiling, conventional measures, and Shaikh's (2016) accounting-based cointegrating solution | Bottom-line early, reader-first framing. |
| `sections/01_introduction.tex` | Para 2 (Theoretical Reframing & S0) | Plural "we", mixed discussion of balanced growth | Formal definition of transformation elasticity $\theta$, structural overaccumulation ($\theta < 1.0$), and approximate S0 reconstruction ($\hat{\theta} \approx 0.72$) | Disciplinary anchoring and baseline replication. |
| `sections/01_introduction.tex` | Para 3 (S1 Sensitivity) | General claims of fragility | Explicit reporting of 500-model ARDL lattice, 135 bounds-passing models, $\hat{\theta} \in [0.65, 0.95]$, and "disciplined non-uniqueness" | Concrete numerical evidence on specification sensitivity. |
| `sections/01_introduction.tex` | Para 4 (S2 Bivariate Failure) | Unspecified model counts, called relation "spurious" | Exact count of 48 tested bivariate VECMs, 0 cointegrating specifications, persistent $I(1)$ residual drift | Framing Lock 01: establishes bivariate failure in isolation. |
| `sections/01_introduction.tex` | Para 5 (S2 Distributional Recovery) | High-level mention of Kurz (1986) and reserve-army elasticity | Precise reporting of trivariate VECM $(\ln Y, \ln K, \ln e)$, 6 rank-1 surviving models, focal $\hat{\theta} = 0.727$ ($\text{SE} = 4.852$), and 99.1% exploitation variance share | Framing Lock 01: distribution restores cointegration; variance decomposition explains $\theta$ uncertainty. |
| `sections/01_introduction.tex` | Para 6 (Institutional Handoff) | Asserted institutional conflicts govern physical conversion | Explicit conceptual handoff: productive capacity is distributionally conditioned; labor process and workplace authority mediated by distribution | Framing Lock 02: institutional settlement as conceptual interpretation. |
| `sections/01_introduction.tex` | Para 7 (Roadmap) | Included forward reference to dissertation companion research on Latin America | Self-contained roadmap covering Sections 2 through 5 | Working-paper independence; removed dissertation bridge. |

---

## 3. Section 4 (§§4.6–4.7) Changes

| File | Subsection / Element | Prior State | Implemented State | Rationale |
|:---|:---:|:---|:---|:---|
| `sections/04_econometric_replication.tex` | §4.6 Opening | Called bivariate relation "spurious"; plural "We" | First-person singular; precise statement of 48 bivariate models failing cointegration; Framing Lock 01 | Active voice, calibrated econometrics. |
| `sections/04_econometric_replication.tex` | Table 9 (`tab:s2_admissibility_outcomes`) | Reported 36 estimated models per row | Updated to 48 estimated models per row (144 total attempted) | Reconciles Table 9 with audited execution grid (E-06). |
| `sections/04_econometric_replication.tex` | §4.6 Focal Model Diagnostics | Asserted focal model "is free from residual pathology" | Excised phrase; reported JB, ARCH-LM, Portmanteau(12) pass alongside Breusch-Godfrey LM(4) $p=0.006$ caveat | Eliminates contradiction between text and diagnostic output (E-02). |
| `sections/04_econometric_replication.tex` | §4.6 Cointegrating Vector | Attributed $\text{SE} = 4.852$ on $\theta$ to general multicollinearity | Documented variance decomposition: $\ln e$ carries 99.1% of variance, rendering $\theta$ imprecisely identified once freed from bilateral ARDL | Calibrated reporting of estimation uncertainty (E-04). |
| `sections/04_econometric_replication.tex` | §4.6 Adjustment Dynamics | Asserted capital is "weakly exogenous" and rejected Neo-Kaleckian closure | Stated $\hat{\alpha}_k = 0.0003$ ($t=0.92$) is statistically indistinguishable from zero; avoided claiming proven weak exogeneity without LR test | Calibrated adjustment claims; preserved Sraffa-Kalecki debate nuance (E-03). |
| `sections/04_econometric_replication.tex` | Table 11 (`tab:s2_retained_trivariate_specs`) | Conflated all 6 models as "admissible" | Implemented two-tier taxonomy: Tier 1 (Statistical Rank Survivors, 6 models) vs Tier 2 (Economically Admissible Survivors, 2 models in $C_2$ branch) | Transparently accounts for $C_3$ trend overparameterization and $C_0$ drift distortion (E-07). |
| `sections/04_econometric_replication.tex` | §4.6 Institutional Handoff | Conflated econometric estimates with class struggle | Added explicit distinction: VECM estimates distributional conditioning; "institutional settlement" is the conceptual interpretation | Framing Lock 02 compliance. |
| `sections/04_econometric_replication.tex` | §4.7 Synthesis | Plural pronouns ("our system-level estimation", "We report") | First-person singular ("my system-level estimation", "I report") | Consistent single-author voice. |

---

## 4. Section 5 (Discussion & Conclusion) Changes

| File | Target Section | Prior State | Implemented State | Rationale |
|:---|:---:|:---|:---|:---|
| `sections/05_discussion_conclusion.tex` | Section Structure | Combined single section `\section{Discussion and Conclusion}` | Partitioned into `\section{Discussion}` and `\section{Conclusion}` | Clear separation of interpretive discussion from concluding summary. |
| `sections/05_discussion_conclusion.tex` | Discussion | Blended econometric results with institutional assertions; asserted weak exogeneity | Developed institutional settlement as conceptual handoff; analyzed profit rate decomposition ($r = \pi \mu Y^p/K$); calibrated Sraffa-Kalecki debate; documented caveats | Rigorous, bounded political economy discussion. |
| `sections/05_discussion_conclusion.tex` | Conclusion | Ended with 150-word bridge to dissertation Chapter 2/3 and peripheral BoP models | Self-contained conclusion summarizing the 3 stages per title hierarchy (Replication $\to$ Sensitivity $\to$ Distribution); removed all dissertation references | Standalone working-paper closure. |

---

## 5. Inline Manuscript Tables
- **Table 9 (`tab:s2_admissibility_outcomes`, lines 426–442 of `04_econometric_replication.tex`):** Updated from 36 to 48 estimated specifications per row (144 total attempted in S2), reconciling with audited execution count (E-06).
- **Table 11 (`tab:s2_retained_trivariate_specs`, lines 484–504 of `04_econometric_replication.tex`):** Updated with two-tier taxonomy in evaluation column (Tier 1 statistical survivors vs Tier 2 economically admissible survivors vs trend-inadmissible models) (E-07).
*(Note: To preserve repository boundaries and avoid modifying tracked files through the directory junction, tables are maintained inline within `sections/04_econometric_replication.tex`.)*
