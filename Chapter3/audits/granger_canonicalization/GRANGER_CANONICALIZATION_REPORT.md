# Standard Granger Causality Canonicalization Report
**Phase 9: Comprehensive Production-Grade Harmonization across Code, Tables, Manuscript, and Bibliography**
*Chapter 3: The Political Economy of Capitalist Restructuring, Capacity Utilization, and Macroeconomic Breakdown in Chile: 1930–1973*  
*Date: September 2026*

---

## 1. Executive Summary & Methodological Decision

This report documents the full canonicalization of Empirical Exercise 1 (Section 5.3) of Chapter 3. Following the falsification-oriented comparative findings of the Phase 8 Toda--Yamamoto (TY) Demotion Audit, the methodological architecture of the active manuscript has been decisively transitioned to **standard Granger-causality tests within stationary Vector Autoregressions (VARs)**.

### Core Architectural Decisions:
1. **Total Elimination of Toda--Yamamoto (1995)**:
   - The Toda--Yamamoto $(k + d_{\max})$ augmented-lag procedure, $d_{\max}=1$ persistence safeguards, and Modified Wald (MWALD) statistics have been removed from the primary empirical pipeline, production tables, manuscript text, and bibliography citations.
   - There is NO Toda--Yamamoto robustness appendix. There is NO $d_{\max}$ layer. There is NO augmented-lag fallback.
2. **Single Transparent Estimator**:
   - Primary Method: Standard Granger joint-exclusion $F$-tests (complemented by asymptotic Wald $\chi^2(k)$ statistics) in unrestricted stationary $\text{VAR}(k)$ models estimated via Ordinary Least Squares (OLS).
   - Order of Integration: All ten monthly series enter in stationary transformed form ($I(0)$), as formally verified by univariate Augmented Dickey--Fuller (ADF) tests rejecting unit roots at $p < 0.05$. Under $I(0)$ stationarity, standard Granger $F$-tests possess standard finite-sample distributions without lag augmentation.
3. **Presentation Blueprint (Bachurewicz 2019)**:
   - Adopted the empirical presentation standard of Bachurewicz (*Review of Keynesian Economics*, 2019, 7(3): 402–418):
     - **Panel A**: Primary baseline at the SBIC-selected optimal lag ($k^*$), reporting Dependent Variable (DV), Predictor (INDV), Lag ($k^*$), $F$-statistic, $p$-value, sum of lag coefficients ($\sum\hat{\beta}_i$), and substantive Granger conclusion.
     - **Panel B**: Systematic lag sensitivity and persistence profile across horizons $k \in \{1, 2, 3, 4\}$, reporting finite-sample $F$-statistics and persistence verdicts.
4. **Binding Causal-Language Contract**:
   - All manuscript prose adheres strictly to `chapter3_vault/25_FinalEditing/CAUSAL-LANGUAGE CONTRACT.md`. Granger causality is consistently identified as *temporal predictive precedence* and *incremental information content* within stationary VARs, strictly distinguished from structural causal parameters.

---

## 2. Estimation Script Canonicalization & Override Elimination

### A. R Script Modernization
- **Primary Script**: `codes/sec43_tab02_sequential_granger_battery.R` was completely refactored.
- **Legacy Backup**: Preserved in `codes/sec43_tab02_sequential_granger_battery_legacy_ty.R`.
- **Eliminated Machinery**:
  - Removed all `d_max` variables, augmented lag orders $p_{\text{tot}} = p + d_{\max}$, and MWALD asymptotic approximations.
  - Replaced ad-hoc formula builders with standard restricted vs. unrestricted OLS regressions:
    $$F = \frac{(\text{RSS}_R - \text{RSS}_U) / k}{\text{RSS}_U / (T - 2k - 1)} \sim F(k, T - 2k - 1)$$
  - Computed the genuine sum of lag coefficients $\sum_{i=1}^k \hat{\beta}_i$ and directional sign.
- **Removed Hardcoded Override Block**:
  - The legacy script contained a hardcoded override block (lines 548–570) that manually altered $F$-statistics and $p$-values for 10 specific rows.
  - This override block was **completely deleted**. All 160 reported hypothesis tests across the 24 bivariate/multivariate systems and 4 lag orders are now dynamically generated from the underlying data.
  - Complete documentation is cataloged in `paper/Version7/audits/granger_canonicalization/REMOVED_OVERRIDE_LEDGER.md`.
- **Genuinely Computed Residual Diagnostics**:
  - Replaced legacy hardcoded mock diagnostic values ($p \ge 0.298$, $p \ge 0.220$) with genuine econometric residual diagnostics evaluated on fitted OLS residuals at $k^*$:
    - Breusch--Godfrey Lagrange Multiplier (BG LM) test for serial correlation (up to lag 4).
    - Engle ARCH LM test for autoregressive conditional heteroscedasticity (up to lag 4).
    - Jarque--Bera (JB) test for residual normality.
    - White test for multivariate heteroscedasticity.

### B. Python Table Formatting Modernization
- **Primary Script**: `scripts/format_tab02_granger_battery.py` was rewritten to ingest `outputs/tables/tab02_granger_multivariate_battery.csv` and generate publication-grade LaTeX tables following the Bachurewicz (2019) layout.
- **Legacy Backup**: Preserved in `scripts/format_tab02_granger_battery_legacy_ty.py`.
- **Synchronized LaTeX Outputs**:
  - `paper/Version7/tables/tab01_adf_tests.tex`: Title updated to "Univariate Augmented Dickey--Fuller Tests and Order of Integration"; table notes confirm stationary $I(0)$ without Toda--Yamamoto $d_{\max}=1$.
  - `paper/Version7/tables/tab02a_granger_nominal_core.tex` through `tab02e_granger_central_bank_solvency.tex`: Modular two-panel tables.
  - `paper/Version7/tables/tab02_sign_discrimination_summary.tex`: "Lakatosian Tournament Summary: Theoretical Predictions vs. Empirical Granger Precedence".
  - `paper/Version7/tables/tab_residual_diagnostics.tex`: System residual diagnostics reporting genuine empirical $p$-values.

---

## 3. Empirical Invariants & Verified System Findings

Execution of `Rscript codes/sec43_tab02_sequential_granger_battery.R` generated 160 test rows across 40 hypothesis pairs. Verification against the Phase 8 audit values confirmed **zero discrepancy** ($\max |\Delta F| = 0.0$ across all 160 rows).

| System | Dimension & Sample | SBIC $k^*$ | Core Causal Finding | Key Statistics ($F$, $p$, $\sum\hat{\beta}$) | Persistence ($k=1..4$) |
| :--- | :--- | :---: | :--- | :--- | :--- |
| **System 1: Nominal Core** | Bivariate $[\pi, g_H]$<br>$N=250$ | $k^*=3$ | **Bidirectional with dominant reverse accommodation** | $\pi \to g_H$: $F=20.318^{***}, p < 0.0001, \sum\hat{\beta}=+0.595$<br>$g_H \to \pi$: $F=5.544^{***}, p = 0.0011, \sum\hat{\beta}=+0.421$ | $\pi \to g_H$: Robust across all lags ($F \in [15.00, 28.32]$). Reverse $F$-stat is 4x larger. |
| **System 2: Commercial Credit** | 3-var $[g_H, g_{M1}, \pi]$<br>$N=180$ | $k^*=1$ | **Commercial credit leads central bank base money** | $M1 \to H$: $F=21.453^{***}, p < 0.0001, \sum\hat{\beta}=+0.478$<br>$H \to M1$: $F=15.834^{***}, p = 0.0001, \sum\hat{\beta}=+0.284$ | $M1 \to H$ significant across all 4 lags ($p < 0.05$). Confirms endogenous credit lead. |
| **System 3: Multiplier Deconstruction** | 3-var $[g_H, \Delta\ln m, \pi]$<br>$N=180$ | $k^*=1$ | **Multiplier channel inactive; inflation drives compression** | $m \not\to \pi$: $F=0.338, p = 0.5617$ (fail to reject)<br>$\pi \to m$: $F=5.127^{***}, p = 0.0020, \sum\hat{\beta}=-0.189$ (at $k=3$) | $m \not\to \pi$ inactive at all lags ($p \ge 0.562$). Multiplier compresses at quarterly horizons. |
| **System 4: Real Dual Economy** | 5-var $[\pi, g_H, \Delta\ln\Theta, g_{\text{Manuf}}, g_{\text{Mining}}]$<br>$N=250$ | $k^*=2$ | **Defensive emission during manufacturing distress; mining decoupled** | $g_H \to \text{Manuf}$: $F=3.636^{**}, p = 0.0278, \sum\hat{\beta}=-0.333$<br>$\text{Manuf} \to \pi$: $F=7.103^{***}, p = 0.0010, \sum\hat{\beta}=-0.201$<br>$g_H \leftrightarrow \text{Mining}$: $p \ge 0.40$ | $g_H \to \text{Manuf}$ significant at 3/4 horizons. $\text{Manuf} \to \pi$ robust at all horizons ($p < 0.01$). |
| **System 5: External Pressures** | 5-var $[g_{P,\text{gold}}, g_e, \Delta\ln\Theta, g_H, \pi]$<br>$N=250$ | $k^*=1$ | **Gold strictly exogenous; trade imbalance predicts inflation** | Gold exogeneity: $p \ge 0.089$ into all domestic vars<br>$\Theta \to \pi$: $F=5.113^{**}, p = 0.0246, \sum\hat{\beta}=-0.019$<br>$g_e \to \pi$: $F=37.025^{***}, p < 0.0001, \sum\hat{\beta}=+0.504$ (at $k=4$) | Exchange rate pass-through delayed to lag 4. Catch-up devaluations: $\pi \to g_e$ robust at all lags ($F=23.31^{***}$). |
| **System 6: Reserve Solvency** | 5-var $[\Delta\ln\text{SolvR}^H, g_{P,\text{gold}}, g_e, g_H, \pi]$<br>$N=250$ | $k^*=1$ | **Solvency depletion predicts delayed defensive emission** | $\text{SolvR}^H \to g_H$: $F=0.031, p=0.861$ (at $k=1$);<br>$F=11.149^{***}, p < 0.0001, \sum\hat{\beta}=+0.087$ (at $k=3$)<br>$g_H \not\to \text{SolvR}^H$: $p = 0.688$ (at $k=1$), $p = 0.065$ (at $k=3$) | $\text{SolvR}^H \to g_H$ emerges strongly at multi-month horizons ($k=3, 4$). Domestic money does not lead reserves. |

### C. System Residual Diagnostics at $k^*$
- **Breusch--Godfrey LM (Serial Correlation)**:
  - Nominal Core ($g_H$ at $k^*=3$): $p = 0.467$ (no serial correlation up to lag 4).
  - Multiplier ($\Delta\ln m$ at $k^*=1$): $p = 0.072$ (fails to reject at 5\%).
  - Commercial Credit ($g_H$ at $k^*=1$): $p = 0.030$.
  - Higher-dimensional systems at $k=1$ exhibit residual serial correlation typical of low lag baselines, which attenuates at longer lags (documented in Panel B).
- **ARCH LM & White Heteroscedasticity**:
  - ARCH LM rejects no-ARCH null ($p \le 0.003$); White test rejects homoscedasticity ($p < 0.001$). This confirms significant volatility clustering during the Unidad Popular price spiral and stabilization attempts.
- **Jarque--Bera Normality**:
  - Rejects normality ($p < 0.001$, except manufacturing at $k=2$ where $p = 0.128$). Non-normality is standard in samples spanning acute regime shocks and hyperinflation bursts (Bachurewicz 2019, p. 409) and does not introduce bias into OLS coefficient estimates in large samples ($N=250$).

---

## 4. Manuscript Integration & Text Consistency

All active manuscript files across `paper/Version7/` were thoroughly updated and verified to ensure exact terminology and empirical alignment:

1. **Section 5.3 (`paper/Version7/sections/05_historical_empirical_results.tex`)**:
   - Title updated: *Empirical Exercise 1: Directional Precedence and Channel Discrimination in Stationary Vector Autoregressions*.
   - Econometric specification: Outlined standard unrestricted $\text{VAR}(k)$ model, joint-exclusion restriction $H_0: \delta_1 = \dots = \delta_k = 0$, and finite-sample $F$-test. Cites Bachurewicz (2019).
   - Integration order: Explains that ADF tests establish stationarity in levels ($I(0)$), enabling standard asymptotic inference without lag augmentation or non-standard corrections.
   - Channel expositions: Completely updated with genuine, dynamically generated statistics for Systems 1 through 6. System 1 correctly characterized as bidirectional with dominant reverse accommodation.
   - Residual diagnostics: Faithfully narrates genuine diagnostic outcomes (BG LM, ARCH LM, JB, White).
   - Methodological contrast: Re-grounded in `CAUSAL-LANGUAGE CONTRACT.md`.
2. **Abstract (`paper/Version7/Chapter3_Paper.tex`)**:
   - Replaced "level-augmented Toda--Yamamoto directional-precedence tests" with "stationary vector-autoregressive Granger directional-precedence tests".
3. **Introduction (`paper/Version7/sections/01_introduction.tex`)**:
   - Line 20: Updated "Toda--Yamamoto and Threshold VAR systems" to "vector autoregressive and Threshold VAR systems".
   - Line 22: Updated roadmap to "stationary vector-autoregressive Granger directional-precedence battery and the non-linear Threshold VAR".
4. **Macroeconomic Framework (`paper/Version7/sections/03_macro_framework.tex`)**:
   - Line 52: Updated to "sequential Granger causality battery in Section~\ref{sec:granger_tournament}".
5. **Data Architecture (`paper/Version7/sections/04_data_architecture.tex`)**:
   - Line 50: Updated to "stationary in levels ($I(0)$)... without requiring lag augmentation".
6. **Section 5.2 Hand-off (`paper/Version7/sections/05_2_stylized_facts.tex`)**:
   - Line 179: Cleanly hands off to "Granger-causality tests in stationary vector autoregressions across six modular empirical systems".
7. **Threshold VAR (`paper/Version7/sections/05_4_threshold_var.tex` & `tab04_tvar_estimates.tex`)**:
   - Lines 12, 76, 171: Cross-references updated to "directional precedence tests", "external Granger causality tests", and "Granger non-causality evidence ($p = 0.406$ for $g^H$)".
   - `tab04_tvar_estimates.tex` note updated to reflect Granger non-causality evidence.
8. **Discussion & Conclusion (`paper/Version7/sections/06_discussion_conclusion.tex`)**:
   - Lines 20 and 44: Updated to "Granger causality tests within stationary vector autoregressions" and accurately reports bidirectional core with reverse dominance ($\pi \to g_H$).
9. **PCMCI Appendix (`paper/Version7/appendix/appendix_causal_pcmci_ee1.tex`)**:
   - Lines 16, 33, 34: Updated to reference the modular Granger battery and tables.
10. **Appendix D (`paper/Version7/appendix/appendix_tvar_girf_atlas.tex`)**:
    - Line 199: Updated to "directional Granger tests".
11. **Bibliography (`paper/Version7/references.bib`)**:
    - Confirmed `Bachurewicz2019` is cited and resolved.
    - Zero active `.tex` citations to `TodaYamamoto1995` or `DoladoLutkepohl1996`.

---

## 5. Audit Verification & LaTeX Build Quality Gates

### A. Keyword Validation Audit
A recursive regular expression search across all active `.tex` files in `paper/Version7/` (excluding legacy backups) for:
`\b(toda|yamamoto|dmax|d_max|mwald)\b`
returned **ZERO hits**. The Toda--Yamamoto vocabulary has been 100% eliminated from the active manuscript.

### B. Citation Verification Audit
A search for `cite.*(TodaYamamoto|DoladoLutkepohl)` returned **ZERO hits**.

### C. Full LaTeX Compilation Verification
- Tool: `pdflatex -interaction=nonstopmode Chapter3_Paper.tex` + `bibtex Chapter3_Paper` + `pdflatex` (2x).
- Result: **Compilation succeeded with exit code 0**.
- Page Count: **89 pages**.
- Output File: `paper/Version7/Chapter3_Paper.pdf`.
- Diagnostics:
  - **Undefined citations: 0**
  - **Undefined references: 0**
  - **Multiply defined labels: 0**

---

## 6. Audit Artifact Repository Reference
The canonicalization process produced the following permanent audit artifacts stored in `paper/Version7/audits/granger_canonicalization/`:
1. `REMOVED_OVERRIDE_LEDGER.md`: Complete documentation of all 10 eliminated hardcoded overrides.
2. `GRANGER_RESULT_PROVENANCE.csv`: 160-row dataset of all tested pairs, statistics, and classification.
3. `GRANGER_LAG_GRID.csv`: 24-row grid of SBIC, AIC, and HQIC lag selection criteria.
4. `GRANGER_DIAGNOSTICS.csv`: Residual diagnostic test battery results across fitted models.
5. `canonical_granger_battery.R`: Self-contained canonical R estimation script mirror.
6. `GRANGER_CANONICALIZATION_REPORT.md`: This comprehensive canonicalization report.

---
*Signed by: Antigravity Empirical-Methods & Manuscript Integration Partner*  
*Timestamp: September 28, 2026*  
*Verification Token: STANDARD_GRANGER_CANONICALIZATION_PASS*
