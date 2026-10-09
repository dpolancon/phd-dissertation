# 00 — Repair Scope and Pre-Edit Verification Matrix

**Session:** Final PDF Repair 03 — Bounded Consistency Pass  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Working Paper:** `workingpapers/chapter1/`  
**Frozen Baseline Commit:** `d786eda` (*Finalize Chapter 1 working paper baseline*)  
**Empirical Source of Truth:** `C:\ReposGitHub\Critical-Replication-Shaikh` (read-only)  
**Date:** October 2026  

---

## 1. Executive Summary of Reader-Level Verification

All eight reader-level findings (R1–R8) have been audited against the LaTeX manuscript source, rendered PDF pages, underlying theoretical algebra, and read-only empirical outputs from `Critical-Replication-Shaikh`. Both substantive blockers (R1 and R2) and all six mandatory consistency issues (R3–R8) are confirmed and authorized for bounded repair.

---

## 2. Pre-Edit Verification Matrix

| ID | Issue Description | PDF Location | Verified? | Source of Truth | Repair Authorized? | Verification Findings & Notes |
|:---|:---|:---|:---:|:---|:---:|:---|
| **R1** | Theoretical dynamics equilibrium contradiction | pp. 9–10 (§3.3, Fig. 1), p. 45 (App. A) | **YES** | Manuscript Eq. (26) & Jacobian algebra | **YES (BLOCKER)** | In Eq. (26), $d\hat{k}/dt = (\theta-1)\hat{k}(\hat{k}+\delta)$. For $\theta < 1$, $f'(0) = (\theta-1)\delta < 0$ (stable sink $\hat{k}^*=0$, stagnation) and $f'(-\delta) = (1-\theta)\delta > 0$ (unstable repeller $\hat{k}^*=-\delta$). The old `generate_fig_S3.py` mistakenly plotted $(\hat{k}+\delta)^2$, creating a spurious convergence to $-\delta$. Fig. 1 and §3.3 text must be reconciled to the correct $\hat{k}^*=0$ attractor. |
| **R2** | S1 Case-II / $t$-bounds / no-dummy contradiction | p. 20 (§4.1), p. 21 (§4.3), p. 24 (Tab. 6) | **YES** | `output/S1_geometry/csv/S1_admissible.csv`, PSS (2001) | **YES (BLOCKER)** | PSS (2001) defines $t$-bounds only for Cases I, III, V. In `S1_admissible.csv`, RICOMP winner is ARDL(1,2), Case 2, $s_0$ (no dummies), where `boundsT_stat = NaN`. Table 6 erroneously reported a copy-pasted $-3.125$ [Reject $^{**}$]. Furthermore, 8 no-dummy ($s_0$) models pass $F$-bounds, refuting the claim that no-dummy models fail across all lag profiles. |
| **R3** | Appendix Table 16 legacy language | pp. 48–49 (App. B.8, Tab. A.3) | **YES** | `appendixA/tables/table_A3_ardl_specification_search.tex` | **YES** | Table A.3 contains an illustrative 25-model diagnostic subset (5 lag pairs $\times$ Cases I–V), not the full 500-model grid. Note mentions obsolete $p,q=1\text{--}6$ and "impulse dummies". Must be aligned to active grid notation ($p,q \in \{1,\dots,5\}$, step controls $S_{yy,t}$). |
| **R4** | S1 admissibility threshold 5% vs. 10% | pp. 20–21 (§4.3, Eq. 18, Tab. 7) | **YES** | Manuscript text vs. Eq. (18) & `codes/21_S1_ardl_geometry.R` | **YES** | Line 231 stated admissibility requires $F$-bounds rejection at 5%, but Eq. (18) and Table 7 define outer admissibility at 10% ($p_F \leq 0.10$, 102 models), with 5% (62 models) and 1% (13 models) as nested subsets. Reconcile text to define 10% as outer set. |
| **R5** | Inconsistent growth-rate numbers (3.3%/4.4% vs. 3.0%/4.1%) | p. 8 (§3.2), p. 19 (§4.2) | **YES** | `Shaikh_canonical_series_v1.csv` & `shaikh_period_averages.csv` | **YES** | 3.3% output and 4.4% capital correspond to mean log differences under Shaikh's published $P_y$ deflator. 3.0% and 4.1% correspond to mean log differences under the canonical estimation deflator $p^{KN}$ used in ARDL/VECM. Unify to 3.0% and 4.1% with explicit deflator provenance note. |
| **R6** | Front-end $\hat{\theta} \in [0.65, 0.95]$ range qualification | p. 1 (Abstract), p. 2 (§1), p. 28 (§4.3), pp. 35–36 (§5) | **YES** | Table 8 ($\hat{\theta}$ up to 2.20 in Cases IV–V) & §4.3 text | **YES** | $[0.65, 0.95]$ represents surviving *no-trend* specifications. Trend-containing models reach 2.20. Qualify headline uses as "among retained no-trend specifications" so full sensitivity remains visible. |
| **R7A** | S2 taxonomy: $C_3$ models labeled "Inadmissible" | p. 32 (§4.5, Tab. 12) | **YES** | Section 4.5 text & Table 11/12 criteria | **YES** | All 6 trivariate models pass mechanical Tier 1 gates. $C_3$ models are statistical survivors, not preferred under deterministic-branch criteria. Replace "Inadmissible" with "Tier 1 statistical survivor; not preferred under deterministic-branch criterion". |
| **R7B** | S2 causal language leaks | pp. 33–34 (§4.5), pp. 35–36 (§5) | **YES** | Section 4.5 & Section 5 manuscript source | **YES** | Rephrase deterministic/causal claims ("controls for technique choice", "determines system stability", "fundamentally shaped") into evidence-matched heterodox macro vocabulary. |
| **R8** | Figure 4 caption/legend mismatch | p. 19 (§4.2, Fig. 4) | **YES** | `appendixA/figures/fig_A3_growth_rates.pdf` text stream | **YES** | Vector PDF contains text streams for only $\Delta y_t$ and $\Delta k_t$. Caption mistakenly included $\Delta k^{net}_t$. Remove net capital reference from caption to match graphic and prose. |

---

## 3. Pre-Edit Baseline Lock Confirmation

```text
git status --short
 M scripts/export_working_paper.py
 M scripts/toggle_paragraph_numbers.py

git branch --show-current
main

git log -1 --oneline
d786eda Finalize Chapter 1 working paper baseline
```

All edits will be strictly confined to `workingpapers/chapter1/`.
