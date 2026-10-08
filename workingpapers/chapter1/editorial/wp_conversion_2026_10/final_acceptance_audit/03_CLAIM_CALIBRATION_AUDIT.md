# 03 — Claim Calibration Audit

**Session:** FINAL WORKING-PAPER ACCEPTANCE AUDIT  
**Date:** October 8, 2026  
**Auditor / Senior Managing Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Audit Framework & Epistemic Boundaries

This audit evaluates the calibration of every substantive theoretical, statistical, and interpretive claim in the manuscript against four strict disciplinary boundaries:
1. **Evidentiary Hierarchy:** Claims must reflect the ordering: (1) replication $\to$ (2) sensitivity $\to$ (3) distribution $\to$ (4) institutional interpretation.
2. **Causal Non-Overclaiming:** System-level VECM results establish statistical properties of a long-run cointegrating attractor; they do not estimate structural parameters of class struggle or causal institutional mechanisms.
3. **Estimation Uncertainty Candor:** Point estimates must never be conflated with precise identification when standard errors are large ($\hat{\theta}$ in S2 vs.\ $\hat{\beta}_e$).
4. **Integration-Order Realism:** Time-series persistence must be acknowledged without asserting unverified mathematical certainty.

---

## 2. Comprehensive Claim Evaluation Matrix

| Substantive Claim Domain | Manuscript Location | Audited Phrasing & Calibration | Epistemic Evaluation | Verdict |
|:---|:---|:---|:---|:---:|
| **Title & Contribution Hierarchy** | Title, Abstract, Intro, Concl. | Title locked to *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*. "Institutional settlement" is kept out of the title and headline claims. | Accurately defines the paper as an empirical econometrics contribution with a bounded political-economy interpretation. | **PASS** |
| **S0 Baseline Replication** | Section 4.4, Intro (Para 2), Concl. | Described as "approximately reproducible within canonical data bounds ($\hat{\theta} \approx 0.72$ vs published $0.66$)". Marginally passing bounds test ($p=0.099$) is explicitly reported. | Avoids claiming exact replication; candidly attributes discrepancies to undocumented historical deflator choices. | **PASS** |
| **S1 Non-Uniqueness** | Section 4.5, Abstract, Intro (Para 3) | Described as "disciplined non-uniqueness": $\hat{\theta} \in [0.65, 0.95]$ across the informational frontier. Single-equation models fail to isolate a unique technical constant. | Accurately identifies sensitivity to lag profiles and deterministic terms without rejecting ARDL bounds methodology. | **PASS** |
| **S2 Bivariate Breakdown** | Section 4.6, Abstract, Intro (Para 4) | Bivariate output--capital relation yields zero cointegrating vectors across all 48 attempted specifications over 1947--2011. Pre-2008 sub-sample sensitivity (12 admissible over 1947--2007) reported. | Fully qualified to the tested full-sample specification space; avoids claiming universal impossibility of bivariate cointegration. | **PASS** |
| **S2 Variance Share vs Precision Asymmetry** | Section 4.6, Abstract, Concl. | The 99.1% figure is mathematically explained as the unadjusted marginal variance ratio $\text{Var}(20.022 \ln e_t)/\text{Var}(\hat{\beta}' X_t)$, noting that marginal ratios sum to 109.7% due to negative covariance. Focus is placed on parameter precision asymmetry ($\hat{\beta}_e$ $t=7.90$ vs $\hat{\theta}$ $t=-0.15$). | Eliminates invalid additive variance claims; accurately characterizes the dominance of the exploitation term in anchoring the cointegrating vector. | **PASS** |
| **S2 Overaccumulation Framing** | Section 4.6, Section 5, Concl. | S1 provides primary statistical evidence for sub-unitary elasticities across the bounds-passing ARDL grid ($\hat{\theta} \in [0.65, 0.95]$); S2 focal point estimate ($\hat{\theta} \approx 0.73$) sits in the overaccumulation interval ($\theta < 1.0$), but carries substantial normalized estimation uncertainty ($\text{SE}=4.852$). S2 does NOT "confirm" overaccumulation. | Strictly respects estimation uncertainty; frames overaccumulation in S2 as conditional on the point estimate. | **PASS** |
| **S2 Reserve-Army Renormalization** | Section 4.6 | Renormalization on $\ln e_t$ is presented as a structural representation of the long-run relation, linking the wage share to the capital-output ratio. | Valid normalization of a cointegrating vector; appropriately grounded in classical reserve-army dynamics without asserting unidirectional causality. | **PASS** |
| **Institutional Settlement Framing** | Section 5 (Discussion, Para 2) | Explicitly defines "institutional settlement" as an *analytical interpretation* of the econometric results, *not* an estimated parameter. Explains shop-floor mechanisms, work organization, and distribution. | Fully insulates the paper from referee criticism regarding causal identification of institutional power. | **PASS** |
| **Classical vs Neo-Kaleckian Dynamics** | Section 5 (Discussion, Para 4) | Inactive capital loading ($\hat{\alpha}_k = 0.0003, t=0.92$) and active distribution adjustment ($\hat{\alpha}_e = -0.019, t=-4.25$) are noted as suggestively aligned with classical-Sraffian autonomous investment, but explicitly cautioned: "should not be overstated as a definitive statistical refutation of Neo-Kaleckian closure without a joint likelihood-ratio restriction test." | Exemplary econometric hedging; presents suggestive empirical alignment while explicitly defining the formal test required for refutation. | **PASS** |
| **E-01 Capital Integration Order** | Section 4.2, Appendix A.7, Table A.2 | Classified as `DEFENSIBLE_I1`. Governing conclusion used verbatim: *"Taken jointly, the complementary tests support treating $k_t$ as $I(1)$, although capital-stock growth is highly persistent in this short annual sample."* No claims of "definitively confirmed" or "ruled out". | Fully calibrated; explains PSS bounds accommodation of $I(0)/I(1)$ regressors, reports ERS rejection, KPSS non-rejection, AR companion root stability, and Zivot-Andrews non-rejection honestly. | **PASS** |

---

## 3. High-Risk Phrase Screening Audit

A full-text scan was conducted for words whose assertive force can exceed evidence if unhedged:

| Target Phrase | Total Matches in Prose | Audited Context & Hedging Verification | Audit Finding |
|:---|:---:|:---|:---:|
| `definitively` | **0** | Excised completely from text. | **CLEAN** |
| `ruled out` | **0** | Excised completely from text. | **CLEAN** |
| `proves` | **0** | No instance asserts mathematical proof of economic theories. | **CLEAN** |
| `confirms` | **7** | Used only where verified by data (e.g., convergence of GPIM to BEA stock; normality/ARCH screens; sub-sample sensitivity). Never used to assert S2 confirms overaccumulation or class struggle. | **PROPERLY HEDGED** |
| `requires` | **6** | Used in technical contexts (e.g., admissibility requires passing gates; PIM recursion requires inputs). | **PROPERLY HEDGED** |
| `only` | **10** | Qualified strictly to tested specifications (e.g., bivariate stability recoverable only when exploitation enters tested system; $t$-bounds defined only for Cases I, III, V). | **PROPERLY HEDGED** |
| `demonstrates` | **6** | Applied to econometric demonstrations (e.g., single-equation non-uniqueness; bivariate breakdown). | **PROPERLY HEDGED** |

---

## 4. Audit Verdict on Claim Calibration

**The working paper achieves an exemplary standard of academic claim calibration. Zero unhedged causal assertions, empirical overclaims, or methodological exaggerations remain in the manuscript.**
