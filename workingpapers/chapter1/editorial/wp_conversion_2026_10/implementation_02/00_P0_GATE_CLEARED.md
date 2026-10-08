# 00 — P0 Empirical Reconciliation Gate Cleared

## Phase 0 Readiness Gate Status: PASSED (INTEGRATION PASS 02 AUTHORIZED)
- **Session:** EDITORIAL INTEGRATION PASS 02
- **Manuscript:** *Replicating Shaikh’s Capacity Utilization Measure: Specification Sensitivity and Distribution*
- **Author:** Diego Polanco
- **Gate Evaluation Date:** October 7, 2026
- **Result:** **PROCEED TO MANUSCRIPT ALIGNMENT**

---

## Audit Summary

In strict accordance with the mandatory instructions of Editorial Integration Pass 02, an exhaustive read-only empirical reconnaissance pass was performed across the primary replication engine in `c:\ReposGitHub\Critical-Replication-Shaikh`.

The full reconciliation findings are recorded in:
`workingpapers/chapter1/editorial/wp_conversion_2026_10/08_EMPIRICAL_RECONCILIATION_REPORT.md`

### Summary of Resolutions:

1. **E-01 (Capital stock integration order):** RESOLVED.
   `table_A2_unit_root_tests_expanded.tex` shows $\Delta^2 k_t$ strongly rejects the unit root ($t = -4.3045, p < 0.001$), ruling out $I(2)$ contamination. Failure to reject stationarity for $\Delta k_t$ at 5% is a small-sample ($T=65$) power issue due to near-unit-root persistence of capital accumulation.

2. **E-02 (Focal VECM residual gate):** RESOLVED.
   Focal VECM $(p=2, d2, h2, r=1)$ passes Portmanteau(12) ($p = 0.275$), JB normality ($p = 0.456$), ARCH-LM(4) ($p = 0.348$), and companion stability ($\max |\lambda| = 0.821$). The Breusch-Godfrey LM(4) test rejects at lag 4 ($p = 0.006$). The phrase "free from residual pathology" will be removed and replaced with transparent reporting of the diagnostic suite and finite-sample autocorrelation caveat.

3. **E-03 (Weak exogeneity loading on capital):** RESOLVED.
   In the focal VECM, $\hat{\alpha}_k = 0.0003$ ($t = 0.92, p = 0.360$). Prose claims will be calibrated to "the estimated adjustment loading is statistically indistinguishable from zero ($\alpha_k = 0.000, t = 0.92$)" without asserting formal weak exogeneity or rejecting Neo-Kaleckian closure.

4. **E-04 ($\theta$ estimation uncertainty):** RESOLVED.
   $\hat{\theta} = 0.727$ has $\text{SE} = 4.852$ ($t = -0.15$), while $\hat{\beta}_e = 20.022$ ($t = 7.90$) accounts for 99.1% of the long-run cointegrating variance. Prose will emphasize this asymmetry rather than asserting tight point estimation of $\theta$.

5. **E-05 (Historical break dummies coding):** RESOLVED.
   Code inspection of `27_S2_vecm_focal_p2d2h2.R` (line 110) confirms all estimation models in S0, S1, and S2 used permanent step-shift indicators ($1\{t \ge \text{year}\}$). Main text prose describing permanent regime shifts is econometrically accurate.

6. **E-06 (Specification grid design counts):** RESOLVED.
   Audited execution universe: S1 has 500 models ($5 \times 5 \times 5 \times 4$). S2 has 48 attempted per system-rank block (144 total attempted; 0 admissible bivariate, 6 admissible trivariate $r=1$, 0 admissible trivariate $r=2$). Table 9 count updated from 36 to 48.

7. **E-07 (Disposition ledger for the 6 trivariate models):** RESOLVED.
   Established a two-tier taxonomy: Tier 1 (Statistical Rank Survivors, 6 models) vs Tier 2 (Economically Admissible Survivors, 2 models in $d2$ branch including focal $p=2, d2, h2$). Explains why $d3$ produces extreme $\theta$ due to saturated trend overparameterization and why $d0$ absorbs drift into $\theta > 1$.

---

## Phase 0 Clearance

With all P0 blockers resolved and documented in an auditable governance artifact:
- Gate Status: **PASS**
- Next Action: **Execute Editorial Integration Pass 02**
