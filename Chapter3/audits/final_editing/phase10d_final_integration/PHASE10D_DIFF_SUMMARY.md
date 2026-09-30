# PHASE 10D — DIFF SUMMARY
## Exact Modifications Across Manuscript and Evidence Files

**Phase**: 10D — Final System 2 Integration and §5.4 Claim Calibration  
**Date**: September 29, 2026  
**Scope**: Integration of conditional VAR(3) estimates for System 2, calibration of Section 5.4 claims, alignment of table notes, and synchronization across downstream sections.

---

### 1. `paper/Version7/audits/final_editing/FINAL_CORE_RESULT_PROVENANCE.csv`
- **Replaced**: Active System 2 rows updated from bivariate pairwise statistics to conditional trivariate VAR(3) estimates ($Y_t = [\pi_t, g_{M1,t}, g_{H,t}]'$):
  - $g_{M1} \to g_H$: $F = 3.654, p = 0.0138, \sum\hat{\beta}_i = +0.510$ (Info Set: `"{pi_t, g_M1, g_H}"`, Status: `Reject non-causality (p < 0.05)`).
  - $g_H \to g_{M1}$: $F = 3.239, p = 0.0236, \sum\hat{\beta}_i = +0.333$ (Info Set: `"{pi_t, g_M1, g_H}"`, Status: `Reject non-causality (p < 0.05)`).
  - $\pi \to g_{M1}$: $F = 6.842, p = 0.0002, \sum\hat{\beta}_i = +0.284$ (Info Set: `"{pi_t, g_M1, g_H}"`, Status: `Reject non-causality (p < 0.001)`).
  - $g_{M1} \to \pi$: $F = 1.004, p = 0.3927, \sum\hat{\beta}_i = +0.444$ (Info Set: `"{pi_t, g_M1, g_H}"`, Status: `Fail to reject (p > 0.10)`).
- **Preserved**: Superseded pairwise numbers recorded with provenance status `SUPERSEDED_PAIRWISE_REFERENCE`.

---

### 2. `paper/Version7/tables/tab02_core_granger_evidence.tex`
- **Panel B (System 2: Commercial Banking Channel)**:
  - Information set column updated to `$\{\pi_t, g_{M1,t}, g_{H,t}\}$` across all four rows.
  - Replaced $g_{M1} \to g_H$ row: $F = 3.654, p = 0.0138, \sum\beta = +0.510$, Inference: `Reject ($p < 0.05$)`.
  - Replaced $g_H \to g_{M1}$ row: $F = 3.239, p = 0.0236, \sum\beta = +0.333$, Inference: `Reject ($p < 0.05$)`.
  - Replaced $\pi \to g_{M1}$ row: $F = 6.842, p = 0.0002, \sum\beta = +0.284$, Inference: `Reject ($p < 0.001$)`.
  - Retained and updated $g_{M1} \to \pi$ row: $F = 1.004, p = 0.3927, \sum\beta = +0.444$, Inference: `Fail to reject ($p > 0.10$)`.
- **Table Notes**:
  - Replaced phrase "difference-stationary" with "stationary".
  - Added note clarifying that conditioning on base money renders $g_{M1} \to \pi$ statistically insignificant ($p = 0.3927$), demonstrating that the pairwise predictive link does not survive conditioning on the monetary base.

---

### 3. `paper/Version7/sections/05_historical_empirical_results.tex`
- **Section 5.3.2 (System 2 Paragraph)**:
  - Replaced pairwise statistics ($F=6.170, 5.166, 8.948, 5.610$) with the conditional VAR(3) estimates.
  - Articulated the bidirectional predictive interaction between narrow money and base money ($g_{M1} \to g_H: F=3.654, p=0.0138; g_H \to g_{M1}: F=3.239, p=0.0236$) and price precedence over narrow money ($\pi \to g_{M1}: F=6.842, p=0.0002$).
  - Explicitly reported the non-significance of narrow money for inflation ($g_{M1} \to \pi: F=1.004, p=0.3927$).
  - Replaced difference-stationary with stationary in paragraph headers.
- **Section 5.3.5 (Bridge to TVAR)**:
  - Preserved strictly neutral empirical bridge to Section 5.4 without claiming pre-validation or proof of non-linearity.

---

### 4. `paper/Version7/sections/05_4_threshold_var.tex`
- **Lines 76–81 (World Gold Exogeneity)**:
  - Replaced "autonomous international forcing variable... proven exogenous" with "treated as block-exogenous in the recursive ordering... supported by the absence of detected domestic feedback in the unrestricted TVAR gold equation ($p > 0.10$, Table 4) and by the small-open-economy price-taking assumption".
- **Line 94 (Threshold Regularity)**:
  - Replaced "difference-stationary ($I(0)$) and formally satisfies the asymptotic regularity conditions" with "stationary ($I(0)$) and satisfies the relevant integration-order requirement".
- **Line 101 (Bootstrap Threshold Test)**:
  - Replaced "linear vector autoregression is decisively rejected. The data confirm that the relationship ... is structurally non-linear" with "The bootstrap threshold test rejects the constant-parameter linear specification in favor of the estimated threshold alternative, providing evidence against parameter constancy across the solvency growth gap dimension".
- **Line 171 (Exclusion Restrictions)**:
  - Removed retired pairwise test reference "$p = 0.406$ for $g^H$".
  - Grounded exclusion of lagged trade imbalance in institutional transmission channels, noting that supplementary linear estimations in Appendix E do not contradict the restriction.
- **Line 181 (Stability Interpretation)**:
  - Replaced "confirms that the estimated non-linearities reflect genuine structural regime shifts" with "indicates that the estimated threshold behavior and qualitative regime differences are preserved across alternative threshold locations rather than being driven by local sample sensitivity".
- **Line 207 (Dispute Evaluation)**:
  - Replaced "refute that premise" with "are difficult to reconcile with that premise".
- **Line 234 (Forward vs Reverse Dominance)**:
  - Replaced "dominates forward transmission across all horizons" with "is more persistent and larger in cumulative magnitude over the reported horizon than forward transmission; the point-wise difference is statistically significant from months 2 through 10".
- **Line 277 (Nominal Paradox Resolution)**:
  - Replaced "The Threshold VAR reveals the true transmission direction" with "Within the identified TVAR, the estimated response from inflation to base-money growth is more persistent and cumulatively larger under insolvency than the reverse response, more consistent with a substantial accommodation channel than with a purely autonomous-money interpretation".

---

### 5. `paper/Version7/tables/tab00_system_variable_definitions.tex`
- **Line 30**: Replaced "difference-stationary form ($I(0)$)" with "stationary form ($I(0)$)".

---

### 6. `paper/Version7/tables/tab03_solvency_unit_root.tex`
- **Line 22**: Replaced "difference-stationary ($I(0)$)" with "stationary ($I(0)$)".

---

### 7. `paper/Version7/tables/tab04_tvar_estimates.tex`
- **Line 38**: Removed "($p = 0.406$ for $g^H$)"; aligned exclusion restriction rationale with institutional transmission structure.
