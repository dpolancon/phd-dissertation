# PHASE 10B: §5.3 FINAL CLAIM CALIBRATION & EMPIRICAL ARCHITECTURE LOCK REPORT

**Phase:** 10B — §5.3 Final Claim Calibration  
**Repository:** `c:\ReposGitHub\Chapter3_RPEUP`  
**Timestamp:** 2026-09-28T23:53:00-03:00  
**Author:** Dissertation Empirical-Methods & Integration Editor  
**Status:** **APPROVED & CLOSED**  

---

## 1. Executive Summary & Core Mandate

Phase 10B conducted a tightly bounded claim-calibration and cross-reference reconciliation pass on Chapter 3.
Building upon the contracted empirical architecture established in Phase 10A, Phase 10B has accomplished five explicit objectives:

1. **Exact Evidence Status Alignment:** Every retained claim in §5.3 precisely matches the underlying statistical estimates in the canonical provenance ledger (`FINAL_CORE_RESULT_PROVENANCE.csv` and `output/tables_data/granger_sequential_results.csv`). Imprecise coefficient sums from earlier drafts have been replaced with their exact values.
2. **System 3 Demotion Language Calibration:** System 3 is characterized strictly as **specification-sensitive** to multivariate conditioning without pejorative dismissals ("artifact", "spurious", or "mechanically generated"). It is framed constructively as an algebraic sensitivity check on the commercial banking representation.
3. **System 6 Literal Variable Semantics & TVAR Boundary:** System 6 is described strictly in literal variable terms ($g_{\text{SolvR\_H},t}$ growth rate, lagged coefficients, and the algebraic denominator presence of base money $H$). The narrative completely avoids using linear diagnostic failure or pre-1973 subperiod results to pre-validate or mandate the non-linear Threshold VAR. The transition bridge to §5.4 is formulated neutrally: *"The linear specification does not determine whether these predictive relationships vary with the inherited solvency state. Section 5.4 examines that possibility directly."*
4. **Unambiguous Single Inferential Lag:** Main Table A (\ref{tab:core_granger_evidence}) and §5.3 now report exactly one unambiguous inferential lag per system (System 1: $k=4$; System 2: $k=3$; System 6: pre-October 1973 $k=3$), chosen strictly to satisfy residual whitening while transparently recording SBIC selections in table notes and prose.
5. **Traceable Numerical Dependencies in §5.4:** The $p = 0.406$ statistic in §5.4 has been traced to its exact origin in System 5 ($k=1$, $\Delta \ln \Theta_t \to g_{H,t}: F = 0.692, p = 0.4063$) and corrected from "real-sector" to "supplementary external-sector estimations". Gold block exogeneity and Cholesky recursive ordering are explicitly anchored in the TVAR's own unrestricted equations and open-economy institutional timing.

---

## 2. Inventory of Calibrated Systems and Provenance

| System | Role / Status | Inferential Lag ($k$) | Information Set | Headline Direction | $F$-Statistic | $p$-value | $\sum \hat{\beta}_i$ | Serial Whiteness Status |
| :--- | :--- | :---: | :--- | :---: | :---: | :---: | :---: | :--- |
| **System 1** | Robust Linear | **4** | $\{\pi_t, g_{H,t}\}$ | $\pi \to g_H$<br>$g_H \to \pi$ | 15.004<br>2.718 | $< 0.0001$<br>0.0305 | $+0.680$<br>$+0.380$ | Sys BG $p=0.548$; Eq $p=0.467$ |
| **System 2** | Qualified Linear | **3** | $\{g_{M1}, g_H\}$<br>$\{\pi, g_{M1}\}$ | $g_{M1} \to g_H$<br>$g_H \to g_{M1}$<br>$\pi \to g_{M1}$<br>$g_{M1} \to \pi$ | 6.170<br>5.166<br>8.948<br>5.610 | 0.0005<br>0.0019<br>$< 0.0001$<br>0.0011 | $+0.782$<br>$+0.468$<br>$+0.323$<br>$+0.671$ | Sys BG $p=0.428$; Eq $p=0.289$ |
| **System 6 (Pre-73)** | Qualified Linear (Pre-73 Only) | **3** | $\{g_{\text{SolvR\_H}}, g_{\text{gold}}, g_e, g_H, \pi\}$ | $g_{\text{SolvR\_H}} \to g_H$<br>$g_H \to g_{\text{SolvR\_H}}$<br>$g_{\text{SolvR\_H}} \to g_e$<br>$\pi \to g_{\text{SolvR\_H}}$ | 6.983<br>2.951<br>3.073<br>0.686 | 0.0002<br>0.0347<br>0.0297<br>0.5618 | $+0.015$<br>$-0.837$<br>$+0.129$<br>$+0.667$ | Sys BG $p=0.126$; Min Eq $p=0.056$ |
| **System 3** | Sensitivity Check | 1 | $\{\pi, g_H, \Delta \ln m\}$ | $\Delta \ln m \to \pi$ | 3.896 | 0.0484 | \dots | Conditioned algebraic check |
| **System 4** | Descriptive Only | 2 | Full real vector | \dots | \dots | \dots | \dots | Retained in Appendix E |
| **System 5** | Inconclusive | 1 | Full external vector | $\Delta \ln \Theta \to g_H$ | 0.692 | 0.4063 | \dots | Retained in Appendix E |

---

## 3. Section 5.4 Cross-Reference and Numerical Dependency Audit

The numerical dependencies in Section 5.4 were verified and reconciled as follows:
1. **The $p = 0.406$ Exclusion Restriction:**
   - *Line in §5.4:* `paper/Version7/sections/05_4_threshold_var.tex:171`.
   - *Issue:* Mislabeled as "supplementary real-sector estimations".
   - *Correction:* Calibrated to "supplementary external-sector estimations ($p = 0.406$ for $g^H$, Appendix~\ref{app:linear_var_diagnostics})".
   - *Exact Provenance:* System 5 (External Cost-Push Belt), lag $k=1$, bivariate test $\Delta \ln \Theta_t \to g_{H,t}$ ($F = 0.692, p = 0.4063$).
2. **Gold Block Exogeneity ($p > 0.10$):**
   - *Lines in §5.4:* Lines 76 and 171.
   - *Grounding:* Anchored directly in the Threshold VAR's own unrestricted least squares estimations (Table~\ref{tab:tvar_estimates}) where domestic feedback coefficients are individually and jointly insignificant ($p > 0.10$), and the economic premise of price-taking in international bullion markets.
3. **Cholesky Recursive Causal Ordering:**
   - *Lines in §5.4:* Lines 62--74.
   - *Grounding:* Derived from institutional timing of monthly settlements, foreign exchange clearing, retail price stickiness, and Central Bank emergency payroll accommodation. Completely independent of linear VAR Granger ordering.

---

## 4. Audit Artifacts Produced in Phase 10B

The following audit artifacts have been written to `paper/Version7/audits/final_editing/phase10b_claim_calibration/`:
1. `FINAL_CORE_RESULT_PROVENANCE.csv`: Exact canonical source crosswalk for all retained linear Granger statistics.
2. `SEC54_NUMERICAL_DEPENDENCY_AUDIT.csv`: Complete audit of all §5.4 empirical dependencies, sources, and resolutions.
3. `SYSTEM3_LANGUAGE_CALIBRATION.md`: Before/after audit eliminating polemical terms ("artifact", "spurious") from the multiplier deconstruction.
4. `SYSTEM6_LANGUAGE_CALIBRATION.md`: Variable definition, denominator accounting, prohibited interpretations, and neutral transition bridge to §5.4.
5. `PHASE10B_DIFF_SUMMARY.md`: File-by-file diff summary documenting all modifications.
6. `PHASE10B_CLAIM_CALIBRATION_REPORT.md`: This comprehensive closing report.

---

## 5. Verification, Integrity Gates, and LaTeX Compilation

The manuscript compilation and integrity checks were executed with the following results:
- **Compiler:** pdfTeX 3.141592653-2.6-1.40.28 (TeX Live 2026)
- **Compilation Command:** `bibtex Chapter3_Paper; pdflatex Chapter3_Paper.tex; pdflatex Chapter3_Paper.tex`
- **Output:** `Chapter3_Paper.pdf` (86 pages, 1,644,327 bytes)
- **Exit Code:** `0` (Clean compilation)
- **Undefined Citations:** `0`
- **Undefined References:** `0`
- **Multiply Defined Labels:** `0`
- **Prohibited Phrases Scan:** Clean. Zero occurrences of `artifact`, `spurious`, `mechanically generated`, or causal overreach in Section 5.3.

---

## 6. Closure Declaration

Phase 10B has successfully calibrated all empirical claims, eliminated residual overstatement, harmonized all tables and prose with the canonical econometric ledger, and locked the empirical architecture.

**PHASE10B_COMPLETE — LINEAR GRANGER CLAIMS CALIBRATED AND CLOSED**
