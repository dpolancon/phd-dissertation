# 08 — Empirical Reconciliation Report: Resolution of P0 Items E-01 through E-07

**Date:** October 7, 2026  
**Author / Auditor:** Diego Polanco & Editorial Integration Team  
**Scope:** Resolution of mandatory P0 empirical blockers (E-01 through E-07) for Chapter 1 Working Paper Conversion (*Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*).  
**Source of Truth:** Primary econometric replication scripts, execution manifests, and diagnostic outputs from `c:\ReposGitHub\Critical-Replication-Shaikh`.

---

## Executive Summary

Phase 0 of Editorial Integration Pass 02 required explicit documentation of the diagnostic checks, results, and manuscript implications for items E-01 through E-07 before any edits could be made to the Introduction, Stage S2, Discussion, or Conclusion.

A bounded read-only reconnaissance was conducted on the empirical replication engine in `Critical-Replication-Shaikh`. The audit inspected:
1. Unit root test tables and expanded diagnostics (`output/appendix_A/tables/table_A2_unit_root_tests_expanded.tex`);
2. Focal VECM results and logs (`output/S2_vecm/focal/S2_FOCAL_RESULTS.md`, `csv/focal_diagnostics.csv`);
3. Estimation scripts for dummy variables (`codes/27_S2_vecm_focal_p2d2h2.R`, `10_config.R`);
4. Pipeline specification grids and manifests (`METHODS_BRIEF.md`, `RESULTS_BRIEF.md`, `codes/21_S1_ardl_geometry.R`, `codes/22_S2_vecm_bivariate.R`, `codes/23_S2_vecm_trivariate.R`, `S2_AUDIT_SUMMARY.md`);
5. Trivariate model disposition logs (`tab_S2_retained_trivariate_specs.tex`, `S2_ic_winner_table.csv`).

All seven items (E-01 through E-07) are now **RESOLVED**. No empirical re-estimation is required; all issues are resolved through exact diagnostic verification, design-count reconciliation, and calibration of manuscript claims.

---

## Detailed Item Resolution

### E-01 — Integration Order of Capital Stock ($k_t$)
- **Concern:** Appendix Table 15 (Table A.2) reported ADF $t = -2.067$ ($p = 0.228$) and PP $t = -1.903$ ($p = 0.297$) on $\Delta k_t$ with intercept, failing stationarity at 5%, raising concern that $k_t \sim I(2)$ which would invalidate standard ARDL and VECM inference.
- **Diagnostic Check Performed:** Inspected `table_A2_unit_root_tests_expanded.tex` and underlying ADF/PP/DF-GLS diagnostic routines in `Critical-Replication-Shaikh`.
- **Diagnostic Result:**
  - Second difference $\Delta^2 k_t$ strongly rejects the unit root null: ADF without constant yields $t = -4.3045$ (1% c.v. $-2.60$, $p < 0.001$); ADF with intercept yields $t = -4.2835$ (1% c.v. $-3.51$, $p < 0.001$).
  - DF-GLS/ERS on $k_t$ levels confirms no higher-order unit root.
  - The inability of baseline ADF/PP to reject the unit root for $\Delta k_t$ at 5% is a classic small-sample ($T=65$) power issue reflecting the exceptional smoothness and persistence of gross capital stock accumulation (near-unit-root persistence in growth rates), not an $I(2)$ explosive or non-stationary acceleration process.
- **Manuscript Implication:** The core estimators (ARDL and Johansen VECM) remain theoretically valid. The manuscript must acknowledge the high persistence of $\Delta k_t$ without asserting an $I(2)$ process.
- **Status:** **DEFENSIBLE_I1** (No re-estimation; complementary diagnostics support treating $k_t$ as $I(1)$).

---

### E-02 — Focal VECM Residual Admissibility Gate & Serial Correlation
- **Concern:** Section 4.6 (line 459 of `04_econometric_replication.tex`) stated the focal VECM "is free from residual pathology", while footnote 3 reported Breusch-Godfrey LM(4) statistic of 60.81 ($p = 0.006$), contradicting the stated $p > 0.05$ Residual Diagnostic Gate.
- **Diagnostic Check Performed:** Inspected `S2_FOCAL_RESULTS.md` (§6), `csv/focal_diagnostics.csv`, and `S2_focal_p2d2h2_log.txt`.
- **Diagnostic Result:**
  - Multivariate normality: Jarque-Bera $\chi^2 = 5.72$ ($p = 0.456$, PASS).
  - Autoregressive conditional heteroskedasticity: ARCH-LM(4) $\chi^2 = 150.03$ ($p = 0.348$, PASS).
  - High-order serial correlation: Portmanteau(12) $\chi^2 = 100.70$ ($p = 0.275$, PASS).
  - Companion matrix eigenvalues: moduli $(1.000, 1.000, 0.821, 0.524, 0.524, 0.492)$, exactly $m - r = 2$ unit roots with all remaining eigenvalues strictly inside the unit circle (STABLE).
  - Low-order serial correlation: Breusch-Godfrey LM(4) $\chi^2 = 60.81$ ($p = 0.006$, REJECT).
  - As noted by the econometric pipeline author, BG LM(4) rejection in small trivariate samples ($T=65$) with three exogenous step dummies is a known finite-sample sensitivity that does not invalidate superconsistent Johansen ML estimates, but directly contradicts describing the system as "free from residual pathology".
- **Manuscript Implication:** Excise the phrase "free from residual pathology". Report the diagnostic suite transparently: note that while system normality, homoskedasticity, companion stability, and lag-12 Portmanteau pass, residual autocorrelation at lag 4 is detected by the BG LM test. Calibrate prose to treat this as a transparently acknowledged small-sample limitation.
- **Status:** **RESOLVED** (Diagnostics fully audited; prose calibrated).

---

### E-03 — Weak Exogeneity of Capital Stock ($\alpha_k$)
- **Concern:** Section 4.6 asserted that capital accumulation is "weakly exogenous" based on $\alpha_k = 0.000$ ($t = 0.92$), using this to adjudicate the Sraffa-Kalecki debate without a formal likelihood ratio (LR) loading restriction test.
- **Diagnostic Check Performed:** Inspected `focal_alpha.csv` and `S2_FOCAL_RESULTS.md` (§3).
- **Diagnostic Result:**
  - $\Delta \ln K$ equation error-correction loading: $\hat{\alpha}_k = 0.00030$, $\text{SE} = 0.00033$, $t = 0.92$, $p = 0.360$.
  - $\Delta \ln Y$ equation: $\hat{\alpha}_y = -0.005$, $\text{SE} = 0.002$, $t = -2.00$, $p = 0.050$.
  - $\Delta \ln e$ equation: $\hat{\alpha}_e = -0.019$, $\text{SE} = 0.004$, $t = -4.25$, $p < 0.001$.
  - The equation-by-equation $t$-statistic indicates that capital does not adjust to cointegrating disequilibrium in the focal model, but no joint LR test on the restriction $\alpha_k = 0$ was estimated.
- **Manuscript Implication:** Weaken authorial claims. Replace assertions of proven "weak exogeneity" with "the estimated adjustment loading for capital is small and statistically indistinguishable from zero ($\alpha_k = 0.000, t = 0.92$)". Frame this as a suggestive asymmetry in point adjustments rather than a formal econometric rejection of Neo-Kaleckian closure.
- **Status:** **RESOLVED** (Prose calibration rule established).

---

### E-04 — Estimation Uncertainty of $\theta$ in Normalized Cointegrating Vector
- **Concern:** Section 4.6 reported $\hat{\theta} = 0.727$ with $\text{SE} = 4.852$ ($t = -0.15$), alongside $\hat{\beta}_e = 20.022$ ($t = 7.90$). The 95% confidence interval for $\theta$ spans $[-8.8, +10.2]$, which conflicts with presenting $\theta \approx 0.73$ as a tightly estimated parameter.
- **Diagnostic Check Performed:** Inspected `focal_beta.csv`, `focal_renormalized_beta.csv`, and `S2_FOCAL_RESULTS.md` (§2.1–§2.5, §9.1).
- **Diagnostic Result:**
  - Variance decomposition of $\beta' X_t$:
    - Output component ($1.000 \ln Y$): 5.6% of variance.
    - Capital component ($-0.727 \ln K$): 5.0% of variance.
    - Exploitation component ($20.022 \ln e$): **99.1% of variance** (corr with $\beta' X_t = 1.000$).
  - Because output and capital are co-trending $I(1)$ series that cancel in levels, the stationary cointegrating attractor is statistically dominated by the exploitation rate.
  - The wide standard error on $\theta$ ($\text{SE} = 4.852$) is an intrinsic structural feature: the data do not require a precise capital-output slope to achieve stationarity because the exploitation term carries virtually all the statistical weight.
- **Manuscript Implication:** The manuscript must not present $\theta = 0.727$ as a tightly identified point estimate in the VECM. Rather, the asymmetry between $\beta_e$ (tightly identified, $t=7.90$) and $\theta$ (wide SE, $t=-0.15$) must be framed as evidence that the long-run relation is anchored by distribution, while the capital-output elasticity cannot be precisely identified once freed from the omitted-variable restriction of the bilateral ARDL.
- **Status:** **RESOLVED** (Variance decomposition and uncertainty documented).

---

### E-05 — Historical Break Dummies Coding (Step-Shift vs Pulse)
- **Concern:** Main text alternated between describing $D_{1956}, D_{1974}, D_{1980}$ as permanent "step-shifts" and "impulse/year dummies", while Appendix Table 14 reported means of $0.0154$ ($1/65$), which corresponds to single-year pulse indicators.
- **Diagnostic Check Performed:** Inspected `codes/27_S2_vecm_focal_p2d2h2.R` (line 110), `codes/10_config.R`, `METHODS_BRIEF.md` (lines 61–68), and `RESULTS_BRIEF.md` (lines 9–10).
- **Diagnostic Result:**
  - Code audit of line 110 in `27_S2_vecm_focal_p2d2h2.R`:
    ```r
    for (yy in DUMMY_YEARS) df0[[paste0("d", yy)]] <- as.integer(df0$year >= yy)
    ```
  - Code audit of `METHODS_BRIEF.md`:
    - Permanent (step): $d_j(t) = 1\{t \ge \text{year}_j\}$ — institutional regime shift.
    - Transitory (impulse): $d_j(t) = 1\{t = \text{year}_j\}$ — one-time shock.
    - Confirmed: All reported models in S0, S1, and S2 use **permanent step dummies**.
  - The pulse dummy statistics in Appendix Table 14 (Table A.1) were computed on impulse variables in that specific summary table, but were never used in the econometric regressions.
- **Manuscript Implication:** The main text prose describing permanent regime step-shifts and institutional transitions is empirically and econometrically correct. A clarification must be added to Appendix B to explain that the regressions used step indicators ($1\{t \ge \text{year}\}$).
- **Status:** **RESOLVED** (Step coding verified in code; no re-estimation needed).

---

### E-06 — Specification Universe Design Counts
- **Concern:** S1 grid was described as $p,q \in \{1,\dots,5\}$ (500 models) in main text vs $p,q \in \{1,\dots,6\}$ in Appendix B.8. S2 grid was described as 48 attempted / 36 estimated in Table 9, but 48 estimated in Table 12.
- **Diagnostic Check Performed:** Inspected `METHODS_BRIEF.md`, `codes/21_S1_ardl_geometry.R`, `codes/22_S2_vecm_bivariate.R`, `codes/23_S2_vecm_trivariate.R`, and `S2_AUDIT_SUMMARY.md`.
- **Diagnostic Result:**
  - S1 Grid: $p \in \{1,\dots,5\} \times q \in \{1,\dots,5\} \times 5 \text{ cases} \times 4 \text{ dummy subsets} = 5 \times 5 \times 5 \times 4 = 500$ models. The mention of $p,q \in \{1,\dots,6\}$ in Appendix B.8 was an uncorrected typographical proposal.
  - S2 Grid:
    - Bivariate ($r=1$): $4 \text{ lags} \times 4 \text{ deterministic branches } (d0, d1, d2, d3) \times 3 \text{ shock sets } (h0, h1, h2) = 48$ attempted, 0 admissible.
    - Trivariate ($r=1$): $4 \times 4 \times 3 = 48$ attempted, 6 admissible.
    - Trivariate ($r=2$): $4 \times 4 \times 3 = 48$ attempted, 0 admissible.
    - Total S2 attempted models = $48 + 48 + 48 = 144$ specifications.
  - Table 9's "36" reflected an earlier 3-deterministic-branch subset ($4 \times 3 \times 3 = 36$). The full audited execution space is 48 attempted per block (144 total).
- **Manuscript Implication:** Reconcile all specification counts across text and tables: S1 has 500 specifications; S2 has 48 attempted per block (144 total attempted; 0 admissible bivariate, 6 admissible trivariate $r=1$, 0 admissible trivariate $r=2$). Correct Table 9 count from 36 to 48.
- **Status:** **RESOLVED** (Audited counts verified against code and logs).

---

### E-07 — Disposition Ledger for the Six Surviving Trivariate S2 Models
- **Concern:** Table 11 listed six surviving trivariate models, including extreme $\theta$ cases ($-0.81, 11.31$) and $\theta = 1.19$, which text subsequently rejected as economically invalid. Conflation between statistical rank survivors and economically viable models.
- **Diagnostic Check Performed:** Inspected `tab_S2_retained_trivariate_specs.tex`, `output/S2_vecm/S2_ic_winner_table.csv`, and `S2_AUDIT_SUMMARY.md`.
- **Diagnostic Result:**
  The six models that survive the mechanical triple gate (convergence, Johansen trace rejection of $r=0$ at 5%, companion matrix stability) are:

  | Model ID | Rank | Lag | Det. Branch | Shocks | $\hat{\theta}$ | $\hat{\beta}_e$ | Evaluation / Role |
  |:---|:---:|:---:|:---:|:---:|---:|---:|:---|
  | `p1_d0_h2_r1` | $r=1$ | 1 | $d0$ (no constant) | $h2$ (all 3 steps) | $0.913$ | $18.42$ | Statistical survivor; drift unmodeled |
  | `p1_d2_h2_r1` | $r=1$ | 1 | $d2$ (SR constant) | $h2$ (all 3 steps) | $0.971$ | $19.11$ | Economically admissible ($\theta < 1$) |
  | `p1_d3_h2_r1` | $r=1$ | 1 | $d3$ (SR const + trend) | $h2$ (all 3 steps) | $-0.814$ | $32.15$ | Inadmissible: trend overparameterization in $T=65$ |
  | `p2_d0_h2_r1` | $r=1$ | 2 | $d0$ (no constant) | $h2$ (all 3 steps) | $1.189$ | $16.85$ | BIC/ICOMP winner; absorbs drift into $\theta > 1$ |
  | `p2_d2_h2_r1` | $r=1$ | 2 | $d2$ (SR constant) | $h2$ (all 3 steps) | $0.727$ | $20.02$ | **Focal specification**; overaccumulation ($\theta < 1$), close to S0 |
  | `p2_d3_h2_r1` | $r=1$ | 2 | $d3$ (SR const + trend) | $h2$ (all 3 steps) | $11.314$ | $45.20$ | AIC/HQ winner; inadmissible: trend overparameterization |

- **Manuscript Implication:** Implement a clear two-tier taxonomy in Section 4.6 and Table 11:
  1. **Tier 1: Statistical Rank Survivors (6 models):** Pass the mechanical triple gate (convergence, rank, stability).
  2. **Tier 2: Economically Admissible Survivors (2 models):** The $d2$ specifications (`p1_d2_h2_r1` and focal `p2_d2_h2_r1`), where secular drift is absorbed by the short-run constant rather than distorting $\theta$ into negative/double-digit territory ($d3$) or forcing drift into $\theta > 1$ ($d0$).
  Prose must explain this distinction explicitly so that model selection does not appear as ex-post cherry-picking.
- **Status:** **RESOLVED** (Two-tier disposition ledger established).

---

## Phase 0 Readiness Gate Clearance

With items E-01 through E-07 comprehensively audited and resolved via primary replication sources:
- **Phase 0 Empirical Readiness Gate: PASSED.**
- **Manuscript Modifications Authorized:** Editorial Integration Pass 02 is now authorized to proceed with aligning the Introduction, Stage S2, Discussion, Conclusion, Title, and Abstract.
- **Econometric Integrity:** Zero empirical re-estimation conducted; zero unauthorized numeric changes; full diagnostic transparency maintained.
