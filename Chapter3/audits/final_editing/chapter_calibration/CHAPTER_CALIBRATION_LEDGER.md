# Chapter-Wide Calibration Master Ledger

**Date:** 2026-09-29  
**Repository:** `c:\ReposGitHub\Chapter3_RPEUP`  
**Governing Launcher:** `chapter3_vault/25_FinalEditing/NEXT_PASS_CHAPTER_CALIBRATION_LAUNCHER.md`  
**Scope:** Whole chapter outside Section 5.1 (`05_1_historical_background.tex` is strictly locked).

---

## 1. Summary of Items by Category

| Category | Total Items | Approved (`YES`) | Preserved (`NO` / `SAFE_NO_EDIT`) | Open Decisions |
| :--- | :---: | :---: | :---: | :---: |
| 1. Empirical-Language Consistency & State Nomenclature | 12 | 12 | 0 | 0 |
| 2. Boundary-Family Lexical Audit | 15 | 15 | 0 | 0 |
| 3. Branded Secondary Jargon Audit | 14 | 14 | 0 | 0 |
| 4. Visual & Table Consolidation | 5 | 4 | 1 | 0 |
| 5. Section 6 Compression & Policy Discipline | 7 | 7 | 0 | 0 |
| 6. Rhetorical Cooling (Intro & Lit Review) | 7 | 7 | 0 | 0 |
| 7. Technical & Provenance Cleanup | 5 | 5 | 0 | 0 |
| **Total** | **65** | **64** | **1** | **0** |

---

## 2. Granular Calibration Ledger

| ID | Category | Target File | Line(s) | Current Formulation | Calibrated Text / Proposed Action | Rationale | Execute? |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **EMP-01** | Empirical Consistency | `sections/06_discussion_conclusion.tex` | 36--44 | "predictive causality runs unidirectionally from inflation to base-money growth... rather than monetarist monetary dominance" | "predictive interaction operates bidirectionally across the full sample, but with stronger and more persistent reverse accommodation running from inflation to base money growth ($p < 0.001$, cumulative GIRF $6.537$ pp) than forward transmission ($p = 0.038$, cumulative GIRF $3.550$ pp), in contrast to unidirectional monetarist monetary dominance" | Harmonize Section 6 summary with locked empirical architecture of bidirectional interaction with asymmetric reverse dominance. | YES |
| **EMP-02** | Empirical Consistency | `sections/06_discussion_conclusion.tex` | 134--136 | "Granger causality tests show that inflation and external depletion drive monetary expansion rather than the reverse" | "Granger causality tests reveal bidirectional predictive interaction with stronger reverse accommodation, where inflation and external depletion drive monetary expansion more persistently than money growth predicts prices" | Reconcile with locked empirical architecture. | YES |
| **EMP-03** | Empirical Consistency | `Chapter3_Paper.tex` (Abstract) | 127--133 | "crisis regime" / "high-inflation regime" | "adverse solvency-growth state ($\Delta s_{t-1} \le -4.615\%$)" / "non-adverse solvency-growth state" | Standardize state nomenclature to lagged solvency growth gap. | YES |
| **EMP-04** | Empirical Consistency | `sections/01_introduction.tex` | 27--35 | "unidirectional monetarist causality is inverted" | "predictive interaction operates bidirectionally, with reverse accommodation of cost pressures running more persistently from inflation to base money growth than forward monetary transmission" | Align introduction with empirical findings. | YES |
| **EMP-05** | Empirical Consistency | `sections/01_introduction.tex` | 134--140 | "regime of central bank insolvency" / "crisis regime" | "adverse solvency-growth state ($\Delta s_{t-1} \le -4.615\%$)" | Standardize state nomenclature. | YES |
| **EMP-06** | Empirical Consistency | `sections/05_historical_empirical_results.tex` | 130--138 | "rejecting monetarist exogeneity in favor of unidirectional cost accommodation" | "demonstrating bidirectional predictive interaction with dominant reverse accommodation" | Harmonize System 1 text with empirical results. | YES |
| **EMP-07** | Empirical Consistency | `sections/05_historical_empirical_results.tex` | 270--276 | "unidirectional predictive chain" | "joint predictive chain with pronounced reverse feedback" | Maintain accuracy regarding bi-directional lag dynamics. | YES |
| **EMP-08** | Empirical Consistency | `sections/05_4_threshold_var.tex` | 266--272 | "once foreign exchange reserves are depleted below the $-4.615\%$ threshold" | "in the adverse solvency-growth state ($\Delta s_{t-1} \le -4.615\%$, reflecting conditions of central bank insolvency)" | Eliminate conflation between stock reserve level and flow growth gap $\Delta s_{t-1}$. | YES |
| **EMP-09** | Empirical Consistency | `sections/06_discussion_conclusion.tex` | 24--28 | "once the Central Bank Solvency Ratio falls below $0.5898$" | "in the adverse solvency-growth state ($\Delta s_{t-1} \le -4.615\%$)" | Correct state definition conflation in Section 6. | YES |
| **EMP-10** | Empirical Consistency | `figures/tikz_pcmci_dag.tex` | 167 | "Refuted Null: Zero Direct Link ($q > 0.10$)" | "Not Retained under Conditioning ($q > 0.10$, No Direct Link)" | Eliminate absolute falsification wording in TikZ node. | YES |
| **EMP-11** | Empirical Consistency | `figures/tikz_pcmci_dag.tex` | 188 | "Orthodox Null Refuted ($q > 0.10$, Zero Link)" | "Not Retained under Conditioning ($q > 0.10$, No Direct Link)" | Eliminate absolute falsification wording in TikZ legend. | YES |
| **EMP-12** | Empirical Consistency | `appendix/appendix_tvar_girf_atlas.tex` | 148--156 | Note on simulation grid vs point-wise median | Add explanatory note distinguishing Table D2 Monte Carlo full-grid cumulative evaluations (3.898 pp / 6.996 pp) from Section 5.4 point-wise median cumulative trajectories (3.550 pp / 6.537 pp) | Explicitly document simulation metric consistency as mandated by launcher. | YES |
| **BND-01** | Boundary Audit | `sections/05_2_stylized_facts.tex` | 42 | Subsection title: "Material Bounds and Structural Bottlenecks" | "Structural Bottlenecks and Physical Constraints" | Remove rhetorical boundary metaphor in heading (Category C). | YES |
| **BND-02** | Boundary Audit | `sections/05_2_stylized_facts.tex` | 51 | "operated within rigid material bounds" | "operated within severe physical and structural constraints" | Replace metaphorical boundary term (Category C). | YES |
| **BND-03** | Boundary Audit | `sections/02_literature_review.tex` | 43 | "within the boundaries of structuralist macroeconomics" | "within structuralist macroeconomics" | Clean redundant boundary phrasing (Category C). | YES |
| **BND-04** | Boundary Audit | `sections/02_literature_review.tex` | 158 | "policing the boundaries between market and state" | "regulating the division between market and state" | Eliminate metaphorical boundary term (Category C). | YES |
| **BND-05** | Boundary Audit | `sections/05_historical_empirical_results.tex` | 84 | "bounded lag search" | "lag-length selection over $p \in \{1,\dots,12\}$" | Replace informal boundary phrasing with precise technical specification (Category A). | YES |
| **BND-06** | Boundary Audit | `sections/05_4_threshold_var.tex` | 76 | "bounded within the grid $[0.15, 0.85]$" | "restricted to the trimming grid $[\gamma_{0.15}, \gamma_{0.85}]$" | Precise econometric trimming parameter phrasing (Category A). | YES |
| **BND-07** | Boundary Audit | `sections/05_4_threshold_var.tex` | 312 | "bound by solvency constraints" | "constrained by solvency conditions" | Replace informal boundary term (Category B). | YES |
| **BND-08** | Boundary Audit | `sections/06_discussion_conclusion.tex` | 89 | "boundary conditions of monetary accommodation" | "structural limits and institutional conditions of monetary accommodation" | Clarify substantive institutional meaning (Category B). | YES |
| **BND-09** | Boundary Audit | `appendix/appendix_linear_var_diagnostics.tex` | 45 | "within stable boundaries" | "within the unit circle" | Replace vague boundary metaphor with exact mathematical stability condition (Category A). | YES |
| **BND-10** | Boundary Audit | `appendix/appendix_bop_levr.tex` | 32 | "prior boundaries of reserves" | "pre-shock baseline reserve levels" | Replace awkward boundary formulation (Category C). | YES |
| **BND-11** | Boundary Audit | `sections/01_introduction.tex` | 48 | "constitutive boundaries of peripheral central banking" | "institutional limits of peripheral central banking" | De-escalate theoretical boundary phrasing (Category C). | YES |
| **BND-12** | Boundary Audit | `sections/02_literature_review.tex` | 89 | "constitutive limit" | "structural constraint" | Cool high-theory boundary vocabulary (Category C). | YES |
| **BND-13** | Boundary Audit | `sections/03_macro_framework.tex` | 112 | "balance-sheet boundary" | "balance-sheet constraint" | Replace metaphorical boundary term with standard accounting terminology (Category A). | YES |
| **BND-14** | Boundary Audit | `sections/04_data_architecture.tex` | 64 | "temporal boundaries of the series" | "sample period of the monthly series" | Replace boundary term with standard econometrics vocabulary (Category A). | YES |
| **BND-15** | Boundary Audit | `sections/06_discussion_conclusion.tex` | 178 | "evidential boundary" | "empirical scope and evidentiary limits" | Clarify academic register (Category B). | YES |
| **JRG-01** | Jargon Audit | `sections/03_macro_framework.tex` | Title / 1 | Section 3 title: "A Macroeconomic Architecture of Balance-Sheet Insolvency" | "A Structuralist Framework of Balance-Sheet Insolvency" | Replace architectural metaphor in section title. | YES |
| **JRG-02** | Jargon Audit | `sections/04_data_architecture.tex` | Title / 1 | Section 4 title: "Data Architecture and Empirical Strategy" | "Data and Empirical Strategy" | Simplify section title to standard academic register. | YES |
| **JRG-03** | Jargon Audit | `sections/05_historical_empirical_results.tex` | Title / 1 | Subsection 5.3 title: "Granger-Causality Tournament" | "Granger-Causality Tests Across Modular Systems" | Eliminate competitive "tournament" framing in subsection title. | YES |
| **JRG-04** | Jargon Audit | `sections/05_2_stylized_facts.tex` | 168 | Subsection title: "Synthesis and Econometric Hand-Off" | "Descriptive Synthesis and Empirical Transition" | Replace programmatic "hand-off" jargon in subsection heading. | YES |
| **JRG-05** | Jargon Audit | `sections/05_4_threshold_var.tex` | 215 | "acting as a shield against external shocks" | "buffering external balance-of-payments shocks" | Replace mechanical "shield" metaphor with structural balance-of-payments phrasing. | YES |
| **JRG-06** | Jargon Audit | `sections/05_4_threshold_var.tex` | 248 | "falling into a solvency trap" | "entering an adverse regime of chronic balance-sheet insolvency" | Replace stylized "trap" jargon with exact institutional regime description. | YES |
| **JRG-07** | Jargon Audit | `appendix/appendix_tvar_girf_atlas.tex` | Title / 1 | Appendix D title: "Threshold VAR Generalized Impulse Response Atlas" | "Threshold VAR Generalized Impulse Response Functions" | Eliminate cartographic "atlas" branding in appendix title. | YES |
| **JRG-08** | Jargon Audit | `appendix/appendix_linear_var_diagnostics.tex` | 62 | "served as an identification gate" | "served as a specification criterion" | Replace "gate" jargon with conventional econometric terminology. | YES |
| **JRG-09** | Jargon Audit | `appendix/appendix_linear_var_diagnostics.tex` | 114 | "conveyor belt of cost-push pressures" | "mechanism transmitting cost-push pressures" | Eliminate mechanical "conveyor belt" metaphor. | YES |
| **JRG-10** | Jargon Audit | `sections/01_introduction.tex` | 82 | "analytical architecture" | "conceptual framework" | Cool corporate/software architecture metaphor. | YES |
| **JRG-11** | Jargon Audit | `sections/02_literature_review.tex` | 110 | "competitive tournament of hypotheses" | "systematic comparative evaluation of competing hypotheses" | De-escalate "tournament" jargon in literature review. | YES |
| **JRG-12** | Jargon Audit | `sections/04_data_architecture.tex` | 18 | "data architecture connects historical records" | "data compilation connects historical records" | Replace architecture metaphor in data section prose. | YES |
| **JRG-13** | Jargon Audit | `sections/05_2_stylized_facts.tex` | 180 | "econometric hand-off to the TVAR" | "transition to dynamic econometric modeling" | Replace colloquial "hand-off" in section prose. | YES |
| **JRG-14** | Jargon Audit | `sections/06_discussion_conclusion.tex` | 142 | "institutional horizon" | "institutional perspective" | Replace stylized "horizon" metaphor. | YES |
| **VIS-01** | Visual Consolidation | `figures/fig02b_event_lockout_1972.pdf` / `.png` | File level | Dual-axis design with $\times 4$ scaling of inflation and money growth | Deploy two-panel vertical stack: Panel 1 = Physical Output Indices (Manufacturing vs Mining, Sep 1972 = 100); Panel 2 = Monthly Inflation and Base Money Growth in genuine percentage points ($-5\%$ to $+25\%$). Shared x-axis, dashed line at $t=0$. | Eliminate arbitrary dual-axis visual scaling; present true units. Highest priority visual repair. | YES |
| **VIS-02** | Visual Consolidation | `sections/05_2_stylized_facts.tex` | 158--162 | Figure 10 note describing right axis $\times 4$ scaling | Update note to describe the two-panel vertical layout and genuine percentage points without $\times 4$ scaling. | Match figure note to newly deployed vertical figure layout. | YES |
| **VIS-03** | Visual Consolidation | `tables/tab04_tvar_estimates.tex` | Main text / table | Table 4 (TVAR coefficient estimates) evaluated for potential appendix demotion | Retain Table 4 in Section 5.4 main text as readable evidential anchor for regime-dependent coefficients ($a_1, c_1, \gamma, \text{LR}$). | Maintain evidential transparency for primary econometric contribution; avoid burying core results in appendix. | NO (`SAFE_NO_EDIT`) |
| **VIS-04** | Visual Consolidation | `appendix/appendix_causal_pcmci_ee1.tex` | 38--75 | Figure 14 (raw Python network graph) precedes Figure 15 (publication TikZ DAG) | Elevate TikZ DAG (`figures/tikz_pcmci_dag.tex`) to principal visual (Panel A / Figure 14); demote raw Python plot to supplementary diagnostic (Panel B / Figure 15). | Establish publication-grade TikZ visual as primary reference and raw Python plot as secondary diagnostic. | YES |
| **VIS-05** | Visual Consolidation | `figures/fig02c_event_lockout_1972.pdf` / `.png` | File level | Duplicate of `fig02b` | Synchronize `fig02c` with updated `fig02b` file to prevent stale graphic usage. | Maintain file consistency across repository copies. | YES |
| **POL-01** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | Title / 1 | Section 6 title: "Discussion, Policy Implications, and Conclusions" | "Discussion, Implications, and Conclusions" | Subdue policy branding in main section title. | YES |
| **POL-02** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | 46 | Subsection title: "Theoretical and Policy Implications" | "Implications and Analytical Extensions" | Quiet subsection heading. | YES |
| **POL-03** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | 50--75 | Dense month-by-month GIRF re-reporting (listing months 1, 2, 4, 6, 8, 12, 24 with redundant decimals) | Compress into substantive prose focusing on cumulative totals ($3.550$ pp forward vs $6.537$ pp reverse) and 3--4 month stabilization dynamics; refer reader to Table D2 and Section 5.4 for detailed horizon tables. | Eliminate mechanical empirical re-reporting in discussion section. | YES |
| **POL-04** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | 95--120 | Mixing empirical findings on reserve depletion with speculative structuralist policy blueprints (capital controls, export surrender, forex budgeting) | Structure text into clear separation: (1) empirical finding: reserve collapse disabled stabilization capacity; (2) historical-structuralist institutional context: external sector management instruments under UP. | Separate empirical econometric findings from historical-institutional policy instruments. | YES |
| **POL-05** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | 150 | Subsection title: "Concluding Remarks and Research Horizon" | "Concluding Remarks" | Remove stylized "Research Horizon" wording. | YES |
| **POL-06** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | 165--172 | "definitive refutation of monetary dominance" | "clear empirical counter-evidence to unidirectional monetary dominance" | Calibrate causal language to evidentiary standards. | YES |
| **POL-07** | Section 6 Discipline | `sections/06_discussion_conclusion.tex` | 185--195 | Concluding speculative policy recommendations | Ground conclusion in econometric findings on endogenous monetary accommodation and foreign exchange constraints. | Maintain academic discipline in final paragraphs. | YES |
| **RHT-01** | Rhetorical Cooling | `sections/01_introduction.tex` | 42 | "fatal analytical concession" | "fundamental analytical compromise" | Tone down dramatic rhetoric. | YES |
| **RHT-02** | Rhetorical Cooling | `sections/01_introduction.tex` | 68 | "two deep epistemological failures" | "two major analytical limitations" | Replace theatrical epistemological accusation with sober academic critique. | YES |
| **RHT-03** | Rhetorical Cooling | `sections/01_introduction.tex` | 95 | "definitional foreclosure" | "methodological exclusion" | De-escalate high-theory jargon. | YES |
| **RHT-04** | Rhetorical Cooling | `sections/02_literature_review.tex` | 38 | "decisive theoretical operation" | "central analytical contribution" | Sober academic phrasing. | YES |
| **RHT-05** | Rhetorical Cooling | `sections/02_literature_review.tex` | 74 | "fatal omission in orthodox accounts" | "critical gap in orthodox accounts" | Remove dramatic rhetoric. | YES |
| **RHT-06** | Rhetorical Cooling | `sections/02_literature_review.tex` | 125 | "epistemological straightjacket" | "restrictive analytical framing" | Cool dramatic metaphor. | YES |
| **RHT-07** | Rhetorical Cooling | `sections/02_literature_review.tex` | 182 | "definitional violence" | "definitional restriction" | Cool theatrical vocabulary. | YES |
| **TEC-01** | Technical Cleanup | `sections/05_historical_empirical_results.tex` | 48--56 | "ADF and KPSS tests confirm that the series is I(1)" | "ADF and KPSS tests fail to reject the unit-root null in levels and reject it in first differences, consistent with $I(1)$ integration" | Correct statistical hypothesis testing phrasing. | YES |
| **TEC-02** | Technical Cleanup | `sections/05_historical_empirical_results.tex` | 62--68 | "confirms stationarity" | "is consistent with stationarity" / "rejects the unit-root null" | Proper econometric terminology for stationary series. | YES |
| **TEC-03** | Technical Cleanup | `sections/04_data_architecture.tex` | 92--98 | "administrative provenance confirms the absence of measurement error" | "administrative records from the Central Bank provide documented provenance for the monthly series" | Remove unwarranted claim that administrative provenance "confirms absence of measurement error". | YES |
| **TEC-04** | Technical Cleanup | `appendix/appendix_linear_var_diagnostics.tex` | 82 | "guarantees the stability of the system" | "confirms that the estimated system satisfies the empirical stability condition" | Accurate econometric wording. | YES |
| **TEC-05** | Technical Cleanup | `appendix/appendix_bop_levr.tex` | 65 | "confirms the structural break" | "provides evidence of a structural break" | Measured econometric claim. | YES |

---

## 3. Preconditions & Invariant Properties

1. **Section 5.1 Strict Lock:** `paper/Version7/sections/05_1_historical_background.tex` is completely untouched. Its citations (`Cardoso1972`, `Vidal2015`, `Vidal2019`, `Kay1980`, etc.), historical text, and Figure 7 (`fig:sec51_wageshare_unionization`) remain 100% invariant.
2. **Empirical Precision:** All coefficient values, thresholds ($\Delta s_{t-1} = -4.615\%$), sample windows ($T=104$, $T=60$, $T=44$), and GIRF cumulative values ($3.550$ pp vs $6.537$ pp) are strictly preserved.
3. **No Git Commit/Push:** Changes are applied exclusively to working files in the repository.
