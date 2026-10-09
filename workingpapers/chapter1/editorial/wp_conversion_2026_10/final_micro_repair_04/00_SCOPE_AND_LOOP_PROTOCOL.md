# 00 — Scope and Closed-Loop Protocol: Final Micro-Repair 04

**Pass Name:** Final Micro-Repair 04 — Closed-Loop PDF Verification  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Paper:** `workingpapers/chapter1/`  
**Accepted Baseline Prior to Pass 03:** `d786eda` (*Finalize Chapter 1 working paper baseline*)  
**Starting Commit / Branch:** `main` @ `d786eda`  
**Date:** October 2026  

---

## 1. Pre-Repair Repository State

Prior to initiating repairs for Pass 04, the repository state was recorded:
- **Branch:** `main`
- **HEAD Commit:** `d786eda Finalize Chapter 1 working paper baseline`
- **Working Tree Status (`git status --short`):**
  - Tracked modifications outside scope (preserved untouched per hard lock):
    - `M scripts/export_working_paper.py`
    - `M scripts/toggle_paragraph_numbers.py`
  - Tracked modifications within `workingpapers/chapter1/` (from Repair 03):
    - `appendices/appendix_A_ODE.tex`
    - `appendices/appendix_B_data_diagnostics.tex`
    - `appendixA/tables/table_A3_ardl_specification_search.tex`
    - `figures/fig_S3_phase_diagram_capital_capacity_dynamics.pdf`
    - `figures/fig_S3_phase_diagram_capital_capacity_dynamics.png`
    - `sections/01_introduction.tex`
    - `sections/03_conceptual_framework.tex`
    - `sections/04_econometric_replication.tex`
    - `sections/05_discussion_conclusion.tex`
    - `working_paper.pdf`
    - `working_paper.tex`
  - Untracked directories:
    - `?? workingpapers/chapter1/editorial/wp_conversion_2026_10/final_pdf_repair_03/`

---

## 2. Hard Locks & Boundaries

Per Session Charter and User Instructions:
1. **LOCKED TITLE:** `Replicating Shaikh’s Capacity Utilization Measure: Specification Sensitivity and Distribution` — DO NOT ALTER.
2. **NO BROAD REWRITING:** Do not restructure Introduction, Abstract architecture, or paper flow.
3. **NO RE-ESTIMATION:** No new econometric estimation is authorized. S0, S1, S2, and E-01 architectures are locked.
4. **NO SCOPE CREEP:** Zero modifications outside `workingpapers/chapter1/`. The pre-existing modified root scripts remain untouched.
5. **READ-ONLY EMPIRICAL REPOSITORY:** `C:\ReposGitHub\Critical-Replication-Shaikh` remains read-only.
6. **NO GIT PUBLISHING:** No commit, no push, no merge, no rebase, no branch.
7. **READ-ONLY VERIFIER:** `final_pass.py` is strictly a read-only post-repair verifier; it must NEVER edit manuscript files.

---

## 3. Scope of Micro-Repairs (F1–F6)

| ID | Issue Description | Severity | Governing Rule / Source of Truth |
|:---|:---|:---|:---|
| **F1** | **Capital-Growth Notation Consistency** | **BLOCKER** | Define $\hat{k} \equiv \dot{K}/K$ as the net growth rate of the capital stock. Retain gross investment identity $\hat{k} + \delta = I/K = sB$. Retain governing ODE $d\hat{k}/dt = (\theta-1)\hat{k}(\hat{k}+\delta)$. Zero gross investment ($I=0$) implies $\hat{k} = -\delta$. Retain $\hat{k}^*=0$ stable, $\hat{k}^*=-\delta$ unstable for $\theta < 1$. Purge definitions that write $\hat{k} \equiv \dot{K}/K - \delta$. |
| **F2** | **Residual No-Dummy Absolute Claim** | **MANDATORY** | Replace absolute prose in S1 stating that models without controls have nonstationary residuals and that restoring stationarity "requires" step controls. Acknowledge that of 102 $F$-admissible models at 10%, 94 include step controls while 8 no-dummy Case-II models survive. Frame controls as materially improving survival, not universally required. |
| **F3** | **Attempted vs Estimated Bivariate S2 Language** | **MANDATORY** | Clarify across Abstract, Intro, §4.6, §4.7, Conclusion, and tables that across 48 attempted bivariate VECMs, 36 are successfully estimated, and none of the 36 identifies an admissible cointegrating relation (12 C1 models failed numerical convergence and cannot be classified as failing cointegration). |
| **F4** | **Residual Causal Mechanism Language** | **MANDATORY** | Purge uncalibrated causal phrasing in §4.6, §4.7, and Discussion ("causing bivariate cointegration tests to fail", "conditioning on $\ln e$ accounts for technique choice"). Reframe around empirical, statistical, theoretical, and interpretive levels. |
| **F5** | **Pre-2008 Sample-Sensitivity Causality** | **MANDATORY** | Frame the contrast between 1947–2007 (12 admissible) and 1947–2011 (0 admissible) as sample sensitivity and historical coincidence with the Great Recession, not identified causal breakdown. |
| **F6** | **Figure 21 Pulse Legend** | **COSMETIC** | Align the plotted legend in Figure 21 (`fig_A5_dummies_residuals.pdf` / source script) from $D_{56}, D_{74}, D_{80}$ to $P_{56}, P_{74}, P_{80}$ (or $P_{56}, P_{74}, P_{80}$ notation) to match caption and Appendix B terminology. |

---

## 4. Closed-Loop Verification Protocol

1. **Phase 1: Manuscript Repairs (F1–F6)**
   - Apply targeted edits to `.tex` files and regenerate Figure 21 if needed.
2. **Phase 2: PDF Compilation**
   - Run `latexmk -pdf -interaction=nonstopmode working_paper.tex` in `workingpapers/chapter1`.
   - Verify exit code 0, 0 undefined citations, 0 undefined references.
3. **Phase 3: Tool Execution (`final_pass.py`)**
   - Execute `python tools/final_pass.py` from `workingpapers/chapter1`.
   - Layer 1: Source-layer verification (.tex and figure scripts).
   - Layer 2: Rendered-PDF verification (text extraction via PyMuPDF/pdftotext + targeted OCR on rendered page images).
   - Generate `final_pass_results.json`, `final_pass_report.md`, `ocr_extracts/`, `rendered_pages/`.
4. **Phase 4: Loop Evaluation (Max 3 Cycles)**
   - If all 6 pass $\rightarrow$ proceed to post-loop screen.
   - If any fail $\rightarrow$ repair ONLY failed items, recompile, rerun `final_pass.py`.
5. **Phase 5: Independent Post-Loop Reader Screen**
   - Human/agent reader inspection of the newly rendered PDF.
   - Verify wording, layout, float placement, figures, tables, Abstract, Conclusion.
   - Author `04_POST_LOOP_READER_SCREEN.md`.
6. **Phase 6: Final Report & Git Audit**
   - Author `05_FINAL_MICRO_REPAIR_REPORT.md` and `01_FINAL_PASS_TOOL_AUDIT.md`.
   - Run final git status and diff audit against `d786eda`.
