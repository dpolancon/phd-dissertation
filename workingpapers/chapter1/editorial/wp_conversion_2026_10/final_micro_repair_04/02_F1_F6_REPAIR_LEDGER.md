# 02 — F1–F6 Repair Ledger

**Pass:** Final Micro-Repair 04 — Closed-Loop PDF Verification  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Directory:** `workingpapers/chapter1/`  
**Date:** October 2026  

---

## 1. Summary of Repairs

| ID | Location | Before | Source of Truth / Governing Rule | After | Status |
|:---|:---|:---|:---|:---|:---|
| **F1** | `sections/03_conceptual_framework.tex` (L86), `appendices/appendix_A_ODE.tex` (L4, L8) | $\hat{k} \equiv \dot{K}/K - \delta$ | $\hat{k} \equiv \dot{K}/K$ is the net growth rate of capital; gross investment is $I/K = \hat{k} + \delta = \phi^p B$; zero gross investment is $\hat{k} = -\delta$. | Defined $\hat{k} \equiv \dot{K}/K$ as the net growth rate of the capital stock, with gross investment rate $I/K = \hat{k} + \delta$ and $\hat{k}^*=0$ stable, $\hat{k}^*=-\delta$ unstable. | **RESOLVED** |
| **F2** | `sections/04_econometric_replication.tex` (L362) | "Bivariate models omitting these controls yield nonstationary residuals... Restoring stationary errors requires these step controls..." | S1 admissible grid (`S1_admissible.csv`): 8 no-dummy Case-II specifications pass $F$-bounds without dummies. | "Most surviving specifications require historical step controls. Of the 102 $F$-admissible models at the 10% level, 94 include at least one step control ($S_{yy,t}$), while eight no-dummy Case-II specifications remain $F$-admissible... these controls materially improve cointegration survival..." | **RESOLVED** |
| **F3** | `working_paper.tex` (L138), `sections/01_introduction.tex` (L10), `sections/04_econometric_replication.tex` (L415, L424, L565), `sections/05_discussion_conclusion.tex` (L25) | "fails to cointegrate across all 48 attempted VECM specifications" | 48 attempted, 36 estimated (12 $C_1$ models non-converged in `tsDyn`); none of the 36 estimated models is admissible. Non-converged models cannot be classified as failing cointegration. | Replaced with explicit distinction: across 48 attempted bivariate specifications, 36 are successfully estimated, and none of those 36 identifies an admissible cointegrating relation. | **RESOLVED** |
| **F4** | `sections/04_econometric_replication.tex` (L536), `sections/05_discussion_conclusion.tex` (L6) | "...causing bivariate cointegration tests to fail. Conditioning on $\ln e_t$ accounts for these distributionally mediated shifts..." / "...causing bivariate cointegration to break down." | VECM does not identify choice-of-technique causal channel; recovery of cointegration is consistent with distributional conditioning, but mechanism is an interpretive framework. | "When distribution is omitted, the tested bivariate systems exhibit persistent drift in the output--capital relation. The recovery of cointegration in specifications including $\ln e_t$ is consistent with distributionally mediated changes in technique and work organization, but the VECM does not identify that mechanism causally." | **RESOLVED** |
| **F5** | `sections/04_econometric_replication.tex` (L567), `sections/05_discussion_conclusion.tex` (L16) | "Adding the four years of the Great Recession (2008--2011) disrupts this relation... causing bivariate cointegration to break down." / "...adding the Great Recession breaks the relation..." | Sample sensitivity / historical coincidence between 1947–2007 (12 admissible) and 1947–2011 (0 admissible); not identified causal breakdown. | "The bivariate relation is recoverable over 1947--2007 but not over the full 1947--2011 sample. The loss of cointegration coincides with inclusion of the Great Recession years, during which value added fell sharply relative to the slow-depreciating capital stock." | **RESOLVED** |
| **F6** | `appendixA/figures/fig_A5_dummies_residuals.pdf` | Legend displayed `D_56`, `D_74`, `D_80` while caption and text refer to pulse markers $P_{56}, P_{74}, P_{80}$. | Alignment of figure graphical legend with text and caption nomenclature. | Redacted `D_56`, `D_74`, `D_80` and inserted `P_56`, `P_74`, `P_80` using Helvetica 8pt font at exact coordinates in vector PDF. | **RESOLVED** |

---

## 2. File Modification Audit

All edits are strictly confined to:
1. `workingpapers/chapter1/sections/03_conceptual_framework.tex` (F1)
2. `workingpapers/chapter1/appendices/appendix_A_ODE.tex` (F1)
3. `workingpapers/chapter1/sections/04_econometric_replication.tex` (F2, F3, F4, F5)
4. `workingpapers/chapter1/working_paper.tex` (F3)
5. `workingpapers/chapter1/sections/01_introduction.tex` (F3)
6. `workingpapers/chapter1/sections/05_discussion_conclusion.tex` (F3, F4, F5)
7. `workingpapers/chapter1/appendixA/figures/fig_A5_dummies_residuals.pdf` (F6)
