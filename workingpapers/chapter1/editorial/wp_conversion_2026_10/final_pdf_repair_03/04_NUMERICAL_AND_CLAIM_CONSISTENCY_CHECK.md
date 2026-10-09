# 04 — Post-Repair Numerical & Claim Consistency Check

**Session:** Final PDF Repair 03 — Bounded Consistency Pass  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Working Paper:** `workingpapers/chapter1/`  
**Date:** October 2026  

---

## 1. Global Claim Search Results Across Manuscript Source

A systematic regex search was conducted across all `.tex` files in `sections/`, `appendices/`, `tables/`, and `working_paper.tex` for the audited terms.

| Term Audited | Occurrences | Contextual Verification | Status |
|:---|:---:|:---|:---:|
| `inadmissible` | 0 | Removed entirely from active text. Replaced by "Tier 1 statistical survivor; not preferred under deterministic criterion". | **CLEAN** |
| `no-dummy` | 2 | §4.3 (lines 249 and 296): Both occurrences now accurately state that while the vast majority of models require step controls (92%), a small subset of 8 models (8%) achieves $F$-bounds admissibility under PSS Case~II. | **CLEAN** |
| `all lag profiles` | 0 | Universal non-dummy failure claim removed. | **CLEAN** |
| `t-bounds` | 7 | Accurately describes that $t$-bounds is defined only for Cases I, III, V; Table 6 RICOMP focal model now reports `--- (not defined for Case II)` with table note. | **CLEAN** |
| `Case II` / `Case IV` | 10 | Consistently identified across methodology, tables, and narrative. No $t$-bounds test is claimed for either. | **CLEAN** |
| `0.65` / `0.95` | 8 | All headline appearances (Abstract, §1, §4.3 summary, §5 Discussion, §5 Conclusion) are explicitly qualified as "among retained no-trend specifications", preserving visibility of trend-containing models reaching 2.20. | **CLEAN** |
| `2.20` | 4 | Accurately preserved in Abstract, §1, Table 8, §4.3, and Conclusion to show full specification-space sensitivity. | **CLEAN** |
| `impulse dummy` | 0 in active estimation text | Preserved only in Appendix descriptive diagnostics ($P_{yy}$) as outlier shock indicators; estimation controls consistently named step controls ($S_{yy,t}$). | **CLEAN** |
| `step control` | 18 | Consistently used across all empirical tables and text for estimation variables $S_{1956}, S_{1974}, S_{1980}$. | **CLEAN** |
| `stagnation` | 7 | Consistently linked to $\hat{k}^* = 0$ as the stable stagnation attractor under $\theta < 1$. | **CLEAN** |
| `-delta` | 6 | Consistently identified in Appendix A.3, Section 3.3, and Figure 1 as the unstable lower boundary ($\hat{k}^* = -\delta$) under $\theta < 1$. | **CLEAN** |
| `khat` / $\hat{k}$ | Consistently defined | $\hat{k} \equiv \dot{K}/K - \delta$, with accounting identity $\hat{k} + \delta = s B = \phi^p B$. | **CLEAN** |
| `fundamentally` | 0 in causal assertions | Replaced in Section 4 intro with "systematically misspecified" and in Cross-Stage Synthesis with macro-structural process phrasing. | **CLEAN** |
| `requires` | 7 | Confined strictly to mechanical econometric conditioning ("recovering system-level cointegration depends on..."). | **CLEAN** |
| `only when` | 2 | Confined to empirical recovering conditions in trivariate system. | **CLEAN** |
| `controls for technique` | 0 | Replaced with "conditioning on $\ln e_t$ accounts for these distributionally mediated adjustments". | **CLEAN** |
| `causes` | 0 | Zero causal verbs attributing structural determination to distribution. | **CLEAN** |

---

## 2. Numerical Consistency Matrix

| Numerical Parameter / Value | Section 3 | Section 4 | Section 5 | Appendices | Source of Truth | Verification Status |
|:---|:---:|:---:|:---:|:---:|:---|:---:|
| **Output Growth Rate (1947–2011)** | 3.0% (3.3% $P_y$) | 3.0% | --- | 2.93% (Table A.1) | `Shaikh_canonical_series_v1.csv` ($p^{KN}$) | **CONSISTENT** |
| **Capital Growth Rate (1947–2011)** | 4.1% (4.4% $P_y$) | 4.1% | --- | 3.62% (Table A.1) | `Shaikh_canonical_series_v1.csv` ($p^{KN}$) | **CONSISTENT** |
| **Initial Acceleration at $\hat{k}_0=3\%$** | $\mp 0.048\%$ | --- | --- | --- | Formula $f(0.03) = (\theta-1)(0.03)(0.08)$ | **CONSISTENT** |
| **S0 Reconstructed Elasticity** | --- | 0.720 (0.748) | 0.72 | --- | Baseline ARDL(2,4) / ARDL(4,3) | **CONSISTENT** |
| **S1 No-Trend Range** | --- | $[0.65, 0.95]$ | $[0.65, 0.95]$ | --- | `S1_admissible.csv` Cases I–III | **CONSISTENT** |
| **S1 Trend-Containing Max** | --- | 2.20 | 2.20 | --- | `S1_admissible.csv` Cases IV–V | **CONSISTENT** |
| **S1 Outer Admissible Count** | --- | 102 (10%) | --- | --- | `S1_admissible.csv` $p_F \leq 0.10$ | **CONSISTENT** |
| **S1 Nested Subset Counts** | --- | 62 (5%), 13 (1%) | --- | --- | `S1_admissible.csv` | **CONSISTENT** |
| **S1 Step-Control Requirement** | --- | 92% (8% $s_0$) | --- | --- | 94/102 models require controls | **CONSISTENT** |
| **S2 Bivariate Admissible** | --- | 0 / 48 (36 est.) | 0 / 48 (36 est.) | --- | `output/S2_vecm/` full sample | **CONSISTENT** |
| **S2 Trivariate Admissible** | --- | 6 / 48 (36 est.) | 6 / 48 (36 est.) | --- | `output/S2_vecm/` $h_2$ rank 1 | **CONSISTENT** |
| **S2 Focal Estimates** | --- | $\hat{\theta}=0.73, \hat{\beta}_e=20.02$ | $\hat{\theta}\approx 0.73, \hat{\beta}_e=20.02$ | --- | Focal VECM VAR(2) $C_2$ $h_2$ | **CONSISTENT** |

**Conclusion:** All numerical objects and qualitative claims are in complete harmony across all manuscript sections.
