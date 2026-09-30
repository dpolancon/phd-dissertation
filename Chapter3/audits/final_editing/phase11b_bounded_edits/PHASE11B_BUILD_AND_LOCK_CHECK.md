# PHASE 11B — BUILD AND LOCK CHECK REPORT
## Comprehensive Technical Compilation and Empirical Invariance Verification

**Document:** `paper/Version7/audits/final_editing/phase11b_bounded_edits/PHASE11B_BUILD_AND_LOCK_CHECK.md`  
**Phase:** 11B (Technical Verification and Invariance Gate)  
**Date:** September 29, 2026  
**Audited Target:** Master Document `paper/Version7/Chapter3_Paper.tex`  
**Target Engine:** pdfTeX 3.141592653-2.6-1.40.29 / BibTeX 0.99e (TeX Live 2026)  

---

### 1. Build Verification Summary

The complete manuscript was compiled through a clean four-pass cycle (`pdflatex` $\to$ `bibtex` $\to$ `pdflatex` $\to$ `pdflatex`).

| Metric | Required Threshold | Achieved Value | Verdict |
|:---|:---:|:---:|:---:|
| **Compilation Exit Code** | 0 | **0** | `PASS` |
| **Document Page Count** | Stable ($\sim 86$ pages) | **86 pages** (1,644,938 bytes) | `PASS` |
| **Fatal TeX Errors** | 0 | **0** | `PASS` |
| **Undefined Citations** (`Citation ... undefined`) | 0 | **0** | `PASS` |
| **Undefined Cross-References** (`Reference ... undefined`) | 0 | **0** | `PASS` |
| **Multiply-Defined Labels** (`Label ... multiply defined`) | 0 | **0** | `PASS` |
| **BibTeX Entries Processed** | $> 120$ | **127 entries** | `PASS` |
| **Active Placeholder Strings** (`[Title to verify]`) | 0 in active text | **0** | `PASS` |

*Log Evidence:*  
- Log file `paper/Version7/Chapter3_Paper.log` contains zero occurrences of `Citation .* undefined`, `Reference .* undefined`, or `Label .* multiply defined`.
- BibTeX log `paper/Version7/Chapter3_Paper.blg` processed 127 references with zero fatal errors.

---

### 2. Empirical Invariance and Parameter Lock Verification

Every empirical specification and numerical estimate locked in Phase 10D was cross-checked against the compiled text:

#### A. System 2 Conditional Trivariate VAR(3) (`05_historical_empirical_results.tex:70`)
- **Sample Window:** 1966:01--1980:12 ($N=180$, usable $N_{\text{eff}}=177$ at $k=3$).
- **Admissibility:** Stable ($\max |\lambda| = 0.817$), System Breusch--Godfrey $p = 0.428$, equation-level base money $p = 0.289$.
- **Estimates:**
  - $g_{M1} \to g_H$: $F = 3.654, p = 0.0138, \sum \hat{\beta}_i = +0.510$ (`LOCKED — VERIFIED`)
  - $g_H \to g_{M1}$: $F = 3.239, p = 0.0236, \sum \hat{\beta}_i = +0.333$ (`LOCKED — VERIFIED`)
  - $\pi \to g_{M1}$: $F = 6.842, p = 0.0002, \sum \hat{\beta}_i = +0.284$ (`LOCKED — VERIFIED`)
  - $g_{M1} \to \pi$: $F = 1.004, p = 0.3927, \sum \hat{\beta}_i = +0.444$ (Non-rejection, `LOCKED — VERIFIED`)
- **Status:** **100% INVARIANT**. Zero drift from Phase 10D.

#### B. System 6 Pre-1973 Conditional VAR(3) (`05_historical_empirical_results.tex:80`, `06_discussion_conclusion.tex:20`)
- **Sample Window:** 1960:02--1973:09 ($N_{\text{eff}} = 161$ months).
- **Admissibility:** Stable ($\max |\lambda| = 0.8817$), System Breusch--Godfrey $\chi^2 = 116.35, df=100, p = 0.1262$, base money equation $p = 0.0557$, Portmanteau $p = 0.0754$.
- **Time Frequency:** Corrected from "quarterly" to "monthly" in §6.2.
- **Estimates:** $g_{\text{SolvR\_H}} \to g_H$ ($F = 2.455, p = 0.0655$).
- **Status:** **100% INVARIANT**.

#### C. TVAR GIRF Multiplier Tournament Core Numbers (Abstract, §1.2, §5.4, §6.2, Appendix A, Table 4)
- **Transition Variable:** Predetermined Solvency Growth Gap ($\Delta s_{t-1} \equiv g^F_{t-1} - g^H_{t-1}$).
- **Estimated Threshold:** $\hat{\gamma} = -4.615\%$ ($N_1 = 100$ months in insolvency regime, $N_2 = 147$ months in normal regime).
- **Forward Transmission ($g^H \to \pi_m$):**
  - Statistically significant for **9 consecutive months** ($h=1\dots 9$).
  - Cumulative 12-month response: **3.55 percentage points**. (`LOCKED — VERIFIED`)
- **Reverse Accommodation ($\pi_m \to g^H$):**
  - Statistically significant for **10 consecutive months** ($h=1\dots 10$).
  - Cumulative 12-month expansion: **6.54 percentage points**. (`LOCKED — VERIFIED`)
- **Point-wise Multiplier Difference Test ($\Delta(h)$):**
  - Reverse accommodation dominates forward transmission significantly across **9 consecutive months** ($h=2,\dots,10$). (`LOCKED — VERIFIED`)
- **Status:** **100% INVARIANT**.

---

### 3. Causal-Language Compliance Verification

A global automated regex audit was executed across all active text and appendix files:
- Search pattern: `\b(refut(es|ed|ing)?|rul(es|ed|ing)?\s+out)\b`
- **Econometric model claims:** **Zero occurrences** of absolute falsification or exclusion verbs.
- **Calibrated passages:**
  - §5.3 (`05_historical_empirical_results.tex:63`): "is difficult to reconcile with the strict monetarist premise of unidirectional money exogeneity" (`CALIBRATED`)
  - App A (`appendix_bop_levr.tex:140`): "challenging closed-economy monetarist accounts of autonomous monetary emission" (`CALIBRATED`)
  - §6.2 (`06_discussion_conclusion.tex:20`): "providing no empirical support for the forward monetarist channel" (`CALIBRATED`)
- **Allowed non-econometric historiographical usages:**
  - §2.7 (`02_literature_review.tex:88`): "No superior explanatory framework refuted it in a scientific terrain..." (historiography of dependency theory).
  - §2.27 (`02_literature_review.tex:283`): "Kvangraven refutes the mainstream caricature of dependency as a monolithic dogma..." (secondary literature critique).

---

### 4. TVAR Transition-Variable Trace Verification

- **Manuscript Text (§4.2 line 23):**
  > *"In the threshold specification, the estimated transition variable is the predetermined lagged Solvency Growth Gap ($\Delta s_{t-1} \equiv g^F_{t-1} - g^H_{t-1}$), with threshold estimation and inference following the grid-search procedure of \citet{Hansen1999}."*
- **Empirical Code Provenance:**
  - `codes/tvar/01_data_and_spec.R:63-65`: `s_H = log(q_H)`, `ds_H = c(NA, diff(s_H)) * 100` ($\equiv g^F_t - g^H_t$).
  - `codes/tvar/01_data_and_spec.R:116`: `q_thresh <- sub_clean[[threshold_lag_var]][2:n_full]` (`ds_H_l1`).
  - `codes/tvar/02_grid_search_and_bootstrap.R:77`: `opt_gamma <- -4.615084`.
- **Match Verdict:** **EXACT 1:1 CORRESPONDENCE**. Residue completely eliminated.

---

### 5. Final Invariance Verdict

All technical build tests, lock verifications, and causal-language criteria have passed with zero violations. The Version 7 manuscript is completely synchronized with accepted empirical provenance and bibliographic records.
