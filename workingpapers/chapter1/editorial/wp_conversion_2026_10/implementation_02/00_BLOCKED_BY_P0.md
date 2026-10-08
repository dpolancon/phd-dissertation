# 00 — Blocked by P0 Empirical Reconciliation Gate

## Phase 0 Readiness Gate Status: FAILED (PASS HALTED)
- **Session:** EDITORIAL INTEGRATION PASS 02
- **Manuscript:** *Productive Capacity as an Institutional Settlement: A Critical Replication and Distributional Extension of Shaikh’s Capacity Utilization Measure*
- **Author:** Diego Polanco
- **Gate Evaluation Date:** October 7, 2026
- **Result:** **STOP EXECUTION — MANUSCRIPT MODIFIED: NO**

In accordance with the mandatory instructions in the project directive, Phase 0 is a **HARD GATE**:
> *"Before editing Introduction, S2, Discussion, or Conclusion, determine the current status of: E-01, E-02, E-03, E-04, E-05, E-06, E-07... Do NOT infer resolution from silence. An issue counts as RESOLVED only if a later artifact clearly records: the diagnostic/check performed; the result; the resulting manuscript implication; whether numbers or model classifications changed. If any of E-01, E-02, E-05, E-06, or E-07 remain unresolved: STOP THE IMPLEMENTATION PASS. Do not edit the Introduction, S2, Discussion, or Conclusion."*

Following inspection of the complete working-paper tree (`workingpapers/chapter1/`), the governance bundle (`editorial/wp_conversion_2026_10/`), and the outputs from `implementation_01/`, **zero empirical verification artifacts exist that record diagnostic checks or results resolving E-01, E-02, E-05, E-06, or E-07**. Every item remains in `NOT_AUTHORIZED` status under `04_EMPIRICAL_FOLLOWUP_LEDGER.md` and explicitly quarantined under `implementation_01/02_HOLD_LEDGER.md`.

Editing the Introduction, Stage S2, Discussion, or Conclusion without empirical resolution would violate the scientific integrity contract and result in prose-washing unresolved econometric contradictions.

---

## P0 Empirical Blocker Audit Table

| E-ID | Current Status | Evidence Found | Why It Blocks This Pass | Required Next Action |
|:---|:---|:---|:---|:---|
| **E-01** | **UNRESOLVED** | Appendix Table 15 reports ADF $t = -2.147$ ($p = 0.228$) and PP $t = -1.975$ ($p = 0.297$) on $\Delta k_t$ (Corporate gross capital stock, first difference), failing stationarity at 5% (and 10%). | If $k_t$ is integrated of order 2 ($I(2)$), standard Pesaran-Shin-Smith (2001) ARDL bounds and standard Johansen $I(1)$ VECM estimators are theoretically invalid. The Introduction, S2, and Conclusion cannot assert valid cointegration without verifying integration order. | Perform bounded unit root re-examination for $k_t$ and $\Delta k_t$ using ADF and KPSS with appropriate deterministic trend and break specifications; inspect second differences $\Delta^2 k_t$. |
| **E-02** | **UNRESOLVED** | Section 4.6 (line 459 of `04_econometric_replication.tex`) states the focal VECM "is free from residual pathology", while footnote 3 explicitly reports Breusch-Godfrey LM(4) statistic of 60.81 ($p = 0.006$). | Direct contradiction between the stated Residual Diagnostic Gate (admissibility requires $p > 0.05$) and the reported LM(4) result. Section 4.6, Introduction, and Abstract cannot headline a "residual-clean" focal system while this diagnostic failure is unaddressed. | Re-evaluate residual serial correlation across all candidate trivariate VECMs; determine whether another model passes or explicitly revise/relax the residual admissibility gate criteria with documented rationale. |
| **E-03** | **UNRESOLVED** (Conditional) | Section 4.6 reports $\alpha_k = 0.000$ ($t = 0.92$) and claims capital accumulation is "weakly exogenous", using this to adjudicate the Sraffa-Kalecki debate. | An insignificant $t$-statistic on an individual error-correction equation does not constitute a formal likelihood-ratio (LR) loading restriction test for weak exogeneity. Framing this as rejecting the Neo-Kaleckian framework outruns econometric identification. | Run a formal LR test on the restriction $\alpha_k = 0$ in the focal VECM; alternatively, if unrun, all prose must weaken claims to "estimated adjustment loading is close to zero and insignificant". |
| **E-04** | **UNRESOLVED** (Conditional) | Section 4.6 reports normalized cointegrating elasticity $\hat{\theta} = 0.727$ with standard error $\text{SE} = 4.852$ (approximate 95% CI encompasses $[-8.8, +10.2]$), alongside exploitation $t = 7.90$. | Extremely large uncertainty on $\hat{\theta}$ makes headlining $\theta \approx 0.73$ as a tight structural parameter misleading. Inference on normalized cointegrating vectors requires nonstandard validation. | Document the exact covariance matrix calculation for normalized $\beta$; report confidence intervals transparently; avoid claiming precise point estimation of $\theta$ in system VECMs. |
| **E-05** | **UNRESOLVED** | Manuscript text (§4.2, §4.6) alternates between describing $D_{1956}, D_{1974}, D_{1980}$ as permanent "step-shifts" and "impulse/year dummies". Appendix Table 14 summary statistics report means of $0.015$ ($1/65$), confirming pulse indicator coding. | Describing single-year pulse dummies as permanent step-shifts misrepresents how historical crises entered the estimation matrix. If steps were intended, estimates are based on the wrong regressor; if pulses were used, permanent shift language is false. | Inspect estimation scripts (`replicate_shaikh.py` / VECM scripts) and design matrices for dummy column definitions. If pulses, correct all prose descriptions; if steps, re-estimation is required. |
| **E-06** | **UNRESOLVED** | Internal design count discordance: §4.1 describes S1 grid as $p,q \in \{1,\dots,5\}$ (500 models), whereas Appendix B.8 reports $p,q \in \{1,\dots,6\}$; §4.1 and Table 9 state 48 attempted and 36 estimated S2 models, while Table 12 reports 48 estimated S2 models. | The working paper cannot present contradictory specification counts across tables, appendix, and main text without undermining reproducibility. | Check loop manifests and estimation logs in source repository to establish true execution counts, then correct table metadata across Table 9, Table 12, and text. |
| **E-07** | **UNRESOLVED** | Table 11 lists six "retained" trivariate models, including Johansen Case 3 models with extreme coefficients ($\theta = -0.81, 11.31$) and Case 0 with $\theta = 1.19$, which text subsequently rejects as economically invalid. | Conflates statistical rank survivors with economically viable models. Headline claims stating "six models survive" depend on an auditable, consistent denominator and pre-specified admissibility filtering. | Establish a clear two-stage taxonomy: (1) Statistical Rank Survivors (6 models) vs (2) Economically Admissible Survivors; reconcile Table 11 titles and prose descriptions. |

---

## Editorial Gate Decision

Because **five mandatory P0 blockers (E-01, E-02, E-05, E-06, E-07)** remain completely unresolved by any empirical verification artifact in the repository, the Phase 0 Readiness Gate **FAILS**.

In strict accordance with the session directive:
1. **The implementation pass is STOPPED immediately.**
2. **No modifications are made to `working_paper.tex`, `sections/01_introduction.tex`, `sections/04_econometric_replication.tex`, or `sections/05_discussion_conclusion.tex`.**
3. **Manuscript remains in its verified Implementation 01 state.**

---

## Required Next Actions Before Integration Pass 02 Can Resume

A bounded **Empirical Reconnaissance Pass** (authorized separately) must be executed to:
1. Verify the dummy matrix coding in estimation scripts (resolving **E-05**).
2. Check model loop manifests and log files to establish exact attempted vs estimated counts (resolving **E-06**).
3. Review residual serial correlation diagnostics across the 6 trivariate models (resolving **E-02**).
4. Formulate the two-tier disposition ledger for Table 11 models (resolving **E-07**).
5. Inspect the capital stock integration order diagnostics (resolving **E-01**).

Once the results of these five diagnostic checks are recorded in an authorized verification artifact in `editorial/wp_conversion_2026_10/`, Integration Pass 02 can proceed to align the Introduction, Stage S2, Discussion, and Conclusion around the locked title and framing principles.
