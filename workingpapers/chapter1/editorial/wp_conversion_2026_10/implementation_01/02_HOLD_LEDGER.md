# 02 — Hold Ledger: Preserved P0 Blockers & Quarantined Items

## Status Overview
Every item in this ledger represents a **quarantined empirical concern or unadjudicated claim** that was **NOT modified** during Implementation Session 01. In accordance with `00_SESSION_CHARTER.md` and `04_EMPIRICAL_FOLLOWUP_LEDGER.md`, these items are held to prevent editorial prose implementation from compromising scientific integrity or pre-judging future econometric decisions.

---

## Quarantined P0 Empirical Blockers (Unmodified)

| Blocker ID | Associated Ledger IDs | Location in Manuscript | Diagnostic Concern | Why Preserved on HOLD in Session 01 |
|:---|:---|:---|:---|:---|
| **E-01** | CL-033 | Appendix Table 15; §4.1 | Table 15 reports that $\Delta k_t$ fails ADF and PP stationarity at 5%, raising a potential I(2) capital stock concern that affects standard PSS ARDL and Johansen bounds. | **HOLD:** Requires empirical verification of integration order with ADF/KPSS before asserting strict I(1) properties. Main text and table are untouched. |
| **E-02** | CL-017, PR-038 | §4.6 (lines 459–460) | Main text asserts the focal VECM is "free from residual pathology", but footnote 3 reports Breusch-Godfrey LM(4) $p=0.006$. | **HOLD:** Direct contradiction between residual gate and LM(4) diagnostic cannot be copy-edited away. Section 4.6 was kept entirely untouched. |
| **E-03** | CL-003, CL-018, PR-039 | §4.6 (lines 473–474) | $\alpha_k = 0.000$ ($t=0.92$) is treated as establishing "weak exogeneity" without a formal LR loading restriction test, and used to adjudicate the Sraffa-Kalecki debate. | **HOLD:** Formal restriction test is needed before elevating weak exogeneity to a headline conclusion. §4.6 and Abstract are held. |
| **E-04** | CL-002, PR-039 | §4.6 (lines 466–467) | Reported cointegrating elasticity has $\hat{\theta} = 0.727$ with $\text{SE} = 4.852$, while text interprets this as a tight structural estimate. | **HOLD:** Standard error reporting and inference on normalized $\beta$ must be methodologically verified before recalibrating prose. |
| **E-05** | CL-015, PR-040 | §4.2, §4.6; Appendix Tables | Main text describes 1956/1974/1980 dummies as permanent step-shifts, while Appendix table means are $1/65$ (pulse/impulse indicators). | **HOLD:** Coding in estimation scripts must be checked. If pulses, permanent shift language must be revised; if steps, tables/code are discordant. |
| **E-06** | CL-032, CL-034 | §4.1, Table 9, Table 12, App. B.8 | Contradictory design counts: S1 grid described as $p,q \in \{1,\dots,5\}$ (500 models) vs $p,q \in \{1,\dots,6\}$; S2 described as 36 estimated vs 48 in Table 12. | **HOLD:** Metadata reconciliation requires inspecting loop manifests. Counts and tables left untouched in this session. |
| **E-07** | CL-024, CL-031 | §4.6, Table 11 | Table 11 displays six trivariate models, including C3 extreme $\theta$ and C0 $p=2$ ($\theta=1.19$), which text later labels invalid. | **HOLD:** Distinction between statistical rank survivors and economically viable models must be systematically reconciled. |

---

## Quarantined Sections & Text Blocks in Manuscript

1. **Title & Abstract (`working_paper.tex` lines 1–40):**
   - The Abstract currently reports $\hat{\theta} \approx 0.73$, weak exogeneity of capital, and bivariate failure. Substantive rewriting of the Abstract is held until E-01, E-02, and E-03 are addressed, to ensure the working paper's public pitch matches verified econometric diagnostics.
2. **Section 4 §§4.6–4.7 (`sections/04_econometric_replication.tex` lines 422–574):**
   - Covers the Stage 2 (S2) System-Level VECM Replication, focal parameter interpretation, adjustment speeds ($\alpha$), historical dummy discussions, and Cross-Stage Synthesis.
   - **Completely frozen in Implementation Session 01.**
3. **Section 5 (Discussion & Conclusion, `sections/05_discussion_conclusion.tex`):**
   - Dependent on the final adjudication of S2 results and profit drag implications (CL-013, CL-019, CL-020). Frozen in this pass.
