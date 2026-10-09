# 00 — Scope, Baseline Snapshot, and Regression Locks

**Pass:** Final H-Repair Pass 06 — External-Reader Micro-Repairs + Cumulative `final_pass.py` v1.2  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Paper:** `workingpapers/chapter1/`  
**Accepted Baseline Commit Prior to Pass 03:** `d786eda` (*Finalize Chapter 1 working paper baseline*)  
**Starting Commit / Branch:** `main` @ `d786eda`  
**Date:** October 2026  

---

## 1. Baseline Verification State (Pre-Repair Snapshot)

Prior to initiating modifications for Pass 06, the repository and verification baseline was recorded:

- **Current Rendered PDF Path:** `C:\ReposGitHub\phd-dissertation\workingpapers\chapter1\working_paper.pdf`
- **Current Rendered PDF Page Count:** 56 pages (1,983,083 bytes)
- **Current Rendered PDF SHA256 Hash:**  
  `1ECAB35D03CD4ADA36F6D94C8F8238D210ABFF21F716D0AF82BBDF4CF2607462`
- **Current `final_pass.py` Tool Path:** `C:\ReposGitHub\phd-dissertation\workingpapers\chapter1\tools\final_pass.py`
- **Current `final_pass.py` v1.1 SHA256 Hash:**  
  `9EFD26035416A376191F30718EF95ED39378967C020AC35778E44324D2085C7C`
- **Pre-Repair Nine-Check Verification Suite Execution (v1.1):**
  - `F1` (Capital-growth notation consistency): **PASS** (Source & Rendered)
  - `F2` (No-dummy S1 absolute claim qualification): **PASS** (Source & Rendered)
  - `F3` (48 attempted / 36 estimated S2 distinction): **PASS** (Source & Rendered)
  - `F4` (Causal mechanism calibration): **PASS** (Source & Rendered)
  - `F5` (Pre-2008 sample-sensitivity calibration): **PASS** (Source & Rendered)
  - `F6` (Figure 21 pulse legend consistency): **PASS** (Source, Rendered & Visual)
  - `G1` (Scope qualification of system-level claims): **PASS** (Source & Rendered)
  - `G2` (Reserve-Army interpretation calibration): **PASS** (Source & Rendered)
  - `G3` (Diagnostic & Johansen rank calibration): **PASS** (Source & Rendered)
  - **Overall Pre-Repair Exit Code:** `0` (`PASS`)

---

## 2. Hard Locks & Semantic Invariants

> [!IMPORTANT]
> **F1–F6 & G1–G3 REGRESSION LOCK:**
> The semantic definitions, assertions, and verification criteria for checks F1 through F6 and G1 through G3 are **LOCKED** as permanent historical invariants. They MUST NOT be weakened, deleted, bypassed, or redefined. All future passes must run F1–F6 and G1–G3 alongside newly introduced reader guards as an unbroken regression test suite.

### Additional Session Locks:
1. **LOCKED TITLE:** `Replicating Shaikh’s Capacity Utilization Measure: Specification Sensitivity and Distribution` — DO NOT ALTER.
2. **NO BROAD REWRITING:** Do not restructure Introduction, Abstract, or overall paper flow.
3. **NO RE-ESTIMATION:** No new econometric estimation is authorized. S0, S1, S2, and E-01 architectures are locked.
4. **NO COEFFICIENT EDITS:** All numerical estimates remain strictly frozen.
5. **NO SCOPE CREEP:** Zero modifications outside `workingpapers/chapter1/`. Pre-existing modified root scripts (`scripts/export_working_paper.py`, `scripts/toggle_paragraph_numbers.py`) remain untouched.
6. **READ-ONLY EMPIRICAL REPOSITORY:** `C:\ReposGitHub\Critical-Replication-Shaikh` remains strictly read-only.
7. **NO GIT PUBLISHING:** No commit, no push, no merge, no rebase, no branch.

---

## 3. Scope of External-Reader Micro-Repairs (H1–H5)

| ID | Issue Description | Severity | Target Scope & Governing Rule |
|:---|:---|:---|:---|
| **H1** | **ARDL / PSS Bounds-Test Inference Language** | **MANDATORY** | Replace residual-unit-root equivalence ("residuals remain nonstationary", "rejection confirms stationary residuals", "residuals contain a unit root") with precise levels-relationship language ("evaluates the null of no long-run levels relationship", "insufficient evidence of a long-run levels relationship"). |
| **H2** | **Surviving VECM "Non-Stationary Residuals" Language** | **MANDATORY** | Replace residual nonstationarity phrasing in Introduction and §4.6 opening with canonical Johansen rank phrasing ("Within the tested bivariate specifications, no stationary long-run cointegrating combination is identified", "Because no stationary bivariate cointegrating vector is identified..."). |
| **H3** | **$\alpha_k$ Adjustment Inference** | **MANDATORY** | Distinguish absence of statistically detectable error-correction adjustment from structural zero ("statistically indistinguishable from zero, providing no statistically detectable evidence of error-correction adjustment through the capital equation"; error correction concentrated in exploitation equation). |
| **H4** | **Profit-Rate Decomposition Logic** | **MANDATORY** | Harmonize discussion around Equation (29) ($r_t = \pi_t \mu_t (Y^p_t / K_t)$): $\theta < 1$ depresses potential profitability $Y^p_t/K_t$; higher profit share can partly offset in realized rate; lower utilization further lowers realized rate (remove claim that excess capacity offsets falling potential profitability). |
| **H5** | **Figure 14 Reference-Line Numerical Consistency** | **MANDATORY** | Conduct provenance audit of Figure 14 reference line (`\rho_{corpnew} = 1/35 \approx 2.86\%` vs. caption `3.29\%`). Align caption, legend, and reference line with empirical ground truth. |

---

## 4. Phase Plan for Pass 06

1. **Phase 1: Provenance Investigation (H5) & Manuscript Repairs (H1–H5)** — Target `.tex` files only.
2. **Phase 2: Verifier Promotion (`final_pass.py` v1.2)** — Append modular H1–H5 checks to the existing 9 checks, yielding the full 14-check suite.
3. **Phase 3: Compilation** — Compile PDF via `latexmk -pdf -interaction=nonstopmode working_paper.tex`.
4. **Phase 4: Cumulative 14-Check Verification** — Execute `python tools/final_pass.py` (Exit Code 0 expected).
5. **Phase 5: Post-Loop Independent Screen** — Conduct reader screen for wording, layout, and visual fidelity.
6. **Phase 6: Artifact Documentation & Git Audit** — Author all required artifacts and record git diff against `d786eda`.
