# PHASE 10A — §5.3 CONTRACTION AND EVIDENCE-HIERARCHY REPORT
## Narrowing the Linear Granger Exercise Around Empirically Defensible Results

**Author:** Dissertation Integration Editor  
**Date:** September 2026  
**Repository:** `C:\ReposGitHub\Chapter3_RPEUP`  
**Master Document:** `paper/Version7/Chapter3_Paper.tex`  
**Section Target:** `paper/Version7/sections/05_historical_empirical_results.tex` (Section 5.3)  
**Downstream Target:** `paper/Version7/sections/05_4_threshold_var.tex` (Section 5.4 cross-references)  
**Binding Architecture Lock:** `chapter3_vault/25_FinalEditing/EMIPRICAL_ARCHITECTURE_LOCK.md`  
**Binding Language Contract:** `chapter3_vault/25_FinalEditing/CAUSAL-LANGUAGE CONTRACT.md`

---

## 1. EXECUTIVE SUMMARY & EDITORIAL PRINCIPLE

In accordance with the doctoral advisor's directive to "keep it narrow" and the Lakatosian principle that empirical research must be **researcher-driven rather than test-driven**, Phase 10A contracted Section 5.3 of Chapter 3 from a sprawling, six-system exploratory "tournament" into a disciplined, selective evidence hierarchy.

Under this architecture:
1. **Admissible Core Retained:** Only specifications satisfying strict diagnostic criteria (modulus stability, system-level Breusch--Godfrey residual whitening $p > 0.05$, and equation-level whitening $p > 0.05$) are admitted to the main text's inferential core.
2. **Transparent Demotion:** Unresolved specifications (Systems 4 and 5) that exhibited persistent residual autocorrelation across lag expansion ($k=1,\dots,12$), historical sample partitions, and seasonal controls are formally demoted to a supplementary appendix (`Appendix E`, `appendix_linear_var_diagnostics.tex`). They are reported as empirical boundaries of linear constant-parameter modeling rather than converted into pseudo-confirmatory evidence.
3. **Multiplier Demoted to Sensitivity:** System 3 (Money Multiplier) is demoted from an independent empirical pillar to a compact sensitivity note, demonstrating that its marginal significance under multivariate conditioning is an accounting artifact of $\Delta \ln m \equiv g_{M1} - g_H$.
4. **Historical Boundary on Solvency:** System 6 is admitted strictly as a qualified, historically bounded result for the pre-October 1973 subperiod ($k=3$), explicitly noting that the full-sample linear system is not serially admissible.
5. **Eradication of Tournament Rhetoric:** All tournament framing ("victorious", "refutes", "decisive verdict", "channel discrimination") has been eradicated in favor of neutral predictive-precedence econometric prose.
6. **Verification:** The complete manuscript compiles with **0 undefined citations, 0 undefined references, and 0 multiply defined labels**.

---

## 2. EMPIRICAL ARCHITECTURE LOCK IMPLEMENTATION

| System | Canonical Name | Sample Coverage | Lag Order | Diagnostic Status | Granger Joint $F$ & Sign Summary | Evidence Status | Main Text Placement |
| :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- |
| **System 1** | Nominal Core | Full Sample ($N=250$, 1960--1980) | $k=4$ (clean) & $k=3$ (SBIC) | **PASS** (Sys BG $p=0.548$; Min Eq $p=0.467$; stable $\lambda=0.730$) | $\pi \to g_H$ ($F=15.00, p<0.0001, \sum\beta=+0.643$); $g_H \to \pi$ ($F=2.72, p=0.0305, \sum\beta=+0.407$) | `ROBUST_LINEAR_RESULT` | Section 5.3.2 & Table~\ref{tab:core_granger_evidence} (Panel A) |
| **System 2** | Commercial Banking | Observed M1 Window ($N=180$, 1966--1980) | $k=3$ (clean) & $k=1$ (SBIC) | **PASS** (Sys BG $p=0.428$; Min Eq $p=0.289$; stable $\lambda=0.817$) | $g_{M1} \to g_H$ ($F=8.16, p<0.0001, \sum\beta=+0.418$); $g_H \to g_{M1}$ ($F=5.23, p=0.0018, \sum\beta=+0.334$) | `QUALIFIED_LINEAR_RESULT` | Section 5.3.3 & Table~\ref{tab:core_granger_evidence} (Panel B) |
| **System 6** | Central Bank Solvency | Pre-October 1973 ($N_{\text{eff}}=161$, 1960:02--1973:09) | $k=3$ (AIC opt among adm) | **PASS** (Sys BG $p=0.1262$; Min Eq $p=0.0557$; PT12 $p=0.0754$; stable $\lambda=0.882$) | $g_{\text{SolvR\_H}} \to g_H$ ($F=6.98, p=0.0002, \sum\beta=+0.015$); $g_H \to g_{\text{SolvR\_H}}$ ($F=2.95, p=0.0347, \sum\beta=-0.837$) | `QUALIFIED_LINEAR_RESULT (Pre-73 Only)` | Section 5.3.4 & Table~\ref{tab:core_granger_evidence} (Panel C) |
| **System 3** | Multiplier Deconstruction | Observed M1 Window ($N=180$, 1966--1980) | $k=1$ (SBIC) | **MARGINAL** (Eq BG $p=0.072$) | Pairwise $m \not\to \pi$ ($p=0.562$); conditional $m \to \pi$ ($p=0.048$) driven by identity $\Delta \ln m = g_{M1} - g_H$ | `SPECIFICATION_SENSITIVE` | Section 5.3.3 (Compact Sensitivity Note) |
| **System 4** | Real Dual Economy | Full Sample ($N=250$, 1960--1980) | $k=2$ (SBIC) | **FAIL** across $k=1..12$, partitions, & seasonality ($p < 0.01$) | Physical output persistence prevents valid asymptotic Granger inference in constant-parameter VAR | `DESCRIPTIVE_ONLY` | Demoted to Appendix~\ref{app:linear_var_diagnostics} (Table~\ref{tab:app_system4_real_dual}) |
| **System 5** | External Cost-Push | Full Sample ($N=250$, 1960--1980) | $k=1$ (SBIC) | **FAIL** across $k=1..12$, partitions, & seasonality ($p < 0.01$) | Persistent residual autocorrelation and conditioning sensitivity; gold exogeneity holds | `INCONCLUSIVE` | Demoted to Appendix~\ref{app:linear_var_diagnostics} (Table~\ref{tab:app_system5_external}) |

---

## 3. SYSTEM 6 SIGN-SEMANTIC AUDIT & RECONCILIATION

A crucial forensic requirement of Phase 10A was inspecting the exact coefficient vector of the admissible Pre-October 1973 conditional VAR(3) ($N_{\text{eff}} = 161$) to resolve potential sign-semantic confusion between the mathematical rate of change ($g_{\text{SolvR\_H}} \equiv \Delta \ln \text{SolvR}^H \times 100$) and the economic concept of "solvency depletion."

### Exact OLS Estimates for System 6 ($k=3$, Pre-Oct 1973):
1. **Equation for Base Money Growth ($g_{H,t}$):**
   - Regressor $g_{\text{SolvR\_H}, t-1}$: $\hat{\beta}_1 = -0.0119$ ($p = 0.516$)
   - Regressor $g_{\text{SolvR\_H}, t-2}$: $\hat{\beta}_2 = -0.0295$ ($p = 0.143$)
   - Regressor $g_{\text{SolvR\_H}, t-3}$: $\hat{\beta}_3 = +0.0568$ ($t = +2.991, p = 0.0033^{***}$)
   - **Sum of coefficients:** $\sum_{i=1}^3 \hat{\beta}_i = +0.0153$
   - **Joint Granger $F$-test:** $F(3, 145) = 6.983, p = 0.00020^{***}$

2. **Equation for Solvency Ratio Growth ($g_{\text{SolvR\_H},t}$):**
   - Regressor $g_{H, t-1}$: $\hat{\gamma}_1 = -0.1303$ ($p = 0.728$)
   - Regressor $g_{H, t-2}$: $\hat{\gamma}_2 = -0.9775$ ($t = -2.717, p = 0.0074^{***}$)
   - Regressor $g_{H, t-3}$: $\hat{\gamma}_3 = +0.2713$ ($p = 0.468$)
   - **Sum of coefficients:** $\sum_{i=1}^3 \hat{\gamma}_i = -0.8365$
   - **Joint Granger $F$-test:** $F(3, 145) = 2.951, p = 0.03475^{**}$

### Sign Reconciliation & Language Rule:
- In the $g_{\text{SolvR\_H}}$ equation, lagged base money growth has a large, statistically significant negative impact concentrated at lag 2 ($\hat{\gamma}_2 = -0.978, p = 0.0074$; sum $= -0.837$). Higher base money growth predictively drains the solvency ratio.
- In the $g_H$ equation, the sum of coefficients is $+0.0153$, with the rejection driven by the positive coefficient at lag 3 ($\hat{\beta}_3 = +0.0568, p = 0.0033$). A positive coefficient means that an increase in solvency ratio growth is followed by higher base money growth three months later (or conversely, negative solvency growth precedes slower money growth).
- Earlier draft text loosely described this as "reserve depletion leads base money expansion with a positive sign." That phrasing conflated the direction of the variable shock ($g_{\text{SolvR\_H}} < 0$) with the mathematical sign of $\hat{\beta}$.
- **Resolution:** In Section 5.3.4, the relationship is stated strictly in literal variable terms: *"Solvency ratio growth predictively Granger-causes base money growth ($F = 6.983, p = 0.0002$), driven by a statistically significant positive coefficient at lag 3 ($\hat{\beta}_3 = +0.0568, p = 0.0033$), while domestic base money expansion preceded subsequent reductions in foreign reserve backing ($\sum \hat{\beta}_i = -0.8365$, concentrated at lag 2, $\hat{\beta}_2 = -0.9775, p = 0.0074$)."*
- This exact property illustrates why linear symmetric VARs are structurally incomplete: defensive accommodation during balance-of-payments crises is intrinsically state-dependent, motivating the non-linear Threshold VAR of Section 5.4.

---

## 4. TABLE CONTRACTION & CROSSWALK

The eight tables previously occupying Section 5.3 were audited and contracted:
- **Main Table A (`tab02_core_granger_evidence.tex`):** Consolidated unified publication table containing System 1 (Panel A), System 2 (Panel B), and qualified pre-73 System 6 (Panel C). Each entry explicitly lists the information set, lag, $F$-statistic, $p$-value, sum of coefficients, diagnostic status, and evidence hierarchy classification.
- **Table 0 (`tab00_system_variable_definitions.tex`):** Contracted to classify systems into core empirical specifications (main text) versus auxiliary/sensitivity specifications (appendix).
- **Demoted Tables:** System 4 (`tab02c`) and System 5 (`tab02d`) tables moved to Appendix E (`appendix_linear_var_diagnostics.tex`).
- **Removed Tables:** Standalone tournament scorecard (`tab02_sign_discrimination_summary.tex`) and standalone diagnostic table (`tab_residual_diagnostics.tex`) removed from the main text.

Complete mapping is recorded in [`SEC53_TABLE_CROSSWALK.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/final_editing/phase10a_sec53_contraction/SEC53_TABLE_CROSSWALK.csv).

---

## 5. DOWNSTREAM SECTION 5.4 CROSS-REFERENCE AUDIT

Section 5.4 (`paper/Version7/sections/05_4_threshold_var.tex`) was audited for downstream dependencies on old Section 5.3 claims:
1. **Line 12:** Cross-reference to §5.3 Granger precedence updated to cite Table~\ref{tab:core_granger_evidence} and specifically note that foreign reserve solvency interacted predictively with base money prior to October 1973.
2. **Line 62:** Recursive Cholesky ordering statement decoupled from System 5 tournament claims; grounded in institutional timing and international block exogeneity.
3. **Line 76:** Global gold block exogeneity ($p > 0.10$) referenced to the TVAR's own unrestricted estimations (Table~\ref{tab:tvar_estimates}) and supplementary tests in Appendix~\ref{app:linear_var_diagnostics}.
4. **Line 171:** Exclusion of structural trade imbalance from money equation ($p = 0.406$) attributed to supplementary real-sector estimations in Appendix~\ref{app:linear_var_diagnostics}.
5. **Line 206:** Paragraph title rewritten from `\paragraph{Forward Transmission versus Reverse Accommodation: The Primary Empirical Tournament.}` to `\paragraph{Forward Transmission versus Reverse Accommodation: Dynamic Multiplier Analysis.}`.

Complete ledger recorded in [`SEC54_DOWNSTREAM_DEPENDENCY_LEDGER.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/final_editing/phase10a_sec53_contraction/SEC54_DOWNSTREAM_DEPENDENCY_LEDGER.csv).

---

## 6. SEARCH & JUSTIFICATION OF SENSITIVE TERMS

A comprehensive regex audit was conducted across all Version 7 `.tex` files for the target terms:
- **"Toda" / "Yamamoto" / "MWALD":** **ZERO** surviving methodological occurrences in the manuscript text (the only match for "toda" was the English word "today" in Section 2).
- **"five-sign" / "real dual":** **ZERO** occurrences in main text prose.
- **"System 4" / "System 5":** Occur only in Section 5.3.5 and Appendix E, where their demotion to auxiliary status is explicitly and transparently stated.
- **"external cost-push":** Occurs only as a descriptive label for System 5 in Section 5.3.5 and Appendix E.
- **"tournament":**
  - Section 5.3: Eradicated from all titles, headings, and prose. The LaTeX labels `sec:granger_tournament`, `sec:empirical_tournament`, and `sec:granger_tournament_setup` were retained strictly as internal aliases to avoid breaking backward cross-references from other chapters or sections.
  - Section 5.4: Paragraph title rewritten to "Dynamic Multiplier Analysis". The internal figure label `fig:tvar_girf_tournament` is retained as an internal label referenced by Section 6.
  - Sections 1, 2, 4, 6: These sections were outside the scope of Phase 10A (which was strictly §5.3 contraction). Their occurrences refer to general introductory or concluding discussions and will be addressed in final dissertation copyediting.

---

## 7. DIFF SUMMARY & STRICT CONFIRMATIONS

### Main Text Changes (Section 5.3):
- **Paragraphs Removed:** 6 paragraphs detailing failed individual bivariate tests for Systems 4 and 5; standalone tournament synthesis; redundant methodology/presentation paragraphs.
- **Paragraphs Substantially Rewritten:** Section 5.3.1 (framework and evidential standard), Section 5.3.2 (nominal core at $k=4$), Section 5.3.3 (commercial banking at $k=3$ with System 3 sensitivity note), Section 5.3.4 (pre-October 1973 conditional solvency system), Section 5.3.6 (methodological bridge to Section 5.4).
- **Paragraphs Newly Added:** Section 5.3.5 (formal limits of linear exercise and transparent reporting of unresolved systems).

### Tables:
- **Retained / Contracted:** Table 0 (`tab00_system_variable_definitions.tex`) contracted and updated.
- **Created / Merged:** Main Table A (`tab02_core_granger_evidence.tex`) created, unifying Systems 1, 2, and qualified pre-73 System 6.
- **Demoted to Appendix E:** Tables `tab02c` and `tab02d`.
- **Removed from Main Text:** Tables `tab02a`, `tab02b`, `tab02e`, `tab02_sign_discrimination_summary`, `tab_residual_diagnostics`.

### Strict Declarations:
- **NO NEW EMPIRICAL RESULTS WERE GENERATED.** All numbers stem directly from the Phase 9 canonicalization and partition audits.
- **NO NEW REFERENCES WERE ADDED.** Citations rely exclusively on the approved active bibliography.
- **CLEAN COMPILATION:** The master document `Chapter3_Paper.tex` compiles cleanly to 86 pages with **0 undefined citations, 0 undefined references, and 0 multiply defined labels**.

---

## 8. ARTIFACTS GENERATED IN THIS PHASE

The audit directory `paper/Version7/audits/final_editing/phase10a_sec53_contraction/` contains:
1. `PHASE10A_SEC53_CONTRACTION_REPORT.md` (this report)
2. `SEC53_EVIDENCE_HIERARCHY_LEDGER.csv` (evidence classification of all six systems)
3. `SEC53_TABLE_CROSSWALK.csv` (table contraction and migration mapping)
4. `SEC54_DOWNSTREAM_DEPENDENCY_LEDGER.csv` (audit of Section 5.4 cross-references)
5. `SYSTEM6_SIGN_SEMANTICS.md` (detailed sign-semantic derivation of pre-73 System 6)
6. `BEFORE_AFTER_SECTION_MAP.md` (structural transformation mapping)
7. `check_sys6_coefs.R` (verification script for System 6 pre-73 coefficients)
