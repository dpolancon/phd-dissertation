# 03 — R3–R8 Repair Ledger

**Session:** Final PDF Repair 03 — Bounded Consistency Pass  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Working Paper:** `workingpapers/chapter1/`  
**Date:** October 2026  

---

## 1. Summary of Non-Blocker Repairs (R3 through R8)

All six mandatory reader-level consistency findings (R3–R8) have been audited against empirical code, data files, and manuscript source, and resolved with zero scope expansion.

---

## 2. Itemized Repair Ledger

| ID | Location | Before | Source of Truth | After | Status |
|:---|:---|:---|:---|:---|:---:|
| **R3** | `appendices/appendix_B_data_diagnostics.tex` (line 215) | "Table~\ref{tab:app_ardl_search} displays the full specification grid ($p,q \in \{1,\dots,5\}$; Cases I--V)..." | Table A.3 contains a 25-row illustrative subset (5 lag pairs $\times$ Cases I–V) | "Table~\ref{tab:app_ardl_search} displays an illustrative diagnostic subset of the specification grid ($p,q \in \{1,\dots,5\}$; Cases I--V)..." | **RESOLVED** |
| **R3** | `appendixA/tables/table_A3_ardl_specification_search.tex` (line 42) | "ARDL($p,q$) specifications estimated with impulse dummies $D_{56}, D_{74}, D_{80}$... Full grid ($p,q = 1\text{--}6$; Cases I--V) available in replication code." | S1 grid uses $p,q \in \{1,\dots,5\}$ and permanent step controls $S_{yy,t}$ in estimation | "Illustrative diagnostic subset of ARDL($p,q$) specifications estimated with permanent step controls $S_{1956}, S_{1974}, S_{1980}$... Full 500-model specification grid ($p,q \in \{1,\dots,5\}$; Cases I--V; four dummy configurations) available in replication code." | **RESOLVED** |
| **R4** | `sections/04_econometric_replication.tex` (line 231) | "...admissibility requires the specification to pass the \citet{Pesaran2001} bounds test: the Wald $F$-statistic must exceed the upper critical bound at the 5\% level." | Eq. (18) defines $\mathcal{A}^F_{S1}$ at $p_F \leq 0.10$ ($N=102$), with nested 5% ($N=62$) and 1% ($N=13$) layers | "...outer admissibility requires the specification to pass the \citet{Pesaran2001} bounds test: the Wald $F$-statistic must exceed the upper critical bound at the 10\% level ($p_F \leq 0.10$), with stricter subsets evaluated at the 5\% and 1\% thresholds." | **RESOLVED** |
| **R5** | `sections/03_conceptual_framework.tex` (line 55) | "While real gross value added grew at an average annual rate of 3.3\% and real gross capital stock grew at 4.4\%..." | 3.3%/4.4% are mean log growth rates under Shaikh's $P_y$ deflator; 3.0%/4.1% are canonical mean log growth rates under $p^{KN}$ deflator | "While real gross value added grew at an average annual rate of 3.0\% and real gross capital stock grew at 4.1\% (or 3.3\% and 4.4\%, respectively, under Shaikh's published $P_y$ deflator)..." | **RESOLVED** |
| **R6** | `working_paper.tex` (Abstract, line 138) | "...substantial sensitivity ($\hat{\theta} \in [0.65, 0.95]$)..." | Table 8 shows Cases IV–V reach up to 2.20; $[0.65, 0.95]$ describes no-trend models | "...substantial sensitivity (with $\hat{\theta} \in [0.65, 0.95]$ among retained no-trend specifications, while trend-containing models reach 2.20)..." | **RESOLVED** |
| **R6** | `sections/01_introduction.tex` (line 8) | "...varies widely across the informational frontier ($\hat{\theta} \in [0.65, 0.95]$)." | Table 8 and Section 4.3 text | "...varies widely across the informational frontier (ranging from $\hat{\theta} \in [0.65, 0.95]$ among retained no-trend specifications, while trend-containing models reach 2.20)." | **RESOLVED** |
| **R6** | `sections/04_econometric_replication.tex` (line 410) | "...divergent estimates of the transformation elasticity ($\hat{\theta} \in [0.65, 0.95]$)." | Section 4.3 text | "...divergent estimates of the transformation elasticity (ranging across $\hat{\theta} \in [0.65, 0.95]$ in retained no-trend models, and reaching 2.20 in trend-containing specifications)." | **RESOLVED** |
| **R6** | `sections/05_discussion_conclusion.tex` (line 8) | "...across the bounds-passing ARDL grid ($\hat{\theta} \in [0.65, 0.95]$)..." | Section 4.3 text | "...across retained no-trend specifications in the bounds-passing ARDL grid ($\hat{\theta} \in [0.65, 0.95]$)..." | **RESOLVED** |
| **R6** | `sections/05_discussion_conclusion.tex` (line 23) | "...transformation elasticity ranges across the informational frontier from 0.65 to 0.95." | Section 4.3 text | "...transformation elasticity ranges across the informational frontier from 0.65 to 0.95 among retained no-trend specifications (reaching 2.20 in trend-containing models)." | **RESOLVED** |
| **R7A** | `sections/04_econometric_replication.tex` (line 490) | "\item \textbf{Saturated Trend Branch ($C_3$, Inadmissible):}" | All 6 trivariate models pass mechanical Tier 1 gates | "\item \textbf{Saturated Trend Branch ($C_3$, Statistical survivor; not preferred):}" | **RESOLVED** |
| **R7A** | `sections/04_econometric_replication.tex` (Table 12, lines 505, 508) | `Inadmissible (trend overparameterization)` / `Inadmissible (AIC winner; trend overparameterization)` | All 6 trivariate models pass mechanical Tier 1 gates | `Tier 1 statistical survivor; not preferred under deterministic criterion (trend overparameterization)` / `Tier 1 statistical survivor / AIC winner; not preferred under deterministic criterion (trend overparameterization)` | **RESOLVED** |
| **R7B** | `sections/04_econometric_replication.tex` (line 417) | "...estimating the output--capital relation requires including income distribution in the state vector." | Conditioning / structural recovery framing | "...recovering a stable long-run relation within the tested system grid requires conditioning the state vector on functional income distribution." | **RESOLVED** |
| **R7B** | `sections/04_econometric_replication.tex` (line 536) | "Including $\ln e_t$ controls for technique choice, allowing the long-run relation to be identified." | Heterodox political-economy interpretive status | "Conditioning on $\ln e_t$ accounts for these distributionally mediated adjustments, allowing a stable long-run cointegrating relation to be recovered within the trivariate system." | **RESOLVED** |
| **R7B** | `sections/04_econometric_replication.tex` (line 543) | "...not a fixed engineering multiplier. It is an institutional reality, fundamentally shaped by systemic crises and the ongoing balance of power between wages and profits." | Heterodox political-economy calibrated language | "...not an invariant engineering multiplier, but a macro-structural process conditioned by systemic crises and the historical distribution of income between wages and profits." | **RESOLVED** |
| **R7B** | `sections/04_econometric_replication.tex` (line 569) | "This shows that identifying a cointegrating relationship requires controlling for major institutional shocks..." | Empirical pattern vs universal requirement | "This pattern indicates that recovering system-level cointegration over the full sample depends on controlling for major institutional shocks..." | **RESOLVED** |
| **R8** | `sections/04_econometric_replication.tex` (line 222) | "\caption{Annual growth rates of output ($\Delta y_t$), gross capital ($\Delta k_t$), and net capital ($\Delta k^{net}_t$), 1947--2011.}" | `fig_A3_growth_rates.pdf` vector stream plots only $\Delta y_t$ and $\Delta k_t$ | "\caption{Annual growth rates of output ($\Delta y_t$) and gross capital ($\Delta k_t$), 1947--2011.}" | **RESOLVED** |

---

## 3. Numeric Provenance Note for R5

- **$P_y$ deflator (Shaikh 2016 published series):** $\Delta \ln(GVA / P_y) = 3.34\%$, $\Delta \ln(KGC / P_y) = 4.41\%$. Mean gross output-capital ratio is $0.534$.
- **$p^{KN}$ deflator (canonical NIPA GDP deflator, base 2011=100, used in ARDL and VECM estimation):** $\Delta \ln(GVA / p^{KN}) = 3.02\%$, $\Delta \ln(KGC / p^{KN}) = 4.09\%$.
- **Reconciliation:** Both sections now report the canonical $3.0\%$ and $4.1\%$ estimation figures, with Section 3 explicitly preserving the $3.3\%$ and $4.4\%$ $P_y$ provenance.
