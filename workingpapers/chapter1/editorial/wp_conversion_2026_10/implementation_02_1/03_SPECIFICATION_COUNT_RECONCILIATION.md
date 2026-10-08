# 03 — Specification Count Reconciliation

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Audit Mandate

Auditing identified two specification count discords in the manuscript:
1. In Stage S1, the Introduction reported "135 bounds-passing models" while Table 7 reported 102 (at 10%) and 62 (at 5%); Appendix B.8 previously mentioned $p,q = 1\text{--}6$.
2. In Stage S2, tables and prose alternated between "36" and "48" models without distinguishing between attempted and estimated specifications.

This document reconciles all counts against the primary execution manifests and logs in `Critical-Replication-Shaikh`.

---

## 2. Stage S1 ARDL Specification Lattice

### Audited Execution Grid
From `Critical-Replication-Shaikh/METHODS_BRIEF.md` (§Stage 1) and `codes/21_S1_ardl_geometry.R`:
- Autoregressive lags: $p \in \{1, 2, 3, 4, 5\}$ (5 values)
- Distributed lags: $q \in \{1, 2, 3, 4, 5\}$ (5 values)
- Deterministic PSS cases: Cases I through V (5 cases)
- Historical shock subsets: $s_0 = \emptyset, s_1 = \{d_{74}\}, s_2 = \{d_{56}, d_{74}\}, s_3 = \{d_{56}, d_{74}, d_{80}\}$ (4 subsets)
- **Total Specifications Attempted and Estimated:**
  $$\text{Total}_{S1} = 5 \times 5 \times 5 \times 4 = 500 \text{ specifications}$$

All 500 models were successfully estimated via the `ARDL` package in R. The mention of $p,q \in \{1,\dots,6\}$ in Appendix B.8 was a legacy drafting slip ($6 \times 6 \times 5 \times 4 = 720$) that was never estimated and is corrected globally to $p,q \in \{1,\dots,5\}$.

### Admissibility Layer Counts (Manuscript Table 7)
From `tab_S1_shrinking_space_counts.tex`:
- **$F$-bounds Admissible:**
  - At 10% significance: **102 specifications** (20.4% of grid)
  - At 5% significance: **62 specifications** (12.4% of grid)
  - At 1% significance: **13 specifications** (2.6% of grid)
- **$F$-bounds + $t$-bounds Confirmed:**
  - At 10% significance: **49 specifications** (9.8% of grid)
  - At 5% significance: **28 specifications** (5.6% of grid)
  - At 1% significance: **3 specifications** (0.6% of grid)

**Resolution of "135":** In `RESULTS_BRIEF.md`, an earlier run reported 135 models passing an asymptotic-only bounds filter. However, Table 7 of the manuscript records the audited finite-sample simulated bounds counts (102 at 10%, 62 at 5%). The Introduction is updated to state:
> *"While 102 specifications satisfy the baseline $F$-bounds test at the 10\% level (and 62 at the 5\% level)..."*

---

## 3. Stage S2 Johansen VECM Specification Grid

### Audited Execution Grid
From `codes/22_S2_vecm_bivariate.R`, `codes/23_S2_vecm_trivariate.R`, and execution logs:
- VAR lag order: $p \in \{1, 2, 3, 4\}$ (4 values)
- Deterministic branches: $d \in \{d0, d1, d2, d3\}$ (4 branches)
- Historical shock sets: $h \in \{h0, h1, h2\}$ (3 sets)
- **Total Specifications Attempted Per Block:**
  $$\text{Attempted}_{\text{block}} = 4 \times 4 \times 3 = 48 \text{ specifications}$$
- Across the three evaluated system-rank blocks:
  $$\text{Total Attempted}_{S2} = 48 \times 3 = 144 \text{ specifications}$$

### Attempted vs. Successfully Estimated
Inspection of execution logs (`S2_vecm_bivariate_log.txt` and `S2_vecm_trivariate_log.txt`) reveals:
- All 12 specifications under branch $d1$ (Case 1 / restricted LR constant) failed to converge in `tsDyn` for every system-rank block.
- For each block:
  - Attempted: **48 specifications**
  - Estimation/convergence failures ($d1$ branch): **12 specifications**
  - Successfully Estimated: **36 specifications**
- Total successfully estimated across all S2: $36 \times 3 = 108$ specifications.

### Mechanical Admissibility Outcomes
Across the three blocks:
1. **Bivariate $(\ln Y, \ln K)$, $r=1$:**
   - Attempted: 48 | Estimated: 36 | **Admissible: 0**
2. **Trivariate $(\ln Y, \ln K, \ln e)$, $r=1$:**
   - Attempted: 48 | Estimated: 36 | **Admissible: 6**
3. **Trivariate $(\ln Y, \ln K, \ln e)$, $r=2$:**
   - Attempted: 48 | Estimated: 36 | **Admissible: 0**

---

## 4. Reconciled Tabular Structure for Manuscript

### Table 9: S2 System Admissibility Outcomes

```latex
\begin{tabular}{llrrrcc}
\toprule
System & Rank & Attempted & Estimated & Admissible & Admissibility Rate & Mechanical Verdict \\
\midrule
Bivariate $(\ln Y,\ln K)$ & $r=1$ & 48 & 36 & 0 & 0.0\,\% & Zero cointegration survival \\
Trivariate $(\ln Y,\ln K,\ln e)$ & $r=1$ & 48 & 36 & 6 & 16.7\,\% & Restricted survival \\
Trivariate $(\ln Y,\ln K,\ln e)$ & $r=2$ & 48 & 36 & 0 & 0.0\,\% & Zero dual-vector survival \\
\bottomrule
\end{tabular}
```
*Note:* In each block, 48 specifications are attempted ($4\text{ lags} \times 4\text{ deterministic branches} \times 3\text{ shock sets}$). The 12 specifications under branch $C_1$ (restricted constant) fail numerical convergence in `tsDyn`, yielding 36 successfully estimated models per block (108 total across Stage S2).

---

## 5. Audit Verdict

**E-06 STATUS: FULLY RECONCILED AND AUDITED**
