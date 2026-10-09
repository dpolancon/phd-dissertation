# 00 — Scope and Baseline Snapshot: Final Consolidated Pass 05

**Pass:** Final Consolidated Pass 05 — Cumulative `final_pass.py` v1.1 + Reader-Guard Extension  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Paper:** `workingpapers/chapter1/`  
**Accepted Baseline Commit Prior to Pass 03:** `d786eda` (*Finalize Chapter 1 working paper baseline*)  
**Starting Commit / Branch:** `main` @ `d786eda`  
**Date:** October 2026  

---

## 1. Baseline Verification State

Prior to initiating modifications for Pass 05, the repository and verification baseline was recorded:

- **Current Rendered PDF Path:** `C:\ReposGitHub\phd-dissertation\workingpapers\chapter1\working_paper.pdf`
- **Current Rendered PDF Page Count:** 56 pages (1,982,744 bytes)
- **Current `final_pass.py` Tool Path:** `C:\ReposGitHub\phd-dissertation\workingpapers\chapter1\tools\final_pass.py`
- **Current `final_pass.py` SHA256 Hash:**  
  `C9FD3CDFB65F3447A70A25D4BC9494A4B9D6866D48D3FBAD69B37E9B4FAADA4F`
- **Current F1–F6 Verification State:**
  - `F1` (Capital-growth notation consistency): **PASS** (Source & Rendered)
  - `F2` (No-dummy S1 absolute claim qualification): **PASS** (Source & Rendered)
  - `F3` (48 attempted / 36 estimated S2 distinction): **PASS** (Source & Rendered)
  - `F4` (Causal mechanism calibration): **PASS** (Source & Rendered)
  - `F5` (Pre-2008 sample-sensitivity calibration): **PASS** (Source & Rendered)
  - `F6` (Figure 21 pulse legend consistency): **PASS** (Source & Rendered)
  - **Overall Exit Code:** `0` (`PASS`)

---

## 2. Hard Locks & Semantic Invariants

> [!IMPORTANT]
> **F1–F6 REGRESSION LOCK:**
> The semantic definitions, assertions, and verification criteria for checks F1 through F6 are **LOCKED** as permanent historical invariants. They MUST NOT be weakened, deleted, bypassed, or redefined. All future passes must run F1–F6 alongside newly introduced reader guards as an unbroken regression test suite.

### Additional Session Locks:
1. **LOCKED TITLE:** `Replicating Shaikh’s Capacity Utilization Measure: Specification Sensitivity and Distribution` — DO NOT ALTER.
2. **NO BROAD REWRITING:** Do not restructure Introduction, Abstract, or overall paper flow.
3. **NO RE-ESTIMATION:** No new econometric estimation is authorized. S0, S1, S2, and E-01 architectures are locked.
4. **NO COEFFICIENT EDITS:** All numerical estimates remain strictly frozen.
5. **NO SCOPE CREEP:** Zero modifications outside `workingpapers/chapter1/`. Pre-existing modified root scripts (`scripts/export_working_paper.py`, `scripts/toggle_paragraph_numbers.py`) remain untouched.
6. **READ-ONLY EMPIRICAL REPOSITORY:** `C:\ReposGitHub\Critical-Replication-Shaikh` remains strictly read-only.
7. **NO GIT PUBLISHING:** No commit, no push, no merge, no rebase, no branch.

---

## 3. Scope of Reader-Guard Items (G1–G3)

| ID | Issue Description | Severity | Target Scope & Governing Rule |
|:---|:---|:---|:---|
| **G1** | **Scope Qualification of System-Level Claims** | **MANDATORY** | Qualify S2 system-level assertions (containing "only when", "cannot sustain", "requires conditioning", "essential", "survives exclusively") to explicitly bound their empirical domain of inference (e.g., "within the tested full-sample system grid", "among the specifications examined", "in the tested system specification space"). |
| **G2** | **Reserve-Army Interpretation Calibration** | **MANDATORY** | Ensure the $\ln e_t$ normalized coefficient (-0.050) is presented as an interpretive political-economy framework ("consistent with a reserve-army mechanism", "a classical reserve-army interpretation would connect..."), explicitly stating that the VECM does not identify that causal bargaining mechanism directly. |
| **G3A** | **Breusch–Godfrey LM(4) Diagnostic Calibration** | **MANDATORY** | Retain BG LM(4) = 60.81 ($p = 0.006$). Clarify that residual serial correlation indicates residual dependence at lag 4 that weakens conventional finite-sample inference and constitutes a diagnostic limitation, without claiming superconsistency renders it harmless. |
| **G3B** | **Bivariate "Residuals are I(1)" Calibration** | **MANDATORY** | Replace assertions that bivariate residuals "remain non-stationary (I(1))" with precise statements that none of the 36 successfully estimated bivariate systems identifies a stationary cointegrating vector under Johansen rank tests. |

---

## 4. Phase Plan for Pass 05

1. **Phase 1: Manuscript Repairs (G1–G3)** — Target `.tex` files only.
2. **Phase 2: Verifier Extension (`final_pass.py` v1.1)** — Append modular G1–G3 checks while preserving F1–F6 regression logic intact.
3. **Phase 3: Compilation** — Compile PDF via `latexmk -pdf -interaction=nonstopmode working_paper.tex`.
4. **Phase 4: Cumulative Nine-Check Verification** — Execute `python tools/final_pass.py` (Exit Code 0 expected).
5. **Phase 5: Post-Loop Independent Screen** — Conduct reader screen for wording, layout, and visual fidelity.
6. **Phase 6: Artifact Documentation & Git Audit** — Author all required artifacts and record git diff against `d786eda`.
