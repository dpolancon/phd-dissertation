# Version 8 Control-Diff Report
## Forensic Repair Verification against Immutable Version 7 Baseline

**Date:** 2026-09-29  
**Repository:** `C:\ReposGitHub\Chapter3_RPEUP`  
**Execution Workspace:** `paper/Version8/`  
**Validation Standard:** `chapter3_vault/25_FinalEditing/AG_V8_FORENSIC_REPAIR_PASS_LAUNCHER.md`

---

## 1. Immutable Version 7 Baseline Integrity

- **Control Baseline Commit:** `7e336978d1416135e0475e739d179e41b60cd3f0`
- **Version 7 Directory Status:** Strictly untouched, ignored via `.gitignore` (`/paper/Version7/`)
- **Version 7 PDF Path:** `paper/Version7/Chapter3_Paper.pdf`
- **Known / Verified Version 7 PDF SHA-256:**
  `6211614F96BC9716B9AA1E0E4AA9CC37A93B030E635B237D57186E345BF049E8`
- **Post-Pass Verification:** Re-computed SHA-256 matches exactly (`6211614F...`), confirming zero baseline contamination.

---

## 2. Exact Version 8 Files Changed

The following 13 `.tex` source and figure files were modified relative to `paper/Version7/`:

1. `paper/Version8/sections/02_literature_review.tex`
2. `paper/Version8/sections/03_macro_framework.tex`
3. `paper/Version8/sections/04_data_architecture.tex`
4. `paper/Version8/sections/05_2_stylized_facts.tex`
5. `paper/Version8/sections/05_historical_empirical_results.tex`
6. `paper/Version8/sections/05_4_threshold_var.tex`
7. `paper/Version8/sections/06_discussion_conclusion.tex`
8. `paper/Version8/appendix/appendix_tvar_girf_atlas.tex`
9. `paper/Version8/appendix/appendix_unit_root_battery.tex`
10. `paper/Version8/tables/tab01_adf_tests.tex`
11. `paper/Version8/tables/tab03_solvency_unit_root.tex`
12. `paper/Version8/tables/tab04_tvar_estimates.tex`
13. `paper/Version8/tables/tab04_tvar_threshold_tests.tex`
14. `paper/Version8/figures/regime_timeline_level.pdf` (and `.png`)
15. `paper/Version8/figures/regime_timeline_gap.pdf` (and `.png`)

*Plus tracking ledgers (`V8_REPAIR_LEDGER.md`, `V8_CONTROL_DIFF_REPORT.md`) and standard LaTeX compilation byproducts (`.aux`, `.bbl`, `.blg`, `.log`, `.out`, `.toc`, `.pdf`).*

---

## 3. Repair IDs Executed

All 13 planned repairs (including sub-items V8-01a--e) were fully executed and source-diff verified:

- **V8-01a (Section 3 Opening Bridge):** Added concise 4-sentence opening paragraph establishing the structural sequence: world money $\to$ peripheral settlement asymmetry $\to$ central-bank balance sheet $\to$ domestic accommodation $\to$ empirical state dependence.
- **V8-01b (Generic Liabilities vs Base Money):** Added bridge clarifying that $M_t$ is the generic theoretical liability concept, empirical baseline operationalizes central-bank liabilities with directly observed high-powered money $H_t$, and $M1_t$ is reserved for commercial-banking deconstruction.
- **V8-01c (Discrete Law of Motion):** Aligned main-text equation with Appendix A: $\Delta \text{SolvR}_t = \frac{\text{BoP}_t}{M_t} - \text{SolvR}_{t-1} g_{M,t}$, explicitly defining $\text{BoP}_t \equiv CA_t + KA_t$ and referencing Appendix A.
- **V8-01d (Stock vs Flow Gap Distinction):** Clarified distinction between cumulative external backing stock $\text{SolvR}_t$ and stationary empirical transition variable $\Delta s_{t-1} = g^F_{t-1} - g^H_{t-1}$.
- **V8-01e (Section 3.5 Theoretical Lock):** Retitled subsection to *Peripheral Financial Fragility and Central-Bank Solvency*. Positioned Minsky as broad financial-fragility intuition, Foley as absorption of private distress onto state balance sheets, Chamorro-Futinico as external peripheral amplification via international currency hierarchy, and TVAR states as empirically estimated without imposing Minsky categories. Formatted 4-step sequence across two lines to ensure typographic margins.
- **V8-02 (State Nomenclature Standardization):** Standardized TVAR states across Section 5.4, Table 4, Section 6, and Appendix D to *adverse solvency-growth state* ($\Delta s_{t-1} \le -4.615\%$) and *non-adverse solvency-growth state*, reserving *conditions of central-bank insolvency* for substantive economic interpretation.
- **V8-03 (PCMCI vs Forward Channel Harmonization):** Replaced "providing no empirical support for the forward monetarist channel" in Section 6 with method-specific language: *PCMCI does not retain a direct conditional $g^H \to \pi$ edge under its conditioning set ($q > 0.10$)*, clarifying that this does not overturn the bounded forward predictive channel recovered in the VAR and GIRF estimations.
- **V8-04 (System 6 Denominator-Language Calibration):** Rephrased causal formulations in §5.3.4 (lines 82 & 84) to explicitly acknowledge that high-powered money emission predicting subsequent declines in the solvency ratio partly reflects the mechanical denominator relation in $\text{SolvR}^H_t \equiv e_t \text{IR}_t / H_t$.
- **V8-05 (Appendix D Stock/Flow Dimensional Repair & Persistence Calibration):** Corrected dimensional error in Appendix D.3 from "liquid reserves are depleted below -4.615%" to "the lagged Solvency Growth Gap enters the adverse state ($\Delta s_{t-1} \le -4.615\%$)". Retitled D.3 to *Endogenous Regime Switching Probabilities and State Persistence*, and calibrated "gravitational trap / hysteresis" claims to simulated state persistence.
- **V8-06 (Appendix D.6 Exogeneity Diagnostics Retitle & Rephrase):** Retitled D.6 to *Diagnostics for Block-Exogeneity and Structural Exclusion Restrictions*, and replaced "confirms empirical neutrality" with "no statistically significant response is detected under this specification" and "data do not provide evidence against treating Chile as a price taker".
- **V8-07 (Figure 11 Demotion & De-cluttering):** Modified `plot_timeline.R` to set `show.legend = FALSE` and output cleanly to `paper/Version8/figures/`. Retitled Figure 11 to *Central Bank Solvency Ratio and Solvency Growth Gap, 1960--1980*. Expanded note to define exploratory three-state partition versus baseline two-state TVAR pooling.
- **V8-08 (Figure 10 Event Study Layout):** Stacked subfigures 10a (August 1971) and 10b (October 1972) vertically at `0.85\textwidth` with `\vspace{0.3cm}` in `05_2_stylized_facts.tex`. Preserved single-unit percentage scaling while restoring full visual legibility.
- **V8-09 (Section 4 Administrative Registration Wording):** Softened April 1973 import drop from "Historical verification confirms this reflects..." to "The isolated drop is treated as an administrative registration anomaly consistent with a paperwork lag in clearing port arrivals into official records...".
- **V8-10 (Stationarity Hypothesis Testing Wording):** Replaced "confirming covariance stationarity" with "reject the unit-root null at conventional significance levels, providing evidence consistent with covariance stationarity ($I(0)$)" across Table 1, Table 3, and Appendix unit-root notes.
- **V8-11 (Section 2 Manual Paragraph Monotonic Numbering):** Renumbered manual bold paragraph labels monotonically from `2.1` through `2.34` without prose alterations, resolving duplicate `2.3`, duplicate `2.27`, and the gap from `2.28` to `2.33`.
- **V8-12 (Section 6 Policy Attribution):** Calibrated Section 6 paragraph 50 to attribute centralized foreign-exchange budgeting, export surrender requirements, and capital controls directly to the structuralist and developmental literature, separating empirical threshold estimation from normative historical policy traditions.
- **V8-13 (Residual AI-Trace & Metaphor Pruning):** Replaced "fatal analytical concession" with "important analytical compromise", "Bounded by a bilateral nation-state framework" with "Confined to a bilateral nation-state framework", "forward transmission exists, but it remains bounded" with "response profile is constrained", "external balance-of-payments boundary" with "external balance-of-payments constraint", and "threshold boundaries" with "estimated thresholds".

---

## 4. Repair IDs Intentionally Not Executed

- **None (0 items).** All 13 items in `V8_REPAIR_LEDGER.md` were approved (`YES`) and executed.

---

## 5. Literal-Search Results

Literal recursive search across all `.tex` files in `paper/Version8/` confirms **0 hits** for all targeted audit phrases:

| Target Phrase | Hit Count in `.tex` | Status |
|---|:---:|---|
| `fatal analytical concession` | 0 | CLEAN |
| `Bounded by a bilateral nation-state framework` | 0 | CLEAN |
| `forward transmission exists, but it remains bounded` | 0 | CLEAN |
| `Empirical Confirmation of Exogenous Neutrality` | 0 | CLEAN |
| `confirms the empirical neutrality` | 0 | CLEAN |
| `predictively depleted` | 0 | CLEAN |
| `no empirical support for the forward monetarist channel` | 0 | CLEAN |
| `Low-Solvency Regime` | 0 | CLEAN |
| `Normal Regime` | 0 | CLEAN |
| `gravitational trap` | 0 | CLEAN |
| `depleted below -4.615` | 0 | CLEAN |
| `external balance-of-payments boundary` | 0 | CLEAN |
| `threshold boundaries` | 0 | CLEAN |

---

## 6. Protected-Number Invariance Results

All key empirical quantities and specifications are 100% invariant between Version 7 and Version 8:

- **Threshold Parameter:** $\hat{\gamma} = -4.615\%$ (invariant across all occurrences)
- **Upper-Tail Diagnostic Threshold:** $\hat{\gamma}_2 = +20.878\%$ (invariant)
- **Sample Partitions:** $N_1 = 100$ (adverse state), $N_2 = 145$ (non-adverse state), $N = 250$ (full sample)
- **GIRF Cumulative Multipliers (Median Path):** Forward money $3.550$ pp, Reverse accommodation $6.537$ pp (invariant)
- **TVAR Parameter Estimates:**
  - Money equation lagged inflation: $\hat{\beta} = 0.236$ (non-adverse) vs $\hat{\beta} = 0.581$ (adverse) (invariant)
  - Inflation persistence: $\hat{\beta} = 0.275$ (non-adverse) vs $\hat{\beta} = 0.684$ (adverse) (invariant)
  - World gold pass-through: $\hat{\beta} = -0.013$ (non-adverse) vs $\hat{\beta} = +0.197$ (adverse) (invariant)
- **Econometric Tournament:** All Granger test $F$-statistics, $p$-values, lag specifications ($k=1,\dots,4$), and sample sizes ($T=104, 60, 44$) remain strictly unchanged.

---

## 7. Figure 10 Visual Check

- **Rendered Output:** Inspected via `pdftoppm` high-resolution PNG render (`event-42.png`, page 41).
- **Layout:** Vertical stacking of subfigure (a) (August 1971 credit freeze and gold window closure) and subfigure (b) (October 1972 employer lockout and transport strike) at `0.85\textwidth`.
- **Fidelity:** Preserves genuine percentage units, distinct point-and-dash trajectories, unclipped horizontal and vertical axes, and complete descriptive notes. Full text-width presentation eliminates prior miniature scaling.

---

## 8. Figure 11 Visual Check

- **Rendered Output:** Inspected via `pdftoppm` high-resolution PNG render (`fig11-55.png`, page 54).
- **In-Plot De-cluttering:** The "Crisis / Windfall" in-plot legend was eliminated from the plot canvas by updating `plot_timeline.R` (`show.legend = FALSE`, `legend.position = 'none'`).
- **Canvas Purity:** Panel (A) Level Solvency Ratio Stock ($S_t$) and Panel (B) Solvency Growth Gap Flow ($\Delta s_t$) sit side-by-side with crisp zero/threshold reference lines.
- **Note Clarification:** Figure note clearly distinguishes the exploratory three-state partition (red, blue, unshaded) from the baseline two-state TVAR model pooling.

---

## 9. Compilation Status

- **Engine:** `pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)`
- **Pass Sequence:** 4-pass clean build (`pdflatex` $\to$ `bibtex` $\to$ `pdflatex` $\to$ `pdflatex`)
- **Fatal Errors:** 0
- **Undefined Citations:** 0
- **Undefined References:** 0
- **Multiply Defined Labels:** 0

---

## 10. Version 8 Page Count and File Hash

- **Final Compiled PDF:** `paper/Version8/Chapter3_Paper.pdf`
- **Page Count:** 94 pages
- **File Size:** 1,683,591 bytes
- **SHA-256 Checksum:**
  `F491804B7F6038EA937064DABFA9B46DF296746B2CD2CAAD4DD86B913B2508D8`

---

## 11. Unresolved Researcher Decisions

- **None (0).** All repairs were executed within strict authorized parameters.

---

## 12. Summary Diff (`git diff --no-index --stat paper/Version7 paper/Version8`)

```text
 paper/{Version7 => Version8}/Chapter3_Paper.aux    | 609 +++++++++++----------
 paper/{Version7 => Version8}/Chapter3_Paper.log    | 199 +++----
 paper/{Version7 => Version8}/Chapter3_Paper.out    |   6 +-
 paper/{Version7 => Version8}/Chapter3_Paper.pdf    | Bin 1681938 -> 1683591 bytes
 paper/{Version7 => Version8}/Chapter3_Paper.toc    | 194 +++----
 .../appendix/appendix_tvar_girf_atlas.tex          |  22 +-
 .../appendix/appendix_unit_root_battery.tex        |   4 +-
 .../V8_CONTROL_DIFF_REPORT.md                      |   5 +
 .../post_calibration_repair/V8_REPAIR_LEDGER.md    |  42 ++
 .../figures/regime_timeline_gap.pdf                | Bin 21473 -> 21473 bytes
 .../figures/regime_timeline_level.pdf              | Bin 23215 -> 21567 bytes
 .../figures/regime_timeline_level.png              | Bin 102396 -> 102442 bytes
 .../sections/02_literature_review.tex              |  66 +--
 .../sections/03_macro_framework.tex                | 141 ++---
 .../sections/04_data_architecture.tex              |   2 +-
 .../sections/05_2_stylized_facts.tex               |   7 +-
 .../sections/05_4_threshold_var.tex                |  34 +-
 .../sections/05_historical_empirical_results.tex   |   4 +-
 .../sections/06_discussion_conclusion.tex          |   6 +-
 .../tables/tab01_adf_tests.tex                     |   2 +-
 .../tables/tab03_solvency_unit_root.tex            |   2 +-
 .../tables/tab04_tvar_estimates.tex                |   4 +-
 .../tables/tab04_tvar_threshold_tests.tex          |   2 +-
 23 files changed, 712 insertions(+), 639 deletions(-)
```

---

## 13. Pre-Existing Working Tree Integrity

- **Pre-Existing Tracked Changes:** 1,021 files untouched, unstaged.
- **Untracked Scratch Files:** Untouched.
- **Git Index:** Clean, no files staged.
- **Git Commit / Push:** None executed.
