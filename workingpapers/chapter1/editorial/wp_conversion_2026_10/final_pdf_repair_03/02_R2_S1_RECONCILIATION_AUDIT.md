# 02 — R2 S1 Econometric Reconciliation Audit: Case II, t-Bounds, and No-Dummy Counterfactual

**Severity:** Blocker  
**Status:** RESOLVED  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Empirical Source of Truth:** `C:\ReposGitHub\Critical-Replication-Shaikh` (`output/S1_geometry/csv/S1_admissible.csv`)  
**Date:** October 2026  

---

## 1. Problem Statement & Reader-Level Contradictions

The rendered PDF contained three mutually inconsistent assertions regarding the Stage S1 ARDL specification space:
1. **$t$-Bounds Feasibility:** Section 4.1 stated that while the $F$-bounds test applies to all five deterministic cases, the $t$-bounds test is defined only for PSS Cases I, III, and V; specifications under Case II or IV cannot be screened using the $t$-bounds gate.
2. **Table 6 Contradiction:** Table 6 reported for the RICOMP focal specification (ARDL(1,2), PSS Case II, no dummies / $s_0$) a $t$-bounds statistic of `-3.125 (Case 2) [Reject **]`.
3. **No-Dummy Universal Rejection Claim:** Section 4.3 asserted that in a no-dummy counterfactual omitting historical step controls, residuals remain nonstationary across all lag profiles in the tested grid, failing bounds tests. Yet Table 6 reported the RICOMP winner as an $s_0$ (no-dummy) model passing $F$-bounds ($F=3.269, p=0.074$).

---

## 2. Source-of-Truth Empirical Audit

Inspecting `codes/21_S1_ardl_geometry.R` and `output/S1_geometry/csv/S1_admissible.csv` in `C:\ReposGitHub\Critical-Replication-Shaikh`:

1. **$t$-Bounds Feasibility Logic in Code:**
   Lines 61–62 of `21_S1_ardl_geometry.R`:
   ```r
   # t-bounds feasibility: only cases 1, 3, 5
   T_BOUNDS_CASES <- c(1L, 3L, 5L)
   ```
   Lines 269–277 confirm that for Case 2 and Case 4, `boundsT_stat` and `boundsT_p` are explicitly assigned `NA_real_`. In Pesaran, Shin, and Smith (2001), the error-correction $t$-statistic on the lagged level dependent variable follows the tabulated degenerate distribution only when deterministic components are unrestricted (Cases I, III, V). Under Case II (restricted constant), only the Wald $F$-test is tabulated.
2. **Provenance of `-3.125` in Table 6:**
   In Table 5 (`tab:s0_bounds_alpha10`), the S0 ARDL(4,3) Case 1 baseline has $t = -3.125$ ($p = 0.015$). This statistic was inadvertently copy-pasted into Table 6 for the RICOMP focal model. In `S1_admissible.csv`, row 0 (the RICOMP winner) has `boundsT_stat = NaN` and `boundsT_p = NaN`.
3. **Survival of No-Dummy ($s_0$) Specifications:**
   In `S1_admissible.csv` ($N = 102$ $F$-admissible models at $\alpha = 0.10$):
   - $s_1$ (1974 dummy): 38 models (37.3%)
   - $s_3$ (1956, 1974, 1980 dummies): 29 models (28.4%)
   - $s_2$ (1974, 1980 dummies): 27 models (26.5%)
   - $s_0$ (no dummies): **8 models (7.8%)**
   Specifically, the 8 surviving no-dummy models are:
   - Case 2 ($p \in \{1,2,3,4,5\}, q=2$): 5 models (including the RICOMP winner ARDL(1,2))
   - Case 3 ($p \in \{4,5\}, q=2$): 2 models
   - Case 4 ($p=5, q=2$): 1 model
   Therefore, 94 out of 102 (92.2%) of cointegrating specifications require historical step controls, while a small subset of 8 models (7.8%) achieves $F$-bounds admissibility without dummies under specific restricted lag/deterministic structures.

---

## 3. Reconciliation Matrix

| Claim | Current PDF | Source-of-Truth Result | Required Correction | Final Wording |
|:---|:---|:---|:---|:---|
| **Table 6 RICOMP $t$-bounds** | `-3.125 (Case 2) [Reject **]` | `boundsT_stat = NaN` (`T_BOUNDS_CASES = c(1,3,5)`) | Replace with N/A / not defined for Case II | `--- (not defined for Case II)` |
| **No-dummy counterfactual in §4.3** | "...residuals remain nonstationary ($I(1)$) across all lag profiles in the tested grid, failing the cointegration bounds tests." | 8 models (7.8% of admissible pool) pass $F$-bounds without dummies (mostly in Case 2) | Qualify universal failure claim; state that most specifications require controls, but a small subset survives under Case II | "Most surviving specifications require historical step controls, although a small subset of no-dummy models remains $F$-admissible under particular deterministic configurations (predominantly PSS Case~II)." |
| **S1 dummy dependence in §4.3** | "The bivariate output--capital relation does not cointegrate without these controls..." | 92.2% require controls; 7.8% survive without | Align with 92% requirement and 8% exception | "Cointegration survival depends heavily on deterministic terms and historical controls: 92\% of the cointegrating specifications require at least one historical step control... while a small subset (8\%) of no-dummy models remains $F$-admissible under particular deterministic configurations." |

**Conclusion:** R2 is fully resolved and verified.
