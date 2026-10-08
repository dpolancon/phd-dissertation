# 06 — Working Paper Readiness

## A. Central contribution in one sentence

The paper critically replicates Shaikh’s accounting-based capacity-utilization measure and shows that the recovered output–capital coefficient is specification-sensitive in single-equation ARDL models and fails to form a stable full-sample bivariate VECM, while a distribution-augmented system yields retained cointegrating specifications.

That sentence is deliberately narrower than some current manuscript language. It states what the reported exercises directly support without yet claiming that the VECM identifies workplace class conflict or settles the Sraffian/Neo-Kaleckian controversy.

## B. Three strongest features now

1. **A real replication contribution.** The paper does not merely “apply” Shaikh: it reconstructs an incompletely documented baseline and makes the dependence of the capacity path on data/lag choices visible.
2. **Specification-space transparency.** The 500-model ARDL exercise is unusual and valuable. The paper can make a credible contribution by showing the range of admissible long-run coefficients rather than hiding model selection.
3. **A useful political-economy extension.** Bringing functional distribution into the system is theoretically coherent with the paper’s framework and produces a clear empirical contrast with the bivariate specification. This is worth developing, provided the inferential claims are calibrated.

## C. Five highest-priority editorial/substantive problems

### 1. S2 admissibility contradiction — P0

The manuscript says the focal VECM passes all three gates and is free from residual pathology, but the accompanying footnote reports a Breusch–Godfrey LM(4) p-value of 0.006. Because the stated Residual Diagnostic Gate requires passing serial-correlation tests, the focal specification currently contradicts its own admissibility rule.

### 2. Integration-order problem for capital — P0

Appendix Table 15 reports that first-differenced `k_t` does not reject a unit root in either ADF or Phillips–Perron specifications at 5%. If that result is correct, `k_t` may be I(2), which is outside the standard PSS bounds framework and standard I(1) Johansen/VECM setup. This must be resolved before treating the core cointegration results as submission-ready.

### 3. Model-universe and category inconsistencies — P0/P1

The manuscript alternates between 48 attempted vs 36 estimated S2 models; Table 12 says 48 estimated. Main text sets S1 lags at 1–5 while Appendix B.8 says 1–6. Table 11 is titled as a set of “retained” specifications but contains C3 values the text subsequently rejects. These are repairable, but they must be reconciled from the code/source of truth rather than copy-edited by guesswork.

### 4. Claim strength outruns the design — P1

“Proves,” “rejects,” “spurious,” “structural link,” “reserve-army feedback,” and “supports the Sraffian position over the Neo-Kaleckian view” often turn conditional system evidence into causal or theory-adjudicating conclusions. The strongest version of the paper does not need this language. “Consistent with,” “fails to cointegrate over the full sample,” and “within the reported specification” are often more accurate and more credible.

### 5. Dissertation residue / rhetorical repetition — P1

The paper repeatedly returns to the same engineering-versus-institutional thesis in the abstract, introduction, historical section, conceptual framework, S2 conclusion, cross-stage synthesis, and final conclusion. The Global South/companion-research ending also reads as a dissertation bridge. Cutting repetition will make the political-economy argument stronger, not weaker.

## D. Classification of remaining work

| Work class | Assessment |
|---|---|
| PROSE ONLY | Large, worthwhile, and ready in Sections 1–3 and S0/S1. |
| PROSE + STRUCTURAL | Needed: shorter introduction, theory compression, less duplicated stage architecture, shorter conclusion. |
| VISUAL PRESENTATION | Moderate: prioritize a smaller set of main-text figures; consider promoting Appendix Figure 20 and demoting process-heavy figures. |
| EMPIRICAL FOLLOWUP | **Required before final S2 prose is locked**: integration order, residual gate, weak-exogeneity/inference checks, dummy coding, model-count/disposition reconciliation. |

## E. Recommended order

**P0 empirical verification first (bounded, not a new project):**
E-01, E-02, E-05, E-06, E-07; then decide whether E-03/E-04 are required for the headline claims.

**In parallel, safe prose work can begin on:**
Section 2 historical prose, Section 3 compression, duplicated S0/S1 prose, voice conversion, and repetition cleanup.

**After P0:**
Abstract → Introduction → S2 → Conclusion → tables/figures → global consistency.

This differs slightly from a pure front-to-back edit because the abstract should not be finalized around VECM claims until the P0 diagnostic issues are settled.

## F. Verdict

# PROSE PASS BLOCKED BY SUBSTANTIVE ISSUE

Interpretation of this verdict: **the full working-paper prose pass should not be finalized yet**, especially the abstract, S2, and conclusion. It does **not** mean all editing must stop. Bounded prose work that cannot be affected by the P0 econometric checks can proceed safely.

The blockers are narrow and auditable; they do not presently justify reopening the entire empirical project.
