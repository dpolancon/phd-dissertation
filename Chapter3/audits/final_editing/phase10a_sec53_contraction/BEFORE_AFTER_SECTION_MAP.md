# BEFORE-AND-AFTER SECTION ARCHITECTURE MAP
## Section 5.3 Contraction & Evidence-Hierarchy Calibration

**Author:** Integration Editor  
**Phase:** 10A  
**Date:** September 2026  
**Primary Target:** `paper/Version7/sections/05_historical_empirical_results.tex` (lines 16–118)

---

### 1. Section Title & Subheading Alignment

| Pre-Phase 10A Heading | Pre-Phase 10A Label | Target Architecture (Phase 10A) | Target Label | Evidentiary Status / Rationale |
| :--- | :--- | :--- | :--- | :--- |
| **5.3 Empirical Exercise 1: Directional Precedence and Channel Discrimination in Stationary Vector Autoregressions** | `sec:granger_tournament` | **5.3 Empirical Exercise 1: Directional Precedence and Monetary Accommodation in Stationary Vector Autoregressions** | `sec:granger_tournament`, `sec:granger_linear` | Aliased label preserves all internal LaTeX references while title drops "Channel Discrimination" / tournament framing. |
| 5.3.1 Econometric Framework: Granger Causality in Stationary Vector Autoregressions | `sec:granger_methodology` | 5.3.1 Econometric Framework and Evidential Standard | `sec:granger_methodology` | Retains definition of stationary VAR, Granger predictive causality (non-structural), and diagnostic admissibility criteria. |
| 5.3.2 Integration Order and Stationarity Baseline | `sec:granger_unit_root` | Integrated into 5.3.1 | `sec:granger_unit_root` (retained) | Merges unit-root summary directly into methodology framework to eliminate repetitive subsections. |
| 5.3.3 Modular Systems and Specification Mapping | `sec:granger_tournament_setup` | Integrated into 5.3.1 | `sec:granger_tournament_setup` | Eliminated as separate heading; system mapping introduced directly before results. |
| 5.3.4 Empirical Findings across Transmission Channels (Paragraphs 1–6) | `sec:granger_empirical_findings` | Replaced by dedicated, structured subsubsections: | `sec:granger_empirical_findings` | Restructures diffuse paragraphs into three clear substantive subsections based on evidence hierarchy: |
| — Paragraph: System 1 (Money and Inflation) | N/A | **5.3.2 Nominal Accommodation: Money and Inflation** | `sec:granger_nominal_core` | `ROBUST_LINEAR_RESULT`. Full sample ($N=250$), clean diagnostics ($k=4$), persistent $\pi \to g_H$ accommodation. |
| — Paragraph: System 2 (Commercial Banking) & System 3 (Multiplier) | N/A | **5.3.3 Commercial Banking and Multiplier Sensitivity** | `sec:granger_banking` | `QUALIFIED_LINEAR_RESULT` (System 2, $N=180$, clean at $k=3$) + `SPECIFICATION_SENSITIVE` Note (System 3 multiplier conditioning sensitivity). |
| — Paragraph: System 6 (Solvency System) | N/A | **5.3.4 Solvency Dynamics Before October 1973** | `sec:granger_solvency_pre73` | `QUALIFIED_LINEAR_RESULT` (Pre-73 Only, $N_{\text{eff}}=161$, $k=3$ admissible). Full sample inadmissible. |
| — Paragraph: System 4 (Manufacturing and Mining) & System 5 (External Sector) | N/A | **5.3.5 Limits of the Linear Exercise and Unresolved Systems** | `sec:granger_limits` | One concise paragraph stating Systems 4 and 5 did not clear diagnostic gates across lags, partitions, or seasonality; demoted to Appendix. |
| 5.3.5 Synthesis: Comparison of Theoretical Predictions and Directional Evidence | `sec:sign_tournament_synthesis` | Integrated into 5.3.6 Transition | `sec:sign_tournament_synthesis` | Removed tournament synthesis table and "orthodox vs heterodox scoreboard" prose. |
| 5.3.6 Residual Diagnostics | `sec:granger_diagnostics` | Integrated into Main Table A notes & Appendix | `sec:granger_diagnostics` | Standalone table removed; diagnostic pass/fail clearly reported alongside each result in Main Table A. |
| Methodological Contrast and Evidential Standard | `sec:granger_discussion` | **5.3.6 Transition to Non-Linear Analysis** | `sec:granger_transition`, `sec:granger_discussion` | Bridges to §5.4: parameter non-constancy and reserve sensitivity motivate threshold modeling; forbids claim that linear failure proves TVAR. |

---

### 2. Table Architecture Transformation

| Pre-Phase 10A Table | Label | Phase 10A Treatment | New Label / Destination |
| :--- | :--- | :--- | :--- |
| `tab00_system_variable_definitions` | `tab:system_definitions` | Contracted | `tab:system_definitions` (retained, streamlined) |
| `tab02a_granger_nominal_core` | `tab:granger_nominal_core` | Merged into Main Table A | `tab:core_granger_evidence` (Panel A) |
| `tab02b_granger_banking_bifurcation` | `tab:granger_banking_bifurcation` | System 2 merged into Table A; System 3 in prose | `tab:core_granger_evidence` (Panel B) |
| `tab02c_granger_real_dual_economy` | `tab:granger_real_dual_economy` | Demoted to Supplementary Appendix | `appendix_linear_var_diagnostics.tex` |
| `tab02d_granger_external_pressures` | `tab:granger_external_pressures` | Demoted to Supplementary Appendix | `appendix_linear_var_diagnostics.tex` |
| `tab02e_granger_central_bank_solvency` | `tab:granger_central_bank_solvency` | Pre-73 admissible results into Table A; full sample to Appendix | `tab:core_granger_evidence` (Panel C) |
| `tab02_sign_discrimination_summary` | `tab:sign_discrimination_summary` | Removed entirely | N/A (Eradicates tournament scorecard) |
| `tab_residual_diagnostics` | `tab:residual_diagnostics` | Consolidated into Table A & Appendix | Detailed table in Appendix |

---

### 3. Argumentative and Lexical Shifts

1. **Eradication of Tournament Framing:**
   - *Removed:* "tournament", "winners", "refutes", "decisive verdict", "orthodox prediction defeated", "channel discrimination", "five-sign skeleton".
   - *Substituted:* "Granger-predictive relation", "directional precedence", "consistent with", "specification-sensitive", "historically bounded".

2. **Causal-Language Precision:**
   - *Strict Compliance:* No claims of "direct structural causality", "mechanisms proved", or "mediation identified".
   - *Formulation:* "Lagged values of $X$ contain incremental predictive information for $Y$ conditional on the specified information set."

3. **Sign-Semantic Discipline in System 6:**
   - Literal variable $g_{\text{SolvR\_H}}$ growth vs. depletion distinguished. Base money growth predictively drains solvency growth ($\sum \hat{\beta} = -0.837, p = 0.035$). Solvency growth predicts base money growth at lag 3 ($\hat{\beta}_3 = +0.057, p = 0.0033$).

4. **Transparent Documentation of Limitations:**
   - The failure of Systems 4 and 5 to achieve residual whitening is stated plainly in §5.3.5 as an empirical boundary of linear constant-parameter VARs, rather than hidden or searched endlessly.
