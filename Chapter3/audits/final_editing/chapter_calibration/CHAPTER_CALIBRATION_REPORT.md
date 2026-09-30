# Chapter-Wide Calibration & Visual Consolidation Report

**Date:** September 29, 2026  
**Repository:** `C:\ReposGitHub\Chapter3_RPEUP`  
**Governing Protocol:** `chapter3_vault/25_FinalEditing/NEXT_PASS_CHAPTER_CALIBRATION_LAUNCHER.md`  
**Master Ledger:** `paper/Version7/audits/final_editing/chapter_calibration/CHAPTER_CALIBRATION_LEDGER.md`  
**Compiled Manuscript:** `paper/Version7/Chapter3_Paper.pdf` (92 pages)  
**Status:** Completed successfully — Stage A, Stage B, and Stage C verified.

---

## 1. Executive Summary & Protocol Scope

This pass executed the comprehensive chapter-wide calibration and visual consolidation protocol across `paper/Version7/Chapter3_Paper.tex` and its associated section files, figure scripts, and appendices, in strict accordance with the preconditions established in `NEXT_PASS_CHAPTER_CALIBRATION_LAUNCHER.md`.

### Core Operating Constraints Honored
1. **Section 5.1 Strict Lock:** `paper/Version7/sections/05_1_historical_background.tex`, its references (`Cardoso1972`, `Vidal2015`, `Vidal2019`, `Kay1980`, etc.), historical series, and Figure 7 (`paper/Version7/figures/sec51/fig07_wageshare_unionization.pdf` / `.png`) were strictly untouched. File system timestamps confirm zero modification during this pass.
2. **Zero Empirical Re-estimation:** All econometric coefficients, lag selections ($p=3$ for System 1; $p=1$ for TVAR), threshold parameters ($\hat{\gamma} = -4.615\%$), sample windows ($T=104$, $T=60$, $T=44$), and cumulative GIRF numbers ($3.550$ pp forward vs $6.537$ pp reverse accommodation) remained 100% invariant.
3. **No New References or Bibliography Discovery:** `paper/Version7/references.bib` was not modified.
4. **No Git Commit / Push:** All modifications remain in the working tree.
5. **Ledger Precedence:** All 65 items evaluated were formally cataloged in `CHAPTER_CALIBRATION_LEDGER.md` before execution; 64 were approved (`YES`) and executed, 1 was preserved (`SAFE_NO_EDIT`), and 0 items were left unresolved.

---

## 2. Empirical-Language Consistency & State Nomenclature

A major objective of this pass was eliminating lingering phrasing that suggested either pure unidirectional causality or mischaracterized the threshold transition variable.

### Key Calibrations Executed:
- **Bidirectional Predictive Dynamics with Asymmetric Reverse Dominance:**
  - Standardized throughout the Abstract, Section 1 (Introduction), Section 5.3 (Granger causality), Section 5.4 (TVAR), and Section 6 (Discussion/Conclusion).
  - Rather than claiming "unidirectional monetarist causality is inverted" or that causality runs "unidirectionally from inflation to money growth," the text now precisely reflects the empirical results: predictive interaction operates bidirectionally across the full sample ($T=104$), but reverse accommodation of cost-push pressures from inflation to base-money growth is substantially stronger and more persistent ($p < 0.001$, cumulative GIRF $6.537$ pp) than forward monetary transmission ($p = 0.038$, cumulative GIRF $3.550$ pp), directly countering unidirectional monetarist exogeneity.
- **State Nomenclature Harmonization:**
  - Replaced colloquial or conflated terms ("crisis regime," "high-inflation regime," "regime of central bank insolvency") with the precise econometric definition:
    $$\text{Adverse solvency-growth state: } \Delta s_{t-1} = g^F_{t-1} - g^H_{t-1} \le -4.615\%$$
    $$\text{Non-adverse solvency-growth state: } \Delta s_{t-1} > -4.615\%$$
  - Fixed Section 5.4 (line 268) and Section 6 (line 26) where the threshold was erroneously conflated with foreign reserve stocks or the Central Bank Solvency Ratio level ($0.5898$) rather than the lagged net foreign asset growth gap $\Delta s_{t-1}$.
- **Elimination of Absolute Falsification Terminology:**
  - In `paper/Version7/figures/tikz_pcmci_dag.tex`, updated the node and legend text from "Refuted Null" and "Orthodox Null Refuted" to:
    `"Not Retained under Conditioning ($q > 0.10$, No Direct Link)"`
  - In Section 6, replaced "definitive refutation of monetary dominance" with "clear empirical counter-evidence to unidirectional monetary dominance."
- **Simulation Metric Concordance (Appendix D & Section 5.4):**
  - Added an explicit *Note on Simulation Metric Concordance* in `paper/Version7/appendix/appendix_tvar_girf_atlas.tex` (lines 148–158) reconciling the full Monte Carlo grid sums reported in Table D2 ($3.898$ pp forward / $6.996$ pp reverse) with the point-wise median cumulative paths highlighted in Section 5.4 ($3.550$ pp forward / $6.537$ pp reverse). Both metrics are preserved and their exact statistical relationship is documented for the reader.

---

## 3. Boundary-Family Lexical Audit Decisions

The term "boundary" and its derivatives appeared across multiple sections with varying degrees of legitimacy. Each occurrence was audited and classified into three categories:

| Category | Disposition | Actions Taken |
| :--- | :--- | :--- |
| **Category A: Technical Econometric / Optimization** | **Retained or Precision-Refined** | Econometric trimming parameters and search spaces were refined for mathematical precision. `sections/05_historical_empirical_results.tex` replaced "bounded lag search" with explicit lag-length selection $p \in \{1,\dots,12\}$; `sections/05_4_threshold_var.tex` replaced "bounded within the grid" with "restricted to the trimming grid $[\gamma_{0.15}, \gamma_{0.85}]$"; `appendix/appendix_linear_var_diagnostics.tex` replaced "stable boundaries" with "modulus strictly within the unit circle"; `sections/03_macro_framework.tex` converted "balance-sheet boundary" to "balance-sheet constraint". |
| **Category B: Substantive Economic / Institutional** | **Clarified Contextually** | Passages referring to institutional or solvency boundaries were clarified. `sections/05_4_threshold_var.tex` converted "bound by solvency constraints" to "constrained by solvency conditions"; `sections/06_discussion_conclusion.tex` converted "boundary conditions of monetary accommodation" to "structural limits and institutional conditions of monetary accommodation", and "evidential boundary" to "empirical scope and evidentiary limits". |
| **Category C: Rhetorical Metaphor / Theoretical Residue** | **Eliminated or Cooled** | Rhetorical flourishes were systematically removed: `sections/05_2_stylized_facts.tex` subsection title changed from "Material Bounds and Structural Bottlenecks" to "Structural Bottlenecks and Physical Constraints"; prose changed from "rigid material bounds" to "severe physical and structural constraints"; `sections/02_literature_review.tex` eliminated "within the boundaries of structuralist macroeconomics" and changed "policing the boundaries" to "regulating the division between market and state"; `sections/01_introduction.tex` cooled "constitutive boundaries" to "institutional limits". |

---

## 4. Branded Secondary Jargon Audit & Replacements

Nine branded or mechanical secondary jargon words were comprehensively surveyed and replaced with standard macroeconomic and econometric prose:

1. **`architecture`**:
   - Section 3 title: *"A Macroeconomic Architecture of Balance-Sheet Insolvency"* $\rightarrow$ *"A Structuralist Framework of Balance-Sheet Insolvency"*.
   - Section 4 title: *"Data Architecture and Empirical Strategy"* $\rightarrow$ *"Data and Empirical Strategy"*.
   - Prose references: converted to "conceptual framework," "monetary system" (for Bretton Woods), or "data compilation."
2. **`tournament`**:
   - Subsection 5.3 title: *"Granger-Causality Tournament"* $\rightarrow$ *"Granger-Causality Tests Across Modular Systems"*.
   - Literature review: "competitive tournament of hypotheses" $\rightarrow$ "systematic comparative evaluation of competing hypotheses".
3. **`gate`**:
   - Appendix B: "served as an identification gate" $\rightarrow$ "served as a specification criterion"; "Gate A/B/C" $\rightarrow$ "Criterion A/B/C".
4. **`shield`**:
   - Section 5.4: "acting as a shield against external shocks" $\rightarrow$ "buffering external balance-of-payments shocks"; Introduction: "reserve shield" $\rightarrow$ "reserve buffer".
5. **`trap`**:
   - Section 5.4: "falling into a solvency trap" $\rightarrow$ "entering an adverse regime of chronic balance-sheet insolvency"; "trapped in a liquidity loop" $\rightarrow$ "confined to endogenous balance-sheet accommodation".
6. **`atlas`**:
   - Appendix D title: *"Threshold VAR Generalized Impulse Response Atlas"* $\rightarrow$ *"Threshold VAR Generalized Impulse Response Functions"*; cross-references updated accordingly.
7. **`belt`**:
   - Appendix B & Introduction: "conveyor belt of cost-push pressures" / "transmission belts" $\rightarrow$ "mechanism transmitting cost-push pressures" / "transmission channels".
8. **`hand-off`**:
   - Subsection 5.2.4 title: *"Synthesis and Econometric Hand-Off"* $\rightarrow$ *"Descriptive Synthesis and Empirical Transition"*; prose updated to "transition to dynamic econometric modeling".
9. **`horizon`**:
   - Section 6 subsection title: *"Concluding Remarks and Research Horizon"* $\rightarrow$ *"Concluding Remarks"*; text updated from "institutional horizon" to "institutional perspective".

---

## 5. Visual and Table Consolidation

### A. Figure 10b/10c Overhaul (Lockout Event Study)
- **Problem:** The previous event-study graphic employed a dual-axis presentation that multiplied monthly inflation and money growth by an arbitrary factor of 4, visually distorting relative dynamics.
- **Solution:** A new script `codes/plot_fig02b_event_lockout_vertical.R` was created and executed, deploying:
  - **Panel 1 (Upper):** Physical Output Indices (Manufacturing vs. Mining, September 1972 = 100), clearly isolating the October 1972 transport lockout disruption where manufacturing dropped by 12 index points while mining output remained stable.
  - **Panel 2 (Lower):** Monthly Inflation ($\pi_m$) and Base Money Growth ($g_H$) in **genuine monthly percentage points** ($-5\%$ to $+25\%$). This visually confirms that while monthly inflation surged to $15.2\%$ at $t=0$, base money growth was flat at $1.8\%$, accelerating only with a lag at $t=+1$ ($13.8\%$) and $t=+2$ ($18.9\%$).
  - Shared horizontal event-time axis ($t \in [-6, +6]$ months) with a vertical dashed marker at $t=0$ (October 1972) and zero-line reference in Panel 2.
- **Deployment:** Synchronously compiled and saved to:
  - `paper/Version7/figures/fig02b_event_lockout_1972.pdf` (and `.png`)
  - `paper/Version7/figures/fig02c_event_lockout_1972.pdf` (and `.png`)
- **Prose Synchronization:** Figure 10 note in `sections/05_2_stylized_facts.tex` was updated to accurately describe the two-panel vertical structure and true percentage-point units.

### B. Table 4 Retention (`SAFE_NO_EDIT`)
- Evaluated Table 4 (`tables/tab04_tvar_estimates.tex`) in Section 5.4.
- Retained in the main text as a crucial evidential anchor displaying regime-dependent autoregressive coefficients ($a_1, c_1$), the threshold estimate ($\hat{\gamma} = -4.615\%$), and long-run multipliers. Demoting Table 4 to the appendix would compromise reader accessibility to the central TVAR findings.

### C. Appendix C Causal Graph Re-ordering
- In `paper/Version7/appendix/appendix_causal_pcmci_ee1.tex`:
  - **Elevated TikZ DAG** (`figures/tikz_pcmci_dag.tex`) to **Figure 14 (Primary Visual)**, representing the publication-grade directed acyclic graph with calibrated, non-falsification legend descriptions.
  - **Demoted Raw Python Graph** (`figures/pcmci_graph_canonical_ee1.pdf`) to **Figure 15 (Supplementary Diagnostic)**, properly contextualized as an uncurated algorithmic output for diagnostic transparency.

---

## 6. Section 6 Compression & Policy Discipline

Section 6 (`sections/06_discussion_conclusion.tex`) underwent substantial tightening to enhance analytical discipline:
1. **Subdued Headings:**
   - Section title: *"Discussion, Implications, and Conclusions"*
   - Subsections: *"Implications and Analytical Extensions"* and *"Concluding Remarks"*
2. **Compressed GIRF Re-reporting:**
   - Removed repetitive listings of monthly horizons (months 1, 2, 4, 6, 8, 12, 24).
   - Summarized dynamics concisely around cumulative totals ($3.550$ pp forward vs $6.537$ pp reverse) and stabilization timing (3–4 months), directing readers to Table D2 and Section 5.4 for detailed horizon matrices.
3. **Econometric vs Historical Separation:**
   - Strictly separated empirical econometric findings (reserve depletion and central bank insolvency disabling monetary stabilization) from historical structuralist policy blueprints (capital controls, export surrender, multi-tier exchange rates, state foreign-trade monopoly).
4. **Calibrated Causal Claims:**
   - Concluding statements focus on empirical limits and structural mechanisms rather than absolute theoretical falsification.

---

## 7. Rhetorical Cooling in Introduction & Section 2

High-theory drama, theatrical language, and aggressive framing were replaced with measured academic prose:
- *"fatal analytical concession"* $\rightarrow$ *"fundamental analytical compromise"*
- *"two deep epistemological failures"* $\rightarrow$ *"two major analytical limitations"*
- *"definitional foreclosure"* $\rightarrow$ *"methodological exclusion"*
- *"decisive theoretical operation"* $\rightarrow$ *"central analytical contribution"*
- *"fatal omission in orthodox accounts"* $\rightarrow$ *"critical gap in orthodox accounts"*
- *"epistemological straightjacket"* $\rightarrow$ *"restrictive analytical framing"*
- *"definitional violence"* $\rightarrow$ *"definitional restriction"*

---

## 8. Technical & Provenance Cleanups

- **Hypothesis Testing Formulations:**
  - In Section 5.2 and Section 5.3, rephrased unit-root testing assertions: replaced claims that tests "confirm" integration orders with standard econometric phrasing: *"ADF and KPSS tests fail to reject the unit-root null in levels and reject it in first differences, consistent with $I(1)$ integration."*
- **Administrative Provenance Claims:**
  - In Section 4, tempered the claim that administrative provenance "confirms the absence of measurement error" to: *"administrative records from the Central Bank provide documented provenance for the monthly series, establishing high accounting fidelity while acknowledging that historical administrative series remain subject to institutional reporting constraints."*
- **System Stability Assertions:**
  - In Appendix B, replaced claims that diagnostic tests "guarantee stability" with: *"confirms that the estimated system satisfies the empirical stability condition with all companion-matrix eigenvalues lying strictly within the unit circle."*

---

## 9. LaTeX Verification & Build Results

A clean 4-pass compilation was performed from `paper/Version7`:
```bash
pdflatex -interaction=nonstopmode Chapter3_Paper.tex
bibtex Chapter3_Paper
pdflatex -interaction=nonstopmode Chapter3_Paper.tex
pdflatex -interaction=nonstopmode Chapter3_Paper.tex
```

### Verification Metrics:
- **Exit Code:** `0` (Success)
- **Output File:** `paper/Version7/Chapter3_Paper.pdf`
- **Total Pages:** 92 pages
- **Fatal Errors:** `0`
- **Undefined References:** `0`
- **Undefined Citations:** `0`
- **Duplicate Labels:** `0`
- **Section 5.1 Verification:** `paper/Version7/sections/05_1_historical_background.tex` and Figure 7 (`paper/Version7/figures/sec51/fig07_wageshare_unionization.pdf`) remain completely untouched.

---

## 10. Researcher-Decision Audit Items

- **Total Open Decisions:** `0`
- Every item cataloged in `CHAPTER_CALIBRATION_LEDGER.md` was definitively resolved:
  - 64 items approved and executed (`YES`).
  - 1 item preserved (`SAFE_NO_EDIT`: Table 4 main text placement).
  - 0 items unresolved.

The manuscript is fully consistent, calibrated, and cleanly compiled.
