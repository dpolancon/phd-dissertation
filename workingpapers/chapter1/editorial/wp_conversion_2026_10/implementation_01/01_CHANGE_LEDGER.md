# 01 — Change Ledger: Implementation Session 01

This ledger records all atomic text and structural changes made during Implementation Session 01 across `sections/02_historical_trace.tex`, `sections/03_conceptual_framework.tex`, and `sections/04_econometric_replication.tex`.

---

## Change Mapping by Ledger ID

| Change ID | Target File | Section / Lines | Original Passage Anchor | Editorial Operation | Ledger ID Cross-Ref | Rationale & Result |
|:---|:---|:---|:---|:---|:---|:---|
| CHG-001 | `02_historical_trace.tex` | §2 opening (lines 4–5) | "This section traces... not as a neutral technical indicator, but as..." | REWRITE / VOICE | PR-009, PR-048 | Removed "not X but Y" rhetorical opening template. Converted royal "we" to single-author "I". Directly stated the four historical phases. |
| CHG-002 | `02_historical_trace.tex` | §2.1 (lines 9–11) | Great Depression and Hansen sequence | COMPRESS | PR-010 | Separated concrete institutional/survey facts from broad statecraft assertions. Preserved distinction between physical and economic capacity. |
| CHG-003 | `02_historical_trace.tex` | §2.1 (line 13) | McGraw-Hill / FRB narrative | CALIBRATE | PR-011, CL-007 | Separated private corporate survey role from FRB official surveillance without unevidenced "depoliticized" claims. |
| CHG-004 | `02_historical_trace.tex` | §2.2 (line 22) | Workplace mechanism paragraph | SPLIT / CALIBRATE | PR-012, CL-006 | Separated mainstream filtering critique from workplace mechanisms; labeled shop-floor conflict, line speeds, and reserve army as motivating institutional theory. |
| CHG-005 | `02_historical_trace.tex` | §2.3 (lines 29–33) | Sraffa-Kalecki debate | PRESERVE | KB-01 | Preserved exact definitions of normal utilization endogeneity vs cost-minimization anchor as established Keep Benchmark. |
| CHG-006 | `02_historical_trace.tex` | §2.4 (lines 38–40) | Ffrench-Davis & Shaikh introduction | COMPRESS / VOICE | PR-013, PR-048 | Focused Ffrench-Davis directly on cyclical asymmetry and hysteresis. Converted closing justification to single-author "I". Removed dissertation self-citation. |
| CHG-007 | `03_conceptual_framework.tex` | §3 opening (lines 4–6) | Four-step section roadmap & footnote 1 | COMPRESS / PURGE | PR-014, PR-048 | Streamlined travelogue into a concise statement of the latent capacity identification problem and Leontief baseline. Removed dissertation footnote (`Polanco2026`). |
| CHG-008 | `03_conceptual_framework.tex` | §3.1 (lines 18–19) | Shop-floor transmission paragraph | CALIBRATE | PR-015, CL-006 | Framed machine speeds, shift patterns, and labor effort as institutional mechanisms motivating the model, not estimated facts. |
| CHG-009 | `03_conceptual_framework.tex` | §3.1 (lines 43–44) | "direct functional dependency... rigid accounting identity..." | SIMPLIFY | PR-016 | Replaced dense nominalizations with direct explanation of how $\hat{\mu}_t$ inherits level and variance from $\hat{d}$. |
| CHG-010 | `03_conceptual_framework.tex` | §3.2 (line 47) | "structural integrity of the entire empirical operationalization..." | REWRITE | PR-017 | Simplified noun stack to state plainly how Shaikh's normal profit rate decomposition depends on the estimated coefficient $d$. |
| CHG-011 | `03_conceptual_framework.tex` | §3.2 (lines 49–53) | Shaikh-on-Shaikh accounting critique | DE-HYPE | PR-018 | Stated the self-application of Shaikh (1974) and Felipe (2005) cleanly, removing accusatory phrases ("mechanically mimics"). |
| CHG-012 | `03_conceptual_framework.tex` | §3.2 (lines 55–56) | Post-war exploitation periodization | REORDER / CALIBRATE | PR-019, CL-008, CL-009 | Led with descriptive numbers (Golden Age $e=0.319$, stagflation $e=0.256$, neoliberal era $e=0.286$). Calibrated causal profit-squeeze phrasing ("coincides with", "may average across"). |
| CHG-013 | `03_conceptual_framework.tex` | §3.2 (line 57) | GPIM discrepancy paragraph | PURGE CLAIM / CALIBRATE | PR-020, CL-010, CL-011, CL-012 | Deleted unsupported claim that GPIM/BEA discrepancy is "stationary". Labeled maintenance/running times as unmeasured hypotheses. Avoided unconditional signing of measurement error bias. |
| CHG-014 | `03_conceptual_framework.tex` | §3.3 (lines 84–87) | Accumulation regime exposition | COMPRESS | PR-021 | Compressed mathematical derivations duplicated in Appendix A. Maintained Table 1 and phase intuition. |
| CHG-015 | `03_conceptual_framework.tex` | §3.3 (lines 87–93) | Stylized numerical example ($\theta=0.8, 1.2$) | COMPRESS | PR-022 | Compressed walkthrough of numbers already encoded in Figure 1 and Appendix A. |
| CHG-016 | `03_conceptual_framework.tex` | §3.4 (lines 109–112) | Basu viability & double-misspecification | MERGE | PR-023, CL-009 | Consolidated three repetitive passages into one theoretical paragraph on Basu's (2022) viability condition and one econometric paragraph on compound bias. |
| CHG-017 | `03_conceptual_framework.tex` | §3.4 (lines 114–115) | Sraffa-Kalecki debate preview | CALIBRATE | PR-024, CL-018–020 | Reframed debate as theoretical motivation regarding investment endogeneity vs autonomy rather than premature empirical adjudication. |
| CHG-018 | `03_conceptual_framework.tex` | §3 end (lines 115–116) | S0/S1/S2 design roadmap | DELETE | PR-025 | Deleted redundant roadmap; §4.1 owns the staged design overview. |
| CHG-019 | `04_econometric_replication.tex` | §4.1–§4.3 (lines 6–260) | Econometric design & data construction | VOICE / CALIBRATE | PR-029, PR-048, CL-027, CL-028, CL-029 | Converted royal "we" to single-author "I". Calibrated raw trend narrative (CL-029), BEA chain weights (CL-027), and gross stock justification (CL-028). |
| CHG-020 | `04_econometric_replication.tex` | §4.3 (lines 263–264) | `\subsubsection{Cross-Stage Synthesis}` | DELETE | PR-032 | Removed empty subheading immediately preceding §4.4. |
| CHG-021 | `04_econometric_replication.tex` | §4.4 (lines 266–274) | S0 baseline reconstruction paragraphs | MERGE / DE-HYPE | PR-033, PR-034, KB-04 | Merged duplicate consecutive paragraphs into one clean result-first paragraph. Removed "highly significant" and "cointegrates robustly", reporting exact statistics ($F=5.250, p=0.023$). |
| CHG-022 | `04_econometric_replication.tex` | §4.5 (lines 311–313) | S1 opening & focal comparison | CALIBRATE / VOICE | PR-035, KB-05 | Replaced prosecutorial phrasing ("shatters the illusion") with measured sensitivity language. Preserved ARDL(3,3) vs ARDL(1,2) comparison. |
| CHG-023 | `04_econometric_replication.tex` | §4.5 (lines 406–415) | Physical constraints & counterfactual | CALIBRATE | PR-035, CL-014, CL-030 | Replaced "violates basic physical constraints" and "physical absurdity" with measured economic plausibility arguments. |
| CHG-024 | `04_econometric_replication.tex` | §4.5 (line 420) | Transition to Stage S2 | VOICE | PR-048 | Converted closing transition to single-author "I". Stopped immediately before line 422 (§4.6 S2 VECM Replication). |

---

## Quantitative Text Impact Summary
- **Section 2 (`02_historical_trace.tex`):** Reduced from 14,059 bytes to 10,979 bytes (~22% reduction in repetitive clauses while preserving all citations and KB-01).
- **Section 3 (`03_conceptual_framework.tex`):** Reduced from 29,476 bytes to 16,089 bytes (~45% reduction in redundant derivations and repeated passages while preserving all equations and figures).
- **Section 4 §§4.1–4.5 (`04_econometric_replication.tex`):** Cleaned ~12,000 bytes of duplicated text, empty headings, and hyperbolic adjectives.
- **Compilation verification:** Clean build (`working_paper.pdf`, 52 pages, 0 undefined citations, exit code 0).
