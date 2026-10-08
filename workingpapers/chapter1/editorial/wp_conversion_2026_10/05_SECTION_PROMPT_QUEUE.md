# 05 — Section Prompt Queue

## Global execution contract

Every implementation prompt below is **bounded**. Before editing, load `01_PROSE_REGISTER_LEDGER.md` and `02_CLAIM_CALIBRATION_LEDGER.md`. Do not implement any `E-*` item from `04_EMPIRICAL_FOLLOWUP_LEDGER.md`; those remain `NOT_AUTHORIZED`.

Global locks for every pass:

- no new estimations;
- no changed numerical results;
- no new references;
- no silent equation changes;
- preserve heterodox concepts when analytically necessary;
- use first-person singular for author actions;
- preserve 5–10 KEEP benchmarks as tonal anchors;
- output a change ledger and a diff summary;
- stop if an edit depends on an unresolved P0 empirical blocker.

---

## P1 — Title + Abstract

**Eligible material:** title, abstract, keywords/JEL only.  
**Ledger IDs:** PR-001–PR-003; CL-001–CL-003.  
**Goal:** make the working-paper pitch concrete, concise, single-authored, and calibrated.

**Authorized**
- shorten title;
- reduce abstract to ~140–150 words;
- convert author actions from “we” to “I”;
- add full-sample qualifier to bivariate failure;
- retain 500-model ARDL + VECM architecture;
- retain distributional extension.

**Locked**
- all reported numbers;
- meaning of θ;
- no new robustness result.

**Failure conditions**
- abstract claims weak exogeneity as established without resolving E-03;
- abstract states θ≈0.73 as a precise structural estimate without acknowledging model-selection/inference limits;
- abstract uses dissertation/companion-study language.

**Status:** HOLD until E-01/E-02/E-03 are reviewed if the abstract continues to headline VECM inference; otherwise a prose-only provisional abstract may be drafted with conservative wording.

---

## P2 — Introduction

**Eligible material:** Section 1 only.  
**Ledger IDs:** PR-004–PR-008; CL-004–CL-006; CL-025.  
**Goal:** a 3–5 page working-paper introduction with problem → replication object → staged strategy → main results → contribution → brief roadmap.

**Authorized**
- move Equation (1) out of the introduction if prose definition is sufficient;
- collapse repeated engineering/institutional contrasts;
- state sample sensitivity;
- reduce roadmap;
- keep “disciplined non-uniqueness” at most once.

**Locked**
- paper’s theoretical identity;
- S0/S1/S2 sequence.

**Acceptance**
- core empirical result visible by paragraph 2–3;
- no “statistical artifact” language;
- no causal reserve-army claim from cointegration alone;
- no dissertation bridge.

---

## P3 — Historical / Measurement Section

**Eligible material:** Section 2.  
**Ledger IDs:** PR-009–PR-013; CL-007.  
**Goal:** preserve the historical political-economy contribution while removing grand transitions and repeated “not neutral” rhetoric.

**Authorized**
- compress;
- separate institutional facts from interpretation;
- reduce tangential literature;
- strengthen topic sentences.

**Locked**
- existing citations only;
- no factual supplementation without a later source-verification pass.

**Acceptance**
- each paragraph has one historical claim;
- “statecraft”, “depoliticization”, “wage discipline” appear only where the cited record visibly supports them;
- Shaikh arrives as the solution to the measurement problem, not after an overlong detour.

---

## P4 — Conceptual Framework

**Eligible material:** Section 3.  
**Ledger IDs:** PR-014–PR-025; CL-008–CL-014.  
**Goal:** retain the θ reinterpretation and accounting-identity critique while reducing dissertation-style derivation and anticipatory interpretation.

**Authorized**
- compress theory duplicated in Appendix A;
- move Sraffian/Neo-K debate discussion to Section 5;
- separate workplace mechanism from estimated evidence;
- merge repeated trend/distribution argument.

**Locked**
- equations unless a later math audit authorizes changes;
- core definition θ = ∂lnYp/∂lnK.

**Acceptance**
- Section 3 motivates testable implications without pre-announcing VECM conclusions;
- no claim that GPIM discrepancy is stationary unless E-08 resolves;
- no unconditional downward measurement-error bias claim.

---

## P5 — Empirical Design + Data + Admissibility

**Eligible material:** §§4.1–4.3.  
**Ledger IDs:** PR-026–PR-032; CL-015–CL-016; CL-027–CL-030.  
**Goal:** make the replication design auditable without narrating the same architecture four times.

**Authorized**
- simplify S0/S1/S2 prose;
- move set notation to appendix;
- remove empty §4.3.1;
- clarify 10% exploratory vs 5% strong admissibility language;
- preserve raw-data figures.

**Hard stop**
- do not finalize dummy language until E-05;
- do not finalize grid counts until E-06;
- do not state integration admissibility until E-01 is resolved.

**Acceptance**
- design universe is internally consistent;
- reader can reproduce the search logic from one table + concise prose.

---

## P6 — S0 + S1 Results

**Eligible material:** §§4.4–4.5.  
**Ledger IDs:** PR-033–PR-035; CL-004; CL-014; CL-024.  
**Goal:** result-first prose: estimate → diagnostic → interpretation → boundary.

**Authorized**
- delete duplicated S0 paragraph;
- remove “highly significant”, “shatters the illusion”, “physical absurdity”;
- foreground exact magnitudes;
- explain θ fan economically.

**Hard stop**
- no reclassification of trend cases until E-11;
- no change to grid counts until E-06.

**Acceptance**
- S0 reads as forensic replication;
- S1 reads as specification sensitivity, not a prosecutorial demonstration.

---

## P7 — S2 + Cross-Stage Synthesis

**Eligible material:** §§4.6–4.7.  
**Ledger IDs:** PR-036–PR-043; CL-017–CL-025; CL-030–CL-032.  
**Goal:** precise system-econometric presentation with conservative theory interpretation.

**Status:** **P0 BLOCKED** pending E-02, E-03, E-04, E-05, E-07.

**After blockers resolve, authorized**
- separate β result, α result, diagnostics, and political-economy interpretation;
- use “consistent with” for reserve-army/Sraffian mechanisms unless stronger tests are present;
- clarify full-sample vs pre-2008 result;
- reduce repeated institutional thesis.

**Failure condition**
- any sentence says “the data reject the Neo-Kaleckian view” without a direct formal test;
- focal model is called residual-clean while serial correlation remains unresolved.

---

## P8 — Discussion + Conclusion

**Eligible material:** Section 5.  
**Ledger IDs:** PR-044–PR-047; CL-013; CL-019–CL-020; CL-026.  
**Goal:** one-page-to-~1.5-page paper conclusion: finding → theoretical implication → limitation → concrete extension.

**Authorized**
- remove repetition of §4.7;
- mark model-conditional profit implications;
- compress Global South/dissertation bridge to one bounded extension;
- preserve single-sector/time-invariant-θ limitations.

**Acceptance**
- conclusion closes this paper before advertising another;
- no promised empirical findings from future work.

---

## P9 — Tables, Figures, Captions

**Eligible material:** presentation only.  
**Source:** `03_FIGURE_TABLE_LEDGER.md`.

**Goal:** create a main-text visual hierarchy.

Priority proposal:
1. descriptive raw-data block (F2–F4);
2. S0 replication fan (F5);
3. S1 specification-space survival + utilization sensitivity (F6 and/or F8; consider F20);
4. S2 outcomes (T9/T11 after reconciliation);
5. cross-stage synthesis (T12).

Move procedural/redundant objects to appendix.

**Hard lock:** no regenerated empirical values without authorization.

---

## P10 — Global Consistency + Voice

**Eligible material:** full manuscript after P1–P9.  
**Ledger IDs:** PR-048–PR-050 + all resolved claim IDs.

Checks:
- I/we/our consistency;
- repetition of “structural”, “engineering”, “institutional”, “fundamental”, “ultimately”;
- “not X but Y” constructions;
- sample dates;
- model counts;
- θ ranges;
- impulse vs step language;
- table/figure cross-references;
- terminology: admissible / surviving / retained / economically viable;
- abstract-introduction-results-conclusion claim identity.

**Acceptance**
- no unresolved numerical contradictions;
- no P0 empirical blocker hidden by prose;
- no new references;
- manuscript reads as a standalone working paper.
