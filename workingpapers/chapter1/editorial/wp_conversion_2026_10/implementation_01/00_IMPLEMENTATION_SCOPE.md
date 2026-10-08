# 00 — Implementation Scope: Session 01

## Session Overview
- **Session ID:** `implementation_01`
- **Manuscript:** *Productive Capacity as an Institutional Settlement: A Critical Replication and Distributional Extension of Shaikh’s Capacity Utilization Measure*
- **Author:** Diego Polanco
- **Destination:** University of Massachusetts Amherst Economics Working Paper Series / ScholarWorks
- **Editorial Mandate:** Controlled editorial implementation converting Chapter 1 dissertation material into a standalone working paper.
- **Repository Constraints:** STRICT NO COMMIT, NO PUSH, NO MERGE, NO BRANCH CREATION.

---

## 1. Scope Executed in This Session

### Pass B — Section 2 Refactoring (`sections/02_historical_trace.tex`)
- Refactored entire section to single-author voice ("I").
- Removed "not X but Y" rhetorical opening template (PR-009).
- Compressed Great Depression and Hansen post-war statecraft sequence, separating concrete survey/institutional facts from broad interpretive claims (PR-010).
- Calibrated McGraw-Hill and Federal Reserve Board narrative; distinguished private forecasting infrastructure from official policy surveillance (PR-011, CL-007).
- Separated plant-level workplace mechanisms from the mainstream filtering critique, framing shop-floor conflict as a motivating institutional interpretation (PR-012, CL-006).
- Compressed the Latin American neo-structuralist comparison (Ffrench-Davis) to focus directly on cyclical asymmetry and hysteresis (PR-013).
- Preserved Sraffa-Kalecki debate framing as an exact Keep Benchmark (KB-01).

### Pass C — Section 3 Refactoring (`sections/03_conceptual_framework.tex`)
- Streamlined opening roadmap from a 4-step travelogue into a concise paragraph introducing the latent capacity ceiling and Leontief baseline (PR-014).
- Calibrated shop-floor transmission mechanisms (machine speeds, shifts, labor effort) as motivating institutional theory rather than estimated facts (PR-015, CL-006).
- Simplified heavy nominalizations and abstract noun stacks regarding parameter dependency and Shaikh's profit decomposition (PR-016, PR-017).
- Cleaned up the self-application of Shaikh's (1974) and Felipe's (2005) accounting identity critique without accusatory rhetoric (PR-018).
- Led with descriptive post-war historical averages (Golden Age, stagflation, neoliberal era) and calibrated profit-squeeze causal language (PR-019, CL-008, CL-009).
- Deleted unsupported assertion that GPIM/BEA discrepancy is "stationary" (CL-010); separated deferred maintenance and speed-ups as unmeasured potential channels (CL-011); qualified measurement error attenuation without unconditional signing (CL-012, PR-020).
- Compressed accumulation regime derivations that duplicated Appendix A (PR-021).
- Compressed stylized numerical walkthrough ($\theta=0.8$ vs $\theta=1.2$), referencing Figure 1 and Appendix A (PR-022).
- Merged repetitive trend/distribution passages into one theoretical paragraph on Basu's (2022) capitalist viability condition and one econometric paragraph on compound misspecification (PR-023, CL-009).
- Calibrated Sraffa-Kalecki debate preview as motivating discussion on investment endogeneity vs autonomy, avoiding premature empirical adjudication (PR-024, CL-018–CL-020).
- Deleted redundant S0/S1/S2 roadmap at the conclusion of Section 3 (PR-025).
- Removed dissertation bridge references to companion research (`Polanco2026`).

### Pass D — Section 4 §§4.4–4.5 S0/S1 Prose Cleanup (`sections/04_econometric_replication.tex`)
- Removed empty heading `\subsubsection{Cross-Stage Synthesis}` at line 263 (PR-032).
- Merged duplicate consecutive S0 baseline reconstruction paragraphs into a single clean result-first paragraph (PR-033, KB-04).
- Removed overwriting adjectives ("highly significant", "cointegrates robustly"), reporting exact statistics and $p$-values ($F=5.250, p=0.023$) (PR-034).
- Calibrated S1 specification-space discussion: replaced prosecutorial language ("shatters the illusion", "physical absurdity") with measured econometric sensitivity and economic plausibility language (PR-035, CL-014, CL-030).
- Preserved focal model comparison ARDL(3,3) vs ARDL(1,2) as an exact Keep Benchmark (KB-05).

### Pass E — Section 4 §§4.1–4.3 Voice & Descriptive Calibration (`sections/04_econometric_replication.tex`)
- Converted authorial voice from royal "we" to single-author "I" across §§4.1–4.3 (PR-029).
- Calibrated post-war trend descriptive narrative to motivate empirical testing rather than claiming raw decline "empirically invalidates" fixed coefficients (PR-030, CL-029).
- Reframed BEA quality-adjusted chain weights as inconsistent with physical stock-flow accounting rather than "breaking physical accounting" (CL-027).
- Reframed gross capital stock as the preferred anchor for physical capacity rather than "theoretically correct" (CL-028).

---

## 2. Quarantined & Preserved Hold Zones (P0 Empirical Blockers)

The following areas were **strictly quarantined and not substantively modified**:
1. **Section 4 §§4.6–4.7 (S2 VECM Replication & Cross-Stage Synthesis):**
   - Held pending resolution of P0 blockers E-01 (integration order of $k_t$), E-02 (Breusch-Godfrey LM(4) $p=0.006$ residual gate contradiction), E-03 (weak exogeneity test of $\alpha_k=0$), E-04 (normalized $\beta$ standard error of 4.852), E-05 (historical dummy coding verification), E-06 (specification count reconciliation), and E-07 (statistical vs economic admissibility in Table 11).
2. **Abstract and Title:**
   - Headline claims regarding full-sample VECM inference, weak exogeneity, and overaccumulation are held until P0 blockers are evaluated.
3. **No Empirical Re-estimation:**
   - Zero ARDL/VECM re-estimations were performed; no sample dates, lag lengths, dummies, coefficients, SEs, or $p$-values were altered.
4. **No New References:**
   - Literature list remains strictly closed.
