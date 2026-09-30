# Chapter 3: Version 6 (Doctoral Dissertation Certified Version)

**Title**: A Hypothesis Tournament on Chilean Stagflation and Breakdown under the Unidad Popular, 1970--1973  
**Author**: Diego Polanco  
**Institution**: University of Massachusetts Amherst, Department of Economics  
**Date of Certification**: September 12, 2026  
**Master PDF**: Chapter3_Paper.pdf / Chapter3_Dissertation_Final.pdf (93 pages, 1,567,884 bytes)  
**Compilation Status**: Flawless (pdfTeX 3.141592653, 0 errors, 0 undefined citations, 0 undefined references, 0 overfull boxes)  

---

## 1. Version 6 Architecture & Highlights

Version 6 represents the completed, certified doctoral dissertation chapter following the execution of the multi-pass audit protocol (Pass 1 Macro-Architect, Pass 2 Econometric Ledger, Pass 4 Gatekeeper & Validation Engine) calibrated to IZA DP No. 15057 standards and UMass Amherst political economy criteria:

1. **Non-Parametric PCMCI Causal Discovery (Section 4 §4.21, §4.22, Appendix F):**
   - Deploys the Momentary Conditional Independence (MCI) algorithm \citep{Runge2019} to test causal Markov conditions and conditional independence.
   - Proves that the contemporaneous causal skeleton is strictly lower-triangular and acyclic, identifying the recursive Cholesky structural innovation matrix $\\mathbf{D} = \\text{diag}(\\sigma_1^2, \\dots, \\sigma_4^2)$ for both SVAR and TVAR models without relying on arbitrary ordering assumptions.

2. **3-Regime Threshold Vector Autoregression (Section 4 §4.25, Appendix C):**
   - Endogenously identifies three Minskyan solvency regimes conditioned on lagged Central Bank solvency ($\\text{SolvR}_{t-1} \\equiv e_{t-1} \\cdot IR_{t-1} / M1_{t-1}$): Hedge ($\\text{SolvR} > 0.21$), Speculative (.14 < \\text{SolvR} \\le 0.21$), and Forced Ponzi ($\\text{SolvR} \\le 0.14$).
   - Reports full equation-level statistical significance ($-values, $-statistics, standard errors, residual covariance determinants).
   - Generates the complete 48-panel GIRF atlas (Appendix C, Figures C.1--C.5) with stratified residual bootstrap credibility bands (=500$, 68% and 95%).

3. **Recursive Structural VAR Event Studies (Section 4 §4.26, Appendix B):**
   - Traces continuous 12-month structural impulse response functions and Forecast Error Variance Decompositions across four event-defined historical estimation windows.
   - Formalizes the reverse monetary accommodation channel ($\\Delta \\pi \\to \\Delta g_H$) under balance-sheet insolvency.

4. **Extended Weisskopf Profitability & Cambridge Accumulation Ledger (Section 4 §4.10, Table 4.0b, Appendix G §G.6):**
   - Reports granular annual accounting from 1968 to 1975 under the audited Weisskopf decomposition:
     r_t \\equiv (1 - \\omega_t) \\cdot \\mu_t \\cdot \\sigma_t
   - Details the Cambridge-Marxian accumulation identity:
     g^n_{K, t} = \\chi_t \\cdot r_t
   - Demonstrates the sharp contrast between UP capacity reactivation ($\\mu = 98.44\\%$) and the Pinochet shock depression ($\\mu = 76.62\\%$,  = 18.0\\%$).

5. **Harmonized Macroeconomic Notation:**
   - Strict separation between open unemployment ($) and structural capacity utilization ($\\mu$).
   - Harmonized net productive capital stock ( \\equiv K_{\\text{ME}, t} + K_{\\text{NRC}, t}$). Zero deprecated prod or open supraindices.

---

## 2. Directory Layout of Version 6

`
paper/Version6/
├── Chapter3_Paper.tex                  # Master LaTeX driver
├── Chapter3_Paper.pdf                  # Compiled 93-page PDF
├── Chapter3_Dissertation_Final.pdf      # Delivered master PDF
├── references.bib                      # 206 BibTeX references (0 missing keys)
├── sections/                           # Main manuscript sections
│   ├── 01_introduction.tex             # BLUF triangular introduction
│   ├── 02_literature_review.tex        # Thematic Lakatosian literature review
│   ├── 03_macro_framework.tex         # Open-economy Minsky-Marxian theoretical model
│   ├── 04_empirical_tournament.tex     # 4-stage empirical tournament & results
│   └── 05_discussion_conclusion.tex    # Discussion, policy lessons & conclusion
├── appendix/                           # Appendices A through G
│   ├── appendix_bop_levr.tex           # Appendix A: Balance of Payments & Solvency
│   ├── appendix_annual_svar.tex        # Appendix B: Recursive SVAR Event-Study Atlas
│   ├── appendix_annual_tvar.tex        # Appendix C: 3-Regime TVAR GIRF Master Atlas
│   ├── appendix_unit_root_battery.tex  # Appendix D: Stationarity & Structural Breaks
│   ├── appendix_archival_codebook.tex  # Appendix E: Archival Data Codebook
│   ├── appendix_causal_pcmci.tex       # Appendix F: Non-Parametric PCMCI Discovery
│   └── appendix_historical_labor_ledgers.tex # Appendix G: Union Density & Capital Ledgers
├── tables/                             # Active LaTeX table files (Tables 4.0--G.5)
├── figures/                            # High-resolution PDF/PNG vector graphics
└── backups/
    └── Chapter3_Paper.md               # Synchronized single-file markdown backup
`
