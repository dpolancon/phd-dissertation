# 06 — Claim Repair Ledger

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Audit Mandate

This ledger itemizes all textual and conceptual claim calibrations required across the manuscript to align with the audit directives of Pass 02.1.

---

## 2. Itemized Claim Repair Matrix

| Location | Prior Phrasing / Claim | Repaired Phrasing / Claim | Audit Rationale |
|:---|:---|:---|:---|
| **Front Matter Footnote** | `...from the author's Ph.D.\ dissertation at the University of Massachusetts Amherst \citep{Polanco2026}.` | `...from the author's doctoral dissertation at the University of Massachusetts Amherst.` (Removed formal citation and bib entry). | Issue 11: Front-matter self-citation to dissertation as external published literature removed; factual note preserved. |
| **Abstract** | `...distribution accounts for 99% of cointegrating variance, yielding an elasticity of \hat{\theta} \approx 0.73.` | `...the rate of exploitation is identified with high precision, yielding a focal elasticity point estimate of \hat{\theta} \approx 0.73 alongside substantial normalized estimation uncertainty.` | Issue 3 & Issue 9: Removed non-additive 99% figure; calibrated overaccumulation to point estimate. |
| **Abstract** | Implied full econometric confirmation of I(1) validity. | Calibrated: framed as replication and specification sensitivity analysis; acknowledges diagnostic sensitivity of capital stock. | Issue 1: Calibrated in light of open E-01 status. |
| **Introduction, Para 2** | `...placing the baseline in the overaccumulation regime.` | `...yielding a point estimate within the structural overaccumulation interval (\hat{\theta} < 1.0).` | Issue 9: Distinguishes point estimate from established regime. |
| **Introduction, Para 3** | `While 135 specifications satisfy Pesaran--Shin--Smith bounds tests...` | `While 102 specifications satisfy the baseline F-bounds test at the 10% level (and 62 at the 5% level)...` | Issue 6: Aligned with exact documented counts in Table 7. |
| **Introduction, Para 4** | `Across 48 bivariate specifications...` | `Across 48 attempted bivariate specifications (36 successfully estimated)...` | Issue 5: Distinguishes attempted vs estimated specifications. |
| **Introduction, Para 5** | `...the exploitation term accounts for 99.1% of the variance of the cointegrating vector...` | `...the exploitation parameter is identified with high precision (\hat{\beta}_e = 20.02, t = 7.90), while the capital elasticity carries substantial estimation uncertainty.` | Issue 3: Replaced unqualified variance share with parameter precision asymmetry. |
| **Section 4.1, Table 4** | `historical impulse dummies` | `historical step controls (S_{yy,t})` | Issue 4: Accurate dummy nomenclature. |
| **Section 4.1, line 43** | `The historical impulse dummies D_{h,t} act as short-run shock absorbers...` | `The historical step indicators S_{h,t} \equiv \mathbf{1}\{t \ge h\} absorb permanent regime shifts...` | Issue 4: Distinguishes step controls from pulse indicators. |
| **Section 4.3, line 251** | `Third, the Residual Diagnostic Gate requires the model residuals to pass tests for serial correlation and heteroscedasticity at the 5% level...` | `Third, surviving models are subjected to diagnostic quality screens (multivariate normality, ARCH, and serial correlation) to assess residual properties without treating them as mechanical rejection criteria.` | Issue 2: Aligns text with empirical pipeline mechanical triple gate (convergence, rank, stability). |
| **Section 4.6, Table 9** | Reported 48 estimated specifications. | Added both `Attempted (48)` and `Estimated (36)` columns. | Issue 5: Reconciles 12 non-converging C1 models. |
| **Section 4.6, line 444** | `under Johansen Case 2 (C_2: restricted constant)` | `under Johansen Case 3 (C_2: unrestricted short-run constant absorbing linear drift)` | Issue 7: Corrects deterministic case classification. |
| **Section 4.6, line 451** | `...the exploitation term accounts for 99.1% of the total variance of the linear combination...` | Explains that 99.1% is the ratio of marginal variance of 20.022 \ln e to total linear combination variance, noting that covariance between \ln Y and -0.727 \ln K is negative. | Issue 3: Explicit qualification of non-additive variance ratio. |
| **Section 4.6, line 458** | `...reflecting an error-correction half-life of approximately 37 years (\ln(2)/0.019)...` | **DELETED half-life statement entirely.** Replaced with: `...reflecting a slow, structural adjustment channel in the distribution equation.` | Issue 10: Removed invalid mechanical univariate half-life in multivariate VECM. |
| **Section 4.6, Table 11** | Labeled Tier 2 as `Economically admissible` based on \theta < 1. | Renamed Tier 2 to `Preferred deterministic branch (C_2)` based on ex-ante linear drift absorption, reporting \theta outcomes afterward. | Issue 8: Eliminates circularity in model taxonomy. |
| **Section 4.6, line 527** | `Ultimately, the survival of the output--capital relation only when income distribution enters...` | `At the system level, the output--capital relation achieves cointegration in the tested full-sample specifications when income distribution enters...` | Issue 12: Softened sweeping "only" claims. |
| **Section 4.7, Table 13** | Listed 48 estimated specifications. | Updated to `48 attempted, 36 estimated`. | Issue 5: Consistent attempted/estimated reporting. |
| **Section 5, Discussion** | Asserted S2 `confirms structural overaccumulation`. | Stated that S1 provides the primary evidence for sub-unitary \theta, while S2 focal point estimate sits within the overaccumulation interval but carries wide estimation uncertainty. | Issue 9: Calibrated overaccumulation framing. |
| **Section 5, Conclusion** | `...distribution accounts for 99.1% of the variance...` | `...the rate of exploitation enters with dominant statistical precision (\hat{\beta}_e = 20.02, t = 7.90), while the transformation elasticity point estimate (\hat{\theta} \approx 0.73) carries substantial estimation uncertainty.` | Issue 3 & Issue 9: Replaced 99.1% with precision asymmetry. |
