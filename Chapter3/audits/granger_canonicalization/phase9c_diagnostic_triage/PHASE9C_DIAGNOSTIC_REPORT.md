# PHASE 9C DIAGNOSTIC REPORT: VAR SERIAL-CORRELATION DIAGNOSTIC TRIAGE

**Date:** 2026-09-28  
**Repository:** `c:\ReposGitHub\Chapter3_RPEUP`  
**Target Manuscript:** `paper/Version7/Chapter3_Paper.tex`  
**Status:** `PHASE9C_DIAGNOSTIC_TRIAGE_COMPLETE — VAR SPECIFICATION REVIEW REQUIRED`  

---

## SECTION A: CANONICAL REPRODUCTION GATE

Before performing diagnostic evaluations, all six stationary VAR specifications were reconstructed from raw inputs using the exact sample windows, transformations, and deterministic terms from the canonical production script (`codes/sec43_tab02_sequential_granger_battery.R`).

| System | Canonical $k^*$ | Sample | $N$ | Effective Obs ($k^*$) | SBIC Value ($k^*$) | Existing Result Reproduced? |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Step 1: Master Nominal Core** | $k=3$ | Full (1960--1980) | 250 | 248 | 7.2504 | **PASS** |
| **Step 2: Banking Bifurcation A (Credit Lead)** | $k=1$ | Raw66 (1966--1980) | 180 | 179 | 10.2883 | **PASS** |
| **Step 3: Banking Bifurcation B (Multiplier)** | $k=1$ | Raw66 (1966--1980) | 180 | 179 | 10.2883 | **PASS** |
| **Step 4: Unified Real Dual Economy** | $k=2$ | Full (1960--1980) | 250 | 249 | 24.8285 | **PASS** |
| **Step 5: Unified External Cost-Push Belt** | $k=1$ | Full (1960--1980) | 250 | 250 | 22.1091 | **PASS** |
| **Step 6: Unified Central Bank Solvency System** | $k=1$ | Full (1960--1980) | 250 | 250 | 21.1919 | **PASS** |

*Verdict:* Canonical reproduction is 100% verified across all dimensions. Proceeding to diagnostic interpretation.

---

## SECTION B: SYSTEM-LEVEL SERIAL CORRELATION

Multivariate residual autocorrelation tests evaluated through lag 4 on the full VAR residual vector (`lags.bg = 4`), alongside finite-sample adjusted Portmanteau tests (`lags.pt = 16`).

| System | Variables ($K$) | Canonical $k^*$ | System BG Stat | df | System BG $p$ | Adjusted Portmanteau $p$ | Initial System Classification |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **Step 1: Nominal Core** | 2 | $k=3$ | 23.242 | 16 | **0.1074** | 0.0358 (asymp: 0.0555) | **PASS at System Level (5%)** |
| **Step 2: Commercial Credit** | 3 | $k=1$ | 101.328 | 36 | **< 0.0001** | < 0.0001 | **FAIL at System Level (5%)** |
| **Step 3: Multiplier Deconstruction** | 3 | $k=1$ | 101.328 | 36 | **< 0.0001** | < 0.0001 | **FAIL at System Level (5%)** |
| **Step 4: Real Sector Dualism** | 5 | $k=2$ | 228.740 | 100 | **< 0.0001** | < 0.0001 | **FAIL at System Level (5%)** |
| **Step 5: External Cost-Push Belt** | 5 | $k=1$ | 310.163 | 100 | **< 0.0001** | < 0.0001 | **FAIL at System Level (5%)** |
| **Step 6: Solvency System** | 5 | $k=1$ | 314.300 | 100 | **< 0.0001** | < 0.0001 | **FAIL at System Level (5%)** |

*Note on Steps 2 and 3:* Because $d\ln m_t \equiv g_{M1,t} - g_{H,t}$ is an exact linear transformation of the money variables, the trivariate system vectors $[\pi, g_{M1}, g_H]'$ and $[\pi, g_H, d\ln m]'$ span identical linear spaces. Consequently, their system-level log-likelihood, SBIC, multivariate residual covariance matrix, and multivariate Breusch–Godfrey statistics are algebraically identical.

---

## SECTION C: EQUATION-LEVEL LOCALIZATION AT CANONICAL $k^*$

To determine whether serial correlation is concentrated in specific transmission channels or infects the entire system, Breusch–Godfrey LM tests ($q=4$) were evaluated on each equation in the VAR:

| System | Equation (DV) | Regressors in VAR Equation | Canonical $k^*$ | BG Stat ($\chi^2$) | df | BG $p$-value | Pass at 5%? |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: | :---: |
| **Step 1: Nominal Core** | $\pi_t$ (CPI Inflation) | $c + \sum_{i=1}^3 (\pi_{t-i}, g_{H,t-i})$ | $k=3$ | 16.549 | 4 | **0.0024** | **FAIL** |
| | $g_{H,t}$ (Base Money) | $c + \sum_{i=1}^3 (\pi_{t-i}, g_{H,t-i})$ | $k=3$ | 3.574 | 4 | **0.4667** | **PASS** |
| **Step 2: Commercial Credit** | $\pi_t$ (CPI Inflation) | $c + \sum_{i=1}^1 (\pi_{t-i}, g_{M1,t-i}, g_{H,t-i})$ | $k=1$ | 16.806 | 4 | **0.0021** | **FAIL** |
| | $g_{M1,t}$ (Narrow Money) | $c + \sum_{i=1}^1 (\pi_{t-i}, g_{M1,t-i}, g_{H,t-i})$ | $k=1$ | 27.904 | 4 | **< 0.0001** | **FAIL** |
| | $g_{H,t}$ (Base Money) | $c + \sum_{i=1}^1 (\pi_{t-i}, g_{M1,t-i}, g_{H,t-i})$ | $k=1$ | 22.609 | 4 | **0.0002** | **FAIL** |
| **Step 3: Multiplier** | $\pi_t$ (CPI Inflation) | $c + \sum_{i=1}^1 (\pi_{t-i}, g_{H,t-i}, d\ln m_{t-i})$ | $k=1$ | 16.806 | 4 | **0.0021** | **FAIL** |
| | $g_{H,t}$ (Base Money) | $c + \sum_{i=1}^1 (\pi_{t-i}, g_{H,t-i}, d\ln m_{t-i})$ | $k=1$ | 22.609 | 4 | **0.0002** | **FAIL** |
| | $d\ln m_t$ (Multiplier) | $c + \sum_{i=1}^1 (\pi_{t-i}, g_{H,t-i}, d\ln m_{t-i})$ | $k=1$ | 9.570 | 4 | **0.0483** | **FAIL** |
| **Step 4: Real Dualism** | $\pi_t$ (CPI Inflation) | $c + \sum_{i=1}^2 (\dots)$ | $k=2$ | 28.015 | 4 | **< 0.0001** | **FAIL** |
| | $g_{H,t}$ (Base Money) | $c + \sum_{i=1}^2 (\dots)$ | $k=2$ | 25.156 | 4 | **< 0.0001** | **FAIL** |
| | $d\theta_t$ (Trade Imbalance) | $c + \sum_{i=1}^2 (\dots)$ | $k=2$ | 12.010 | 4 | **0.0173** | **FAIL** |
| | $g_{\text{Manuf},t}$ (Manufacturing) | $c + \sum_{i=1}^2 (\dots)$ | $k=2$ | 26.458 | 4 | **< 0.0001** | **FAIL** |
| | $g_{\text{Mining},t}$ (Mining) | $c + \sum_{i=1}^2 (\dots)$ | $k=2$ | 20.630 | 4 | **0.0004** | **FAIL** |
| **Step 5: External Cost-Push** | $g_{\text{gold},t}$ (World Gold) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 16.769 | 4 | **0.0021** | **FAIL** |
| | $g_{e,t}$ (Exchange Rate) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 34.373 | 4 | **< 0.0001** | **FAIL** |
| | $d\theta_t$ (Trade Imbalance) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 47.295 | 4 | **< 0.0001** | **FAIL** |
| | $g_{H,t}$ (Base Money) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 29.347 | 4 | **< 0.0001** | **FAIL** |
| | $\pi_t$ (CPI Inflation) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 29.487 | 4 | **< 0.0001** | **FAIL** |
| **Step 6: Solvency Gate** | $g_{\text{SolvR}_H,t}$ (Solvency) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 16.308 | 4 | **0.0026** | **FAIL** |
| | $g_{\text{gold},t}$ (World Gold) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 15.717 | 4 | **0.0034** | **FAIL** |
| | $g_{e,t}$ (Exchange Rate) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 33.837 | 4 | **< 0.0001** | **FAIL** |
| | $g_{H,t}$ (Base Money) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 35.044 | 4 | **< 0.0001** | **FAIL** |
| | $\pi_t$ (CPI Inflation) | $c + \sum_{i=1}^1 (\dots)$ | $k=1$ | 28.079 | 4 | **< 0.0001** | **FAIL** |

---

## SECTION D: LAG DIAGNOSTIC PATH ($k = 1, \dots, 4$)

Diagnostic tracking across the entire candidate lag grid $k \in \{1, 2, 3, 4\}$:

| System | $k$ | SBIC | System BG $p$ | All Eqs Clean? | Min Eq $p$ | Max Root | Stability | Total Params | Resid DF |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Step 1: Nominal Core** | 1 | 7.3826 | < 0.0001 | FALSE | < 0.0001 | 0.5598 | STABLE | 6 | 247 |
| | 2 | 7.2965 | < 0.0001 | FALSE | < 0.0001 | 0.8122 | STABLE | 10 | 244 |
| | **3$^a$** | **7.2504** | **0.1074** | **FALSE** | **0.0024** | **0.8971** | **STABLE** | **14** | **241** |
| | **4** | **7.2640** | **0.7891** | **TRUE** | **0.2008** | **0.9391** | **STABLE** | **18** | **238** |
| **Step 2: Commercial Credit** | **1$^a$** | **10.2883** | **< 0.0001** | **FALSE** | **< 0.0001** | **0.6543** | **STABLE** | **12** | **175** |
| | 2 | 10.3214 | 0.0006 | FALSE | 0.0004 | 0.8427 | STABLE | 21 | 171 |
| | **3** | **10.3040** | **0.1939** | **TRUE** | **0.1054** | **0.9193** | **STABLE** | **30** | **167** |
| | 4 | 10.4823 | 0.0808 | TRUE | 0.1925 | 0.9473 | STABLE | 39 | 163 |
| **Step 3: Multiplier** | **1$^a$** | **10.2883** | **< 0.0001** | **FALSE** | **0.0002** | **0.6543** | **STABLE** | **12** | **175** |
| | 2 | 10.3214 | 0.0006 | FALSE | 0.0004 | 0.8427 | STABLE | 21 | 171 |
| | **3** | **10.3040** | **0.1939** | **TRUE** | **0.1054** | **0.9193** | **STABLE** | **30** | **167** |
| | 4 | 10.4823 | 0.0808 | FALSE | 0.0320 | 0.9473 | STABLE | 39 | 163 |
| **Step 4: Real Dualism** | 1 | 24.8432 | < 0.0001 | FALSE | < 0.0001 | 0.5843 | STABLE | 30 | 244 |
| | **2$^a$** | **24.8285** | **< 0.0001** | **FALSE** | **< 0.0001** | **0.8198** | **STABLE** | **55** | **238** |
| | 3 | 24.9573 | < 0.0001 | FALSE | 0.0001 | 0.8959 | STABLE | 80 | 232 |
| | 4 | 25.1667 | 0.0033 | FALSE | 0.0011 | 0.9428 | STABLE | 105 | 226 |
| **Step 5: External Cost-Push** | **1$^a$** | **22.1091** | **< 0.0001** | **FALSE** | **< 0.0001** | **0.5752** | **STABLE** | **30** | **244** |
| | 2 | 22.2263 | < 0.0001 | FALSE | < 0.0001 | 0.8118 | STABLE | 55 | 238 |
| | 3 | 22.4797 | < 0.0001 | FALSE | < 0.0001 | 0.9082 | STABLE | 80 | 232 |
| | 4 | 22.2918 | < 0.0001 | FALSE | < 0.0001 | 0.9165 | STABLE | 105 | 226 |
| **Step 6: Solvency Gate** | **1$^a$** | **21.1919** | **< 0.0001** | **FALSE** | **< 0.0001** | **0.5707** | **STABLE** | **30** | **244** |
| | 2 | 21.3319 | < 0.0001 | FALSE | < 0.0001 | 0.8200 | STABLE | 55 | 238 |
| | 3 | 21.5111 | < 0.0001 | FALSE | < 0.0001 | 0.9083 | STABLE | 80 | 232 |
| | 4 | 21.3263 | < 0.0001 | FALSE | < 0.0001 | 0.9102 | STABLE | 105 | 226 |

---

## SECTION E: FIRST DIAGNOSTIC-CLEAN LAG

| System | Canonical $k^*$ | First Clean Lag | Exists within $k \in \{1,\dots,4\}$? | System BG $p$ at Clean Lag | Min Equation $p$ at Clean Lag | Stability Status |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Step 1: Nominal Core** | $k=3$ | **$k=4$** | **YES** | 0.7891 | 0.2008 | STABLE (0.9391) |
| **Step 2: Commercial Credit** | $k=1$ | **$k=3$** | **YES** | 0.1939 | 0.1054 | STABLE (0.9193) |
| **Step 3: Multiplier Deconstruction** | $k=1$ | **$k=3$** | **YES** | 0.1939 | 0.1054 | STABLE (0.9193) |
| **Step 4: Real Sector Dualism** | $k=2$ | **NONE** | **NO** | 0.0033 (at $k=4$) | 0.0011 (at $k=4$) | STABLE (0.9428) |
| **Step 5: External Cost-Push Belt** | $k=1$ | **NONE** | **NO** | < 0.0001 (at $k=4$) | < 0.0001 (at $k=4$) | STABLE (0.9165) |
| **Step 6: Solvency System** | $k=1$ | **NONE** | **NO** | < 0.0001 (at $k=4$) | < 0.0001 (at $k=4$) | STABLE (0.9102) |

---

## SECTION F: EFFECT ON GRANGER CONCLUSIONS (INFORMATIONAL COMPARISON)

For systems where a higher lag eliminates residual autocorrelation (Steps 1, 2, and 3), the table below evaluates whether substantive Granger causality findings change between canonical $k^*$ and the first clean lag:

| Relation | Canonical $k^*$ Result | First Clean Lag Result | Sign Preserved? | Significance Status Preserved? | Material Substantive Change? |
| :--- | :--- | :--- | :---: | :---: | :---: |
| **Step 1:** $\pi \to g_H$ | $k=3$: $F=20.32, p < 0.0001, \sum\hat{\beta}=+0.595$ | $k=4$: $F=15.00, p < 0.0001, \sum\hat{\beta}=+0.680$ | YES (+) | YES ($p < 0.001$) | **NO** |
| **Step 1:** $g_H \to \pi$ | $k=3$: $F=5.54, p = 0.0011, \sum\hat{\beta}=+0.421$ | $k=4$: $F=2.72, p = 0.0305, \sum\hat{\beta}=+0.380$ | YES (+) | YES ($p < 0.05$) | **NO** |
| **Step 2:** $M1 \to H$ | $k=1$: $F=21.45, p < 0.0001, \sum\hat{\beta}=+0.478$ | $k=3$: $F=6.17, p = 0.0005, \sum\hat{\beta}=+0.782$ | YES (+) | YES ($p < 0.001$) | **NO** |
| **Step 2:** $H \to M1$ | $k=1$: $F=15.83, p = 0.0001, \sum\hat{\beta}=+0.284$ | $k=3$: $F=5.17, p = 0.0019, \sum\hat{\beta}=+0.468$ | YES (+) | YES ($p < 0.01$) | **NO** |
| **Step 2:** $\pi \to M1$ | $k=1$: $F=14.32, p = 0.0002, \sum\hat{\beta}=+0.171$ | $k=3$: $F=8.95, p < 0.0001, \sum\hat{\beta}=+0.323$ | YES (+) | YES ($p < 0.001$) | **NO** |
| **Step 2:** $M1 \to \pi$ | $k=1$: $F=14.00, p = 0.0002, \sum\hat{\beta}=+0.401$ | $k=3$: $F=5.61, p = 0.0011, \sum\hat{\beta}=+0.671$ | YES (+) | YES ($p < 0.01$) | **NO** |
| **Step 3:** $m \to \pi$ | $k=1$: $F=0.34, p = 0.5617, \sum\hat{\beta}=-0.064$ | $k=3$: $F=0.15, p = 0.9331, \sum\hat{\beta}=-0.155$ | YES (-) | YES ($p > 0.50$, Non-causality) | **NO** |
| **Step 3:** $\pi \to m$ | $k=1$: $F=2.37, p = 0.1257, \sum\hat{\beta}=-0.070$ | $k=3$: $F=5.13, p = 0.0020, \sum\hat{\beta}=-0.189$ | YES (-) | **Becomes Significant at 1%** | **POSSIBLY (Reinforcing)** |

*Substantive Evaluation:*  
- In **Steps 1 and 2**, all directional conclusions, signs, and significance levels ($p < 0.05$) are completely identical between canonical $k^*$ and clean lags.
- In **Step 3**, inflation predicting money multiplier contraction ($\pi \to m$) transitions from statistically insignificant at 1 month ($p = 0.126$) to statistically significant at 3 months ($p = 0.0020$). This transition is already explicitly discussed and documented in the Chapter 3 text (Section 5.3.4, paragraph 80).

---

## SECTION G: INFERENCE ISSUES DEFERRED

In strict compliance with Section 9 of the triage protocol, no robust standard error corrections, HAC weighting, or wild bootstrap adjustments were applied. The non-serial residual properties established in Phase 9B remain deferred:

1. **Autoregressive Conditional Heteroskedasticity (ARCH LM):**
   - Rejection of no-ARCH null ($p < 0.005$) across all six systems.
2. **Multivariate Heteroskedasticity (White Test):**
   - Rejection of homoskedasticity ($p < 0.0001$) in all six systems.
3. **Non-Normality (Jarque--Bera Test):**
   - Rejection of residual normality ($p < 0.001$) across Steps 1, 2, 3, 5, and 6. In Step 4, manufacturing output residuals fail to reject normality ($p = 0.128$).

---

## SECTION H: DIAGNOSTIC INTERPRETATION

Each system is assigned to exactly one diagnostic state under Section 7:

1. **Step 1 (Master Nominal Core): `LOCAL_EQUATION_AUTOCORRELATION`**
   - *Rationale:* At canonical $k^*=3$, the full-VAR system Breusch–Godfrey test passes cleanly ($p = 0.1074$). The headline base money equation passes ($p = 0.4667$). Residual autocorrelation is strictly localized to the inflation equation ($p = 0.0024$), and both equations become clean at $k=4$ ($p \ge 0.20$).
2. **Step 2 (Commercial Credit): `SYSTEM_AUTOCORRELATION_AT_KSTAR`**
   - *Rationale:* At canonical $k^*=1$, the full-system BG test rejects ($p < 0.0001$) and all three equations fail. However, higher lag $k=3$ eliminates all autocorrelation across the system ($p = 0.1939$) and across all individual equations ($p \in [0.105, 0.713]$) while remaining strictly stable.
3. **Step 3 (Multiplier Deconstruction): `SYSTEM_AUTOCORRELATION_AT_KSTAR`**
   - *Rationale:* Paralleling Step 2, full-system autocorrelation at $k^*=1$ ($p < 0.0001$) is eliminated at $k=3$ ($p = 0.1939$, all equations $p > 0.10$, stable).
4. **Step 4 (Real Sector Dualism): `PERSISTENT_SYSTEM_AUTOCORRELATION`**
   - *Rationale:* The 5-variable real sector VAR fails system-level serial correlation tests across all tested horizons ($k=1, 2, 3, 4$; $p < 0.005$ everywhere). Manufacturing output residuals remain autocorrelated at $k=4$ ($p = 0.0011$).
5. **Step 5 (External Cost-Push Belt): `PERSISTENT_SYSTEM_AUTOCORRELATION`**
   - *Rationale:* The 5-variable external system fails multivariate independence through $k=4$ ($p < 0.0001$). Exchange rate ($g_e$) and inflation ($\pi$) equations exhibit severe autocorrelation ($p < 0.0001$).
6. **Step 6 (Solvency Gate): `PERSISTENT_SYSTEM_AUTOCORRELATION`**
   - *Rationale:* The 5-variable solvency system rejects residual independence through $k=4$ ($p < 0.0001$), with exchange rate and inflation equations remaining heavily autocorrelated.

---

## SECTION 16: HUMAN DECISION MATRIX

| System | Diagnostic State | Does Canonical $k^*$ Need Reconsideration? | Does Headline Granger Result Risk Changing? |
| :--- | :--- | :---: | :---: |
| **Step 1: Nominal Core** | `LOCAL_EQUATION_AUTOCORRELATION` | **NO** | **NO** |
| **Step 2: Commercial Credit** | `SYSTEM_AUTOCORRELATION_AT_KSTAR` | **YES** | **NO** |
| **Step 3: Multiplier Deconstruction** | `SYSTEM_AUTOCORRELATION_AT_KSTAR` | **YES** | **POSSIBLY** (Reinforcing) |
| **Step 4: Real Sector Dualism** | `PERSISTENT_SYSTEM_AUTOCORRELATION` | **YES** | **POSSIBLY** |
| **Step 5: External Cost-Push** | `PERSISTENT_SYSTEM_AUTOCORRELATION` | **YES** | **POSSIBLY** |
| **Step 6: Solvency Gate** | `PERSISTENT_SYSTEM_AUTOCORRELATION` | **YES** | **POSSIBLY** |

---

## SECTION 17: FINAL TOKEN

Because Systems 4, 5, and 6 exhibit persistent full-system autocorrelation through $k=4$, the protocol requires:

```
PHASE9C_DIAGNOSTIC_TRIAGE_COMPLETE — VAR SPECIFICATION REVIEW REQUIRED
```
