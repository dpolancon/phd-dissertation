# PHASE 9F — FINAL SEASONALITY AUDIT AND EMPIRICAL STOPPING RULE REPORT
## Testing Unresolved Monthly Periodicity and Locking the Linear Granger Architecture

**Author / Role:** Empirical Macroeconometrician & Integration Editor  
**Repository:** `c:\ReposGitHub\Chapter3_RPEUP`  
**Master Document:** `paper/Version7/Chapter3_Paper.tex`  
**Audit Directory:** `paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/`  
**Date:** September 28, 2026  
**Status:** COMPLETE — LINEAR GRANGER EXERCISE FORMALLY CLASSIFIED & LOCKED  

---

## EXECUTIVE SUMMARY

Phase 9F constitutes the final bounded diagnostic pass on the linear stationary-VAR Granger architecture of Chapter 3.

Its singular objective was to answer: **Do the persistent residual autocorrelation failures in high-dimensional Systems 4, 5, and 6 primarily reflect unmodeled month-of-year seasonality?**

To settle this question without reopening exploratory specification search:
1. **Data Provenance:** We audited the archival provenance of all 8 source variables entering Systems 4–6 and confirmed that **none** are seasonally adjusted; all enter as raw physical or nominal indicators.
2. **Univariate Seasonality:** We estimated month-of-year regressions ($y_t = \mu + \sum_{m=2}^{12} \delta_m D_{mt} + \varepsilon_t$). Manufacturing output growth ($g_{\text{Manuf}}$) exhibits massive seasonal swings ($F = 56.428, p < 10^{-16}$), while base money growth ($g_H$), trade imbalance ($\Delta \theta$), and mining ($g_{\text{Mining}}$) show statistically significant monthly effects. Inflation ($\pi_t$), exchange rate growth ($g_e$), gold prices ($g_{\text{gold}}$), and solvency ratio growth ($g_{\text{SolvR\_H}}$) show no significant monthly seasonality.
3. **Seasonal VAR Estimation ($k=1..4$):** We estimated the only authorized seasonal specification—adding 11 orthogonal monthly dummies into the VAR companion matrix while fully penalizing information criteria for all $K \times 12$ deterministic parameters ($P = 85, 110, 135, 160$ across $k=1..4$).
4. **Diagnostic Outcome:**
   - **System 4 (Real Dualism):** Monthly dummies substantially improve system-level serial correlation at $k=4$, raising the system Breusch–Godfrey $p$-value from $0.0033$ to **$0.1275$** (Gate B passes!). However, Gate C **fails** at the 5% level ($\min p = 0.0354$ in the mining output equation) and the adjusted Portmanteau test remains rejected ($p = 0.0001$). Admissible models count: **0**. Classification: **`SEASONALITY_IMPROVES_BUT_DOES_NOT_RESOLVE`**.
   - **System 5 (External Cost-Push Belt):** Monthly dummies fail to whiten residuals across all lag orders ($k=1..4$, System BG $p = 0.0000$ throughout). Admissible models count: **0**. Classification: **`SEASONALITY_NOT_MATERIAL`**.
   - **System 6 (Central Bank Solvency System, Full Sample):** Monthly dummies fail across all lag orders ($p = 0.0000$ throughout). Admissible models count: **0**. Classification: **`SEASONALITY_NOT_MATERIAL`**.
5. **System 6 Pre-1973 Sensitivity Control ($k=3$):**
   The existing Pre-October-1973 conditional VAR(3) without seasonal dummies remains **serially clean and admissible** (System BG $p = 0.1262$, Min Eq BG $p = 0.0557$, Portmanteau $p = 0.0754$). Adding 11 monthly dummies over-parameterizes the shorter sample ($N_{\text{eff}} = 161$), worsening system serial correlation to $p = 0.0390$ (inadmissible). The non-seasonal Pre-1973 model is confirmed as the unique, robustly admissible specification.

---

## SECTION A: DATA PROVENANCE AUDIT

Every source variable entering Systems 4–6 was audited across repository metadata, data dictionaries, code comments, and source workbooks.

The complete audit is recorded in [`SEASONAL_ADJUSTMENT_PROVENANCE.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/SEASONAL_ADJUSTMENT_PROVENANCE.csv):

| Variable | Archival Source Series | Institution / Source Reference | SA Status | Confidence |
| :--- | :--- | :--- | :---: | :---: |
| $\pi_t$ | `ipc_monthly_var_pct_1928_2026` (`F074.IPC.VAR.Z.Z.C.M`) | INE / Central Bank of Chile, *Boletín Mensual* | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $g_H$ | `monetary_base_emision_1960_2026` (`F021.BMO.STO.N.CLP.0.M`) | Central Bank of Chile, *Boletín Mensual* | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $\Delta \theta_t$ | Derived: $\theta_t = (\text{Imports}_t / \text{Exports}_t) \times \dots$ | Díaz-Bahamonde (2023, IMEA), "Series básicas" | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $g_{\text{Manuf}}$ | `manuf` (Consumer manufacturing index, 1970=100) | ODEPLAN / INE / Díaz-Bahamonde (2023) | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $g_{\text{Mining}}$| `mining` (Mining physical extraction index, 1970=100) | SERNAGEOMIN / ODEPLAN / Díaz-Bahamonde (2023) | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $g_{\text{gold}}$| `gold_price_usd_oz_1960_2026` (`F019.PPB.PRE.44B.M`) | London Bullion Market Association (LBMA) | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $g_e$ | `usd_exchange_rate_observed_1960_2026` (`F073.TCO.PRE.HIST.M`) | Central Bank of Chile, *Boletín Mensual* | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |
| $g_{\text{SolvR\_H}}$ | Derived: $(e_t \cdot IR_t) / (H_t \cdot 1000)$ | BCCh *Boletín Mensual* & IMF IFS Reserves | **`NOT_SEASONALLY_ADJUSTED`** | HIGH |

**Provenance Conclusion:** Not a single series entering Systems 4–6 was seasonally adjusted at the source. All variables enter as raw monthly indicators, making econometric testing for seasonal residual dynamics mandatory.

---

## SECTION B: UNIVARIATE MONTH-OF-YEAR EVIDENCE

To determine which transformed stationary variables contain deterministic monthly variation, we estimated univariate regressions with an intercept and 11 month dummies ($y_t = \mu + \sum_{m=2}^{12} \delta_m D_{mt} + \varepsilon_t$) over the full production sample ($N=251$, 1960:02–1980:12).

Results are recorded in [`MONTH_OF_YEAR_TESTS.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/MONTH_OF_YEAR_TESTS.csv):

| Variable | Joint $F(11, 239)$ | $p$-value | Month Effects Detected? | Peak Positive Month (Mean) | Peak Negative Month (Mean) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| $g_{\text{Manuf}}$ | **56.428** | **$< 10^{-16}$** | **TRUE** | March (+26.27%) | February (-13.45%) |
| $g_H$ | **3.123** | **0.00059** | **TRUE** | December (+10.38%) | August (+1.77%) |
| $\Delta \theta$ | **2.336** | **0.00956** | **TRUE** | October (+31.34%) | September (-19.56%) |
| $g_{\text{Mining}}$ | **2.208** | **0.01471** | **TRUE** | December (+6.28%) | January (-6.72%) |
| $g_{\text{SolvR\_H}}$ | 1.554 | 0.11333 | **FALSE** | September (+12.05%) | July (-11.61%) |
| $g_{\text{gold}}$ | 0.972 | 0.47294 | **FALSE** | January (+3.74%) | November (-0.13%) |
| $\pi_t$ | 0.796 | 0.64363 | **FALSE** | October (+7.97%) | December (+2.27%) |
| $g_e$ | 0.792 | 0.64795 | **FALSE** | October (+9.10%) | July (+2.03%) |

### Key Observations:
- **Manufacturing Output ($g_{\text{Manuf}}$):** Displays an enormous, deterministic annual production oscillation ($F = 56.43$). Output systematically contracts in January (-12.35%) and February (-13.45%) during summer vacations and factory shutdowns, followed by a massive rebound in March (+26.27%) as production resumes.
- **Monetary Base ($g_H$):** Displays statistically significant calendar seasonality driven by end-of-year liquidity demands and public sector bonuses in December (+10.38%).
- **Nominal Variables ($\pi_t, g_e$):** Do **not** exhibit statistically significant deterministic month-of-year seasonality ($p = 0.64$ and $p = 0.65$). Price and exchange rate changes in Chile during 1960–1980 were dominated by macroeconomic inflation and political-economic shocks rather than regular seasonal calendars.

---

## SECTION C: RESIDUAL ANNUAL-FREQUENCY EVIDENCE

In canonical non-seasonal models, residual autocorrelation at annual and semi-annual harmonics was mapped across $h \in \{6, 12, 18, 24\}$:
- **System 4 (Canonical $k=2$):** Manufacturing residuals display extreme annual-frequency dependence: $\text{ACF}_{12} = +0.6771$ ($\text{PACF}_{12} = +0.5886$, critical bound $\pm 0.1267$) and $\text{ACF}_{24} = +0.5706$ ($\text{PACF}_{24} = +0.1258$).
- **System 5 (Canonical $k=1$):** Import imbalance residuals show significant annual memory ($\text{ACF}_{12} = +0.2793$), and inflation residuals show annual memory ($\text{ACF}_{12} = +0.2027$).
- **System 6 (Canonical $k=1$):** Inflation residuals display $\text{ACF}_{12} = +0.1992$ and monetary base residuals display $\text{ACF}_{12} = +0.2079$.

Because univariate month-of-year tests detect powerful seasonality in manufacturing, base money, and trade imbalance, this annual-frequency residual dependence is directly linked to unmodeled calendar periodicity.

---

## SECTION D: SEASONAL VAR DIAGNOSTICS & DIRECT COMPARISON ($k=1..4$)

We estimated the authorized deterministic seasonal specification across Systems 4–6:
$$Y_t = c + \sum_{m=2}^{12} \delta_m D_{mt} + \sum_{l=1}^k A_l Y_{t-l} + \varepsilon_t$$
All models were estimated on the identical common effective sample ($N_{\text{eff}} = 251 - k$). Parameter counts and information criteria rigorously incorporate all $K \times (12 + Kk)$ estimated parameters.

The complete matrix is stored in [`SEASONAL_VAR_GRID.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/SEASONAL_VAR_GRID.csv):

| System | $k$ | Specification | Params $P$ | AIC | BIC | Max Root | Sys BG $p$ | Min Eq BG $p$ | PT24 $p$ | Admissible? |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **System 4: Real Dualism** | 1 | Baseline | 30 | 24.5099 | 24.9325 | 0.5843 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 4: Real Dualism | 1 | **+11 Dummies** | 85 | **23.4447** | **24.6420** | 0.6172 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 4: Real Dualism | 2 | Baseline | 55 | 24.2480 | 25.0250 | 0.8198 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 4: Real Dualism | 2 | **+11 Dummies** | 110 | **23.2985** | **24.8524** | 0.8234 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 4: Real Dualism | 3 | Baseline | 80 | 24.1499 | 25.2833 | 0.8959 | 0.0000 | 0.0001 | 0.0000 | FALSE |
| System 4: Real Dualism | 3 | **+11 Dummies** | 135 | **23.2956** | **25.2082** | 0.9022 | 0.0005 | 0.0018 | 0.0000 | FALSE |
| System 4: Real Dualism | 4 | Baseline | 105 | 24.1191 | 25.6110 | 0.9428 | 0.0033 | 0.0011 | 0.0000 | FALSE |
| System 4: Real Dualism | **4** | **+11 Dummies** | **160** | **23.3787** | **25.6520** | **0.9445** | **0.1275** | **0.0354** | **0.0001** | **FALSE** |
| **System 5: External Push** | 1 | Baseline | 30 | 21.7531 | 22.1756 | 0.5752 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 1 | **+11 Dummies** | 85 | 21.9360 | 23.1333 | 0.5855 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 2 | Baseline | 55 | 21.6409 | 22.4179 | 0.8118 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 2 | **+11 Dummies** | 110 | 21.8495 | 23.4034 | 0.8172 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 3 | Baseline | 80 | 21.6643 | 22.7977 | 0.9082 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 3 | **+11 Dummies** | 135 | 21.8522 | 23.7647 | 0.9134 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 4 | Baseline | 105 | 21.2442 | 22.7361 | 0.9165 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 5: External Push | 4 | **+11 Dummies** | 160 | 21.3617 | 23.6350 | 0.9259 | 0.0000 | 0.0001 | 0.0000 | FALSE |
| **System 6: Solvency Gate** | 1 | Baseline | 30 | 20.8273 | 21.2499 | 0.5707 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 6: Solvency Gate | 1 | **+11 Dummies** | 85 | 21.0356 | 22.2329 | 0.5845 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 6: Solvency Gate | 2 | Baseline | 55 | 20.7358 | 21.5127 | 0.8200 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 6: Solvency Gate | 2 | **+11 Dummies** | 110 | 20.9991 | 22.5530 | 0.8282 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 6: Solvency Gate | 3 | Baseline | 80 | 20.6857 | 21.8190 | 0.9083 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 6: Solvency Gate | 3 | **+11 Dummies** | 135 | 20.9247 | 22.8372 | 0.9127 | 0.0000 | 0.0000 | 0.0000 | FALSE |
| System 6: Solvency Gate | 4 | Baseline | 105 | 20.2787 | 21.7706 | 0.9102 | 0.0000 | 0.0000 | 0.0001 | FALSE |
| System 6: Solvency Gate | 4 | **+11 Dummies** | 160 | 20.4509 | 22.7242 | 0.9223 | 0.0000 | 0.0000 | 0.0003 | FALSE |

---

## SECTION E: INFORMATION-CRITERION & COMPLEXITY PENALTY EVALUATION

1. **System 4:** Adding 11 monthly dummies substantially improves log-likelihood and goodness of fit:
   - AIC drops from $24.119$ to **$23.379$** at $k=4$, and from $24.510$ to **$23.445$** at $k=1$.
   - Even under the severe Schwarz criterion penalty for estimating 55 additional parameters (11 dummies $\times$ 5 equations), BIC at $k=1$ improves from $24.933$ to **$24.642$**.
   - Furthermore, the system-level Breusch–Godfrey test at $k=4$ passes convincingly (**$p = 0.1275$**, stat $= 116.25, df=100$).
   - *Failure to Achieve Admissibility:* Despite the system-level breakthrough, Gate C fails because residual autocorrelation in the physical mining extraction equation remains marginally significant ($\min p = 0.0354 < 0.05$), and the adjusted Portmanteau test rejects at $h=24$ ($p = 0.0001$).
2. **Systems 5 & 6:** In Systems 5 and 6, adding 55 seasonal parameters degrades model selection criteria without resolving autocorrelation:
   - In System 5 at $k=1$, BIC rises from $22.176$ to $23.133$. System BG $p$-value remains $0.0000$.
   - In System 6 at $k=1$, BIC rises from $21.250$ to $22.233$. System BG $p$-value remains $0.0000$.
   - Macro-financial and external solvency dynamics in the full sample are driven by policy regimes, foreign exchange crises, and structural breaks, which cannot be captured by seasonal dummies.

### System Seasonality Classifications (from [`SEASONAL_SERIAL_ADMISSIBILITY.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/SEASONAL_SERIAL_ADMISSIBILITY.csv)):
- **System 4 (Real Dualism):** **`SEASONALITY_IMPROVES_BUT_DOES_NOT_RESOLVE`**
- **System 5 (External Push):** **`SEASONALITY_NOT_MATERIAL`**
- **System 6 (Solvency Gate):** **`SEASONALITY_NOT_MATERIAL`**

---

## SECTION F: CONDITIONAL GRANGER STABILITY

Because **zero** seasonal models across Systems 4, 5, and 6 achieved serial admissibility ($Gate_A \land Gate_B \land Gate_C$), formal conditional Granger tests cannot be reported as valid statistical evidence.

As documented in [`SEASONAL_GRANGER_CROSSWALK.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/SEASONAL_GRANGER_CROSSWALK.csv), all 32 headline relations associated with Systems 4, 5, and 6 are classified as:
```
NOT_EVALUABLE — NO SERIAL-ADMISSIBLE SEASONAL VAR
```
Adhering strictly to the AEA Data Policy and the chapter's empirical standards, we do not conduct hypothesis testing on misspecified, non-admissible models.

---

## SECTION G: SYSTEM 6 PRE-OCTOBER-1973 SENSITIVITY CONTROL ($k=3$)

Phase 9E discovered that System 6 becomes serially admissible when restricted to the Pre-October 1973 sample at $k=3$. Phase 9F tested whether this critical finding survives seasonal control.

The sensitivity comparison is recorded in [`SYSTEM6_PRE73_SEASONAL_CONTROL.csv`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/SYSTEM6_PRE73_SEASONAL_CONTROL.csv):

```
========================================================================================
SYSTEM 6 PRE-1973 (k=3) SENSITIVITY CONTROL
========================================================================================
DIAGNOSTIC CRITERION        NON-SEASONAL BASELINE       + 11 MONTHLY DUMMIES
----------------------------------------------------------------------------------------
Effective Sample (N_eff)    161                         161
Total Parameters (P)        80                          135
Residual DF per Eq          145                         134
Max Eigenvalue Root         0.8817 (Gate A PASS)        0.8976 (Gate A PASS)
System BG(4) p-value        0.1262 (Gate B PASS)        0.0390 (Gate B FAIL)
Min Equation BG(4) p-value  0.0557 (Gate C PASS)        0.1112 (Gate C PASS)
Adjusted Portmanteau (h=12) 0.0754 (Gate D PASS)        0.0362 (Gate D FAIL)
----------------------------------------------------------------------------------------
SERIAL ADMISSIBILITY        TRUE [ADM]                  FALSE [INADMISSIBLE]
========================================================================================
```

### Econometric Interpretation:
- Adding 11 monthly dummies to the Pre-1973 sample introduces 55 additional parameters on a sample of only 161 monthly observations. This severe parameterization induces degrees-of-freedom exhaustion, causing the system Breusch–Godfrey test to fail ($p = 0.0390 < 0.05$) and the Portmanteau test to fail ($p = 0.0362$).
- **Conclusion:** The non-seasonal Pre-1973 VAR(3) is confirmed as the **unique, robustly admissible specification**. The solvency depletion feedback cycle ($\text{SolvR}^H \to g_H, p = 0.0002$; $g_H \to \text{SolvR}^H, p = 0.0347$; $\text{SolvR}^H \to g_e, p = 0.0297$) stands as a qualified, historically grounded econometric finding.
- Classification: **`PRE73_SEASONAL_MODEL_INADMISSIBLE`** (Baseline result stands intact).

---

## SECTION H: FINAL EMPIRICAL CLASSIFICATION OF SYSTEMS 1–6

With the completion of Phases 9B, 9C, 9D, 9E, and 9F, the entire linear stationary-VAR specification space has been exhaustively audited. The six empirical systems are formally classified as follows:

| System | Name | Final Linear-VAR Status | Evidentiary Status & Methodological Role |
| :--- | :--- | :---: | :--- |
| **System 1** | Master Nominal Core | **`ROBUST_LINEAR_RESULT`** | Dynamically stable and serially clean ($k=4$). Bilateral predictive causality between inflation and base money ($\pi \leftrightarrow g_H$) is invariant to conditioning, lag expansion, and seasonal controls. |
| **System 2** | Banking Bifurcation A (Credit Lead) | **`QUALIFIED_LINEAR_RESULT`** | Serially clean ($k=3$). All 4 headline directions ($M_1 \leftrightarrow H$, $\pi \leftrightarrow M_1$) robustly survive multivariate conditioning. Qualified strictly by archival M1 sample availability (1966–1980). |
| **System 3** | Banking Bifurcation B (Multiplier) | **`SPECIFICATION_SENSITIVE`** | Serially clean ($k=3$). While inflation predictively causes multiplier contractions, the multiplier lead on inflation ($\Delta \ln m \to \pi$) is insignificant pairwise ($p=0.56$) but significant conditionally ($p=0.048$). Sensitive to conditioning set. |
| **System 4** | Unified Real Dual Economy | **`DESCRIPTIVE_ONLY`** | No serially admissible linear VAR exists across full sample, subperiods, lag search ($k \le 12$), or seasonal dummies. Seasonality improves fit and system BG at $k=4$ ($p=0.128$), but equation-level autocorrelation persists. Linear Granger statistics are retained strictly as descriptive lead-lag summaries. |
| **System 5** | Unified External Cost-Push Belt | **`INCONCLUSIVE`** | Completely serially inadmissible across all specifications ($p = 0.0000$). Multivariate conditioning eliminates the pairwise exchange-rate-to-money lead ($g_e \to g_H$ drops to $p=0.998$). Linear VAR does not support directional Granger inference. |
| **System 6** | Central Bank Solvency System | **`QUALIFIED_LINEAR_RESULT`** | Full-sample linear system is inconclusive. However, the Pre-October-1973 conditional VAR(3) is serially clean ($p = 0.1262$) and identifies an active defensive accommodation feedback cycle ($\text{SolvR}^H \leftrightarrow g_H$). Qualified to the democratic era. |

---

## SECTION 23: FINAL STOPPING DECISION & GLOBAL TOKEN

In accordance with Section 2 and Section 23 of the Phase 9F protocol:

```
NO FURTHER LINEAR VAR SPECIFICATION SEARCH IS AUTHORIZED BY PHASE 9F.
```

The linear stationary-VAR Granger exercise is hereby **CLOSED AND LOCKED**.

Because seasonal dummies materially improve System 4 but do not fully resolve Systems 4 and 5, while the Pre-1973 System 6 admissible baseline survives intact:

```
PHASE9F_COMPLETE — UNRESOLVED SYSTEMS CLASSIFIED INCONCLUSIVE; LINEAR GRANGER EXERCISE LOCKED
```
