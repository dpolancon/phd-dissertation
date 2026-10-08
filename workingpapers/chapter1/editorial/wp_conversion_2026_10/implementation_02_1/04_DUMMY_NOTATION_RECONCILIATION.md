# 04 — Dummy Notation Reconciliation

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Audit Mandate

The codebase audit confirmed that all ARDL and VECM estimation models in Stages S0, S1, and S2 incorporate **permanent step-shift indicators** ($1\{t \ge yy\}$). However, earlier drafts and Appendix Table A.1 reported sample summary statistics for **one-year pulse variables** ($1\{t = yy\}$ with mean $1/65 \approx 0.0154$). Furthermore, text descriptions alternated between "impulse dummies" and "step-shift controls."

This document establishes rigorous mathematical notation separating estimation controls from diagnostic indicators and audits their deployment across the manuscript.

---

## 2. Disentangled Mathematical Notation

### Step Estimation Controls ($S_{yy,t}$)
In all estimation equations (ARDL in S0/S1, VECM in S2), the historical break regressors are defined as Heaviside step indicators:
$$S_{yy,t} \equiv \mathbf{1}\{t \ge yy\} = \begin{cases} 0 & \text{if } t < yy \\ 1 & \text{if } t \ge yy \end{cases}$$
for $yy \in \{1956, 1974, 1980\}$.
- **Economic interpretation:** Permanent institutional regime shifts in normal capital productivity and income distribution:
  - $S_{1956,t}$: Post-Korean War restructuring and capital deepening threshold;
  - $S_{1974,t}$: First OPEC oil shock and termination of the post-war Golden Age;
  - $S_{1980,t}$: Volcker monetary contraction and transition to the neoliberal profitability regime.
- **Econometric role:** Absorbs permanent mean shifts in the cointegrating attractor and short-run dynamics, preventing institutional breaks from inducing spurious non-stationarity in residuals.

### Pulse Diagnostic Indicators ($P_{yy,t}$)
In residual outlier diagnostics and descriptive summary tables, transitory shock indicators are defined as Kronecker pulse indicators:
$$P_{yy,t} \equiv \mathbf{1}\{t = yy\} = \begin{cases} 1 & \text{if } t = yy \\ 0 & \text{if } t \neq yy \end{cases}$$
- **Sample properties:** Sample mean over 1947–2011 ($T=65$) is exactly $1/65 \approx 0.0154$.
- **Diagnostic role:** Overlaid on squared residual plots (Appendix Figure A.5) to assess whether outlier spikes coincide with recognized macro crisis years.
- **Non-estimation status:** These pulse variables are **not** the regressors entered into the baseline ARDL or VECM models.

---

## 3. Manuscript Locations and Required Textual Repairs

| Manuscript Location | Prior Text / Notation | Corrected Text / Notation | Rationale |
|:---|:---|:---|:---|
| `sections/04_econometric_replication.tex`, Table 4 | "historical impulse dummies" | "historical step controls ($S_{yy,t}$)" | Reflects actual estimation regressor. |
| `sections/04_econometric_replication.tex`, line 43 | "The historical impulse dummies $D_{h,t}$ act as short-run shock absorbers..." | "The historical step indicators $S_{h,t} \equiv \mathbf{1}\{t \ge h\}$ absorb permanent regime shifts..." | Corrects structural mechanism. |
| `sections/04_econometric_replication.tex`, line 84 | "historical impulse controls" | "historical step controls" | Standardizes terminology in S0 description. |
| `sections/04_econometric_replication.tex`, line 181 | "$D_{56}, D_{74}, D_{80}$ & Squared-residual diagnostics & Disturbance controls" | "$S_{56}, S_{74}, S_{80}$ & Step estimation controls & Regime-shift absorbers" | Clarifies estimation function in Table 5. |
| `sections/04_econometric_replication.tex`, Table 10 | $D_{1956}, D_{1974}, D_{1980}$ (dummy) | $S_{1956}, S_{1974}, S_{1980}$ (step indicator) | Matches estimation regressor in focal VECM. |
| `appendices/appendix_B_data_diagnostics.tex`, Table A.1 note | "Dummy variables are impulse indicators with mean $1/65 \approx 0.0154$." | "Descriptive statistics for $P_{56}, P_{74}, P_{80}$ report one-year pulse indicators ($\text{mean} = 1/65 \approx 0.0154$). In contrast, estimation regressions employ permanent step indicators $S_{yy,t} \equiv \mathbf{1}\{t \ge yy\}$." | Disentangles table summary from estimation regressor. |
| `appendices/appendix_B_data_diagnostics.tex`, Figure A.5 caption | "Squared residuals from baseline ARDL with impulse dummies $D_{56}$, $D_{74}$, $D_{80}$" | "Squared residuals from baseline ARDL with pulse shock markers $P_{56}$, $P_{74}$, $P_{80}$ overlaid" | Clarifies that pulse markers are diagnostic visual overlays. |

---

## 4. Audit Verdict

**E-05 STATUS: NOMENCLATURE FULLY DISENTANGLED AND RECONCILED**
