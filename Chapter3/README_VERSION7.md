# Chapter 3: Version 7 (Architecture & Calibration Baseline)

**Title**: Re-visiting the Political Economy of the Rise and Fall of the Unidad Popular: Towards a Global Political Economy Approach  
**Author**: Diego Polanco  
**Institution**: University of Massachusetts Amherst, Department of Economics  
**Date**: September 2026  
**Master Document**: `paper/Version7/Chapter3_Paper.tex`  

---

## 1. Version 7 Architectural Blueprint

Version 7 establishes the structural redesign of Chapter 3, transitioning the empirical presentation toward the benchmark established in Chapter 2, calibrated under the directives of **`/advisor-reviewer`** (Michael Ash) and **`/umass-applied-econometrics`**:

1. **Standalone Data Architecture (Section 4):**
   - In accordance with IZA guidelines and UMass applied econometrics standards, Data Architecture, Archival Sources, and Variable Construction is promoted to an independent, standalone **Section 4** (`sections/04_data_architecture.tex`).
   - Occupies a parsimonious 2-page footprint (~600 words), establishing the provenance of both the high-frequency monthly panel ($N=250$, 1960:01--1980:12) and the annual secular dataset ($T=91$, 1920--2010) before entering the empirical core.
   - **Real Price Disparity ($\Omega$) is completely obliterated**, focusing empirical trade-account pressure strictly on the Prebisch Capacity to Import ($M^{\text{cap}}_t$), the Real Structural Imbalance Ratio ($\Theta_t$), and Central Bank Solvency ($\text{SolvR}_t$).

2. **Empirical Core (Section 5):**
   - Streamlined into four focused components:
     * **§5.1 Historical Background: The Rise of the Unidad Popular** (Law 7,200, CORFO, foreign-exchange budgeting, and the exhaustion of the inward-looking model).
     * **§5.2 Stylized Facts of Peripheral Accumulation, Distribution, and External Constraints** (Regime summary statistics and time-series dynamics).
     * **§5.3 Directional Precedence and the Granger Causality Tournament** (Toda--Yamamoto levels-augmented VAR framework, stationarity pre-tests, 6 sequential panels, and reverse accommodation findings).
     * **§5.4 Non-Linear Transmission: Threshold VAR and Dynamic Solvency Regimes** (2-regime TVAR, CLS grid search over $\text{SolvR}_{t-1}$, Hansen bootstrap SupLR test, parameter matrices, and dynamic GIRFs).
   - Initialized as a minimal structural skeleton with clear outline headers and `% TODO:` guidance blocks for targeted modular drafting.

3. **Streamlined Empirical Scope:**
   - Focuses strictly on stylized facts, Granger causality testing, and Threshold VAR.
   - Recursive SVAR event studies (`appendix_annual_svar.tex`) are excluded from Version 7.
   - Full-system PCMCI causal discovery is retained in `appendix/appendix_causal_pcmci.tex` as a methodological robustness check supporting the Toda--Yamamoto structural ordering.

4. **Section 6 (Discussion & Conclusion):**
   - Preserves the political economy synthesis, MMT critique in peripheral open economies, and structural implications.

---

## 2. Directory Layout of Version 7

```text
paper/Version7/
├── Chapter3_Paper.tex                     # Master LaTeX driver
├── references.bib                         # Full BibTeX references
├── sections/                              # Main manuscript sections
│   ├── 01_introduction.tex                # Introduction
│   ├── 02_literature_review.tex           # Literature review
│   ├── 03_macro_framework.tex             # Macroeconomic analytical model
│   ├── 04_data_architecture.tex           # Standalone data architecture (parsimonious 2-page report)
│   ├── 05_historical_empirical_results.tex # Minimal structural skeleton (Historical, Stylized Facts, Granger, TVAR)
│   └── 06_discussion_conclusion.tex       # Discussion and conclusion
├── appendix/                              # Appendices A through F
│   ├── appendix_bop_levr.tex              # Appendix A: Balance of Payments & Solvency
│   ├── appendix_annual_tvar.tex           # Appendix B: TVAR GIRF Atlas
│   ├── appendix_unit_root_battery.tex     # Appendix C: Stationarity & Structural Breaks
│   ├── appendix_archival_codebook.tex     # Appendix D: Archival Ledger Codebook
│   ├── appendix_causal_pcmci.tex          # Appendix E: PCMCI Causal Discovery Robustness
│   └── appendix_historical_labor_ledgers.tex # Appendix F: Historical Labor & Wage Ledgers
├── figures/                               # Visual figure assets
└── tables/                                # Tabular assets
```
