# SYSTEM 2 CONDITIONAL VAR(3) ESTIMATOR ALIGNMENT AUDIT

**Phase:** 10C — System 2 Conditional VAR(3) Estimator Alignment  
**Repository:** `c:\ReposGitHub\Chapter3_RPEUP`  
**Timestamp:** 2026-09-29T00:20:00-03:00  
**Author:** Dissertation Empirical-Methods & Integration Editor  
**Status:** **HUMAN REVIEW REQUIRED (STOPPING RULE TRIGGERED)**  

---

## 1. Context and Objective

Phase 10C investigates the inferential object alignment for **System 2 (Commercial Banking)**:
- Vector: $Y_t = [\pi_t, g_{M1,t}, g_{H,t}]'$
- Sample: Observed un-spliced $M1$ window (1966:01--1980:12, $N = 180$, effective $N_{\text{eff}} = 177$ at $k=3$)
- Model: Trivariate $\text{VAR}(3)$ with constant (`type = "const"`)

### Problem Addressed:
Previous Phase 10B reporting for System 2 at $k=3$ reflected bivariate pairwise regressions ($F = 6.170, 5.166, 8.948, 5.610$). 
While an earlier helper script (`check_sys2_k3.R`) estimated the trivariate $\text{VAR}(3)$, it applied `vars::causality(v_tri, cause = X)`, which is a system-wide test across all other equations simultaneously ($df_1 = 6$), rather than the required pair-specific conditional test ($df_1 = 3$).

### Implementation:
`check_sys2_conditional_k3.R` estimated the single-equation conditional joint $F$-tests from `v3$varresult[[effect]]`:
$$F = \frac{(\text{RSS}_R - \text{RSS}_U) / 3}{\text{RSS}_U / 167} \sim F(3, 167)$$
Both the linear restriction matrix Wald/$F$ approach and the nested OLS ANOVA approach were estimated and confirmed to match to machine precision ($\Delta F < 10^{-13}$). All third-variable lags are confirmed present in both unrestricted and restricted specifications.

---

## 2. Conditional VAR(3) Estimation Results ($k=3, N_{\text{eff}}=177$)

| Direction Tested | Cause Variable | Effect Equation | Conditioning (Third) Variable | $F$-Stat | $df_1$ | $df_2$ | $p$-value | $\beta_1$ | $\beta_2$ | $\beta_3$ | $\sum \hat{\beta}_i$ | $\text{SE}(\sum \hat{\beta})$ | $t$-stat |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $g_{M1} \longrightarrow g_H$ | $g_{M1}$ | $g_H$ | $\pi_t$ | **3.6541** | 3 | 167 | **0.0138** | 0.30373 | 0.13230 | 0.07418 | **+0.51021** | 0.18707 | 2.727 |
| $g_H \longrightarrow g_{M1}$ | $g_H$ | $g_{M1}$ | $\pi_t$ | **3.2392** | 3 | 167 | **0.0236** | 0.18996 | 0.14265 | 0.00040 | **+0.33300** | 0.13946 | 2.388 |
| $\pi_t \longrightarrow g_{M1}$ | $\pi_t$ | $g_{M1}$ | $g_H$ | **6.8418** | 3 | 167 | **0.0002** | 0.04778 | 0.12930 | 0.10659 | **+0.28367** | 0.06513 | 4.355 |
| $g_{M1} \longrightarrow \pi_t$ | $g_{M1}$ | $\pi_t$ | $g_H$ | **1.0037** | 3 | 167 | **0.3927** | 0.12183 | 0.11117 | 0.21134 | **+0.44434** | 0.27139 | 1.637 |

---

## 3. Comparison Against Current Pairwise Ledger ($k=3$)

| Relation | Pairwise $F$ | Pairwise $p$ | Pairwise $\sum \hat{\beta}$ | Conditional $F$ | Conditional $p$ | Conditional $\sum \hat{\beta}$ | Classification | Substantive Impact |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| $g_{M1} \longrightarrow g_H$ | 6.170 | 0.0005 | +0.782 | 3.654 | 0.0138 | +0.510 | **UNCHANGED_INFERENCE** | Both reject $H_0$ at 5% level; positive predictive sum. |
| $g_H \longrightarrow g_{M1}$ | 5.166 | 0.0019 | +0.468 | 3.239 | 0.0236 | +0.333 | **UNCHANGED_INFERENCE** | Both reject $H_0$ at 5% level; positive predictive sum. |
| $\pi_t \longrightarrow g_{M1}$ | 8.948 | $1.55 \times 10^{-5}$ | +0.323 | 6.842 | 0.0002 | +0.284 | **UNCHANGED_INFERENCE** | Both reject $H_0$ at 0.1% level; positive predictive sum. |
| $g_{M1} \longrightarrow \pi_t$ | 5.610 | 0.0011 | +0.671 | 1.004 | 0.3927 | +0.444 | **SIGNIFICANCE_CHANGED** | Pairwise rejects $H_0$ ($p=0.001$); Conditional FAILS to reject ($p=0.393$). |

---

## 4. Evaluation and Stopping Rule Execution

### Substantive Finding:
1. In the **money-money feedback loop** ($g_{M1} \leftrightarrow g_H$), both directional links remain statistically significant at the 5% level ($p = 0.0138$ and $p = 0.0236$). Conditioning on inflation does not break bidirectional accommodation between commercial narrow money and central bank base money.
2. In the **inflation-money nexus** ($\pi_t \leftrightarrow g_{M1}$), inflation strongly predicts commercial narrow money ($F = 6.842, p = 0.0002$), but narrow money **does not Granger-cause inflation** once high-powered base money is in the conditioning set ($F = 1.004, p = 0.3927$).
3. This constitutes a **SIGNIFICANCE_CHANGED** event: the pairwise finding of bidirectional feedback between narrow money and inflation becomes **unidirectional** predictive causality ($\pi_t \to g_{M1}$) in the conditional trivariate model.

### Stopping Rule Protocol:
The Phase 10C directive states:
> *"If all four substantive conclusions survive: update only the four System 2 rows in: FINAL_CORE_RESULT_PROVENANCE.csv, tab02_core_granger_evidence.tex, and corresponding §5.3 System 2 prose where numerical values appear.*  
> *If any conclusion changes: STOP after producing the comparison and report: PHASE10C_REQUIRES_HUMAN_REVIEW.*  
> *Do not modify System 1, System 3, System 6, §5.4, bibliography, or empirical architecture.*  
> *No commit. No push."*

Because the fourth hypothesis ($g_{M1} \to \pi_t$) shifts from significant ($p = 0.0011$) to non-significant ($p = 0.3927$), **no manuscript files or provenance tables have been modified**.

The comparison is documented here and in `SYSTEM2_CONDITIONAL_VAR3.csv`. Execution halts immediately for human review.

```
PHASE10C_REQUIRES_HUMAN_REVIEW
```
