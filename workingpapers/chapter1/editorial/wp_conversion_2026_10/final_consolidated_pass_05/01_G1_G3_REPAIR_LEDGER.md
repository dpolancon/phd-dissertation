# 01 — Repair Ledger: Reader Guards G1–G3

**Pass:** Final Consolidated Pass 05 — Cumulative `final_pass.py` v1.1 + Reader-Guard Extension  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Paper:** `workingpapers/chapter1/`  
**Accepted Baseline Commit Prior to Pass 03:** `d786eda`  
**Date:** October 2026  

---

## Overview

This repair ledger records all manuscript modifications applied during Final Consolidated Pass 05. Modifications were strictly confined to reader guards **G1**, **G2**, and **G3** (subdivided into **G3A** and **G3B**). No structural restructuring, econometric re-estimation, or coefficient modifications were performed.

---

## 1. Item G1 — Scope Qualification of S2 System-Level Claims

### Rationale
The empirical findings of Stage S2 establish the failure of bivariate cointegration and the recovery of trivariate cointegration specifically within the bounded specification space investigated (e.g., the 48 attempted / 36 successfully estimated configurations under 4 lag orders, 4 deterministic branches, and 3 dummy structures over 1947–2011). Assertions that could be misread by an external peer reviewer as unbounded universal claims (e.g., claiming the relation "survives exclusively" or "stability becomes recoverable only when" without qualification) were calibrated by explicitly bounding the domain of inference to the tested specification space and full-sample system grid.

### File Modifications

#### 1. `working_paper.tex` (Abstract)
- **Location:** Line 138 (Abstract)
- **Before:**
  > Moving to a system framework, across 48 attempted bivariate VECM specifications, 36 are successfully estimated, and none of those 36 identifies an admissible cointegrating relation. Long-run system stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical shock controls.
- **After:**
  > Moving to a system framework, across 48 attempted bivariate VECM specifications, 36 are successfully estimated, and none of those 36 identifies an admissible cointegrating relation. Within the tested full-sample system grid, long-run system stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical shock controls.

#### 2. `sections/01_introduction.tex` (Introduction)
- **Location:** Lines 10–12
- **Before:**
  > In Stage S2, across 48 attempted bivariate Vector Error Correction Models (VECMs, of which 36 are successfully estimated and 12 fail numerical convergence under $C_1$), none of the 36 successfully estimated specifications identifies an admissible cointegrating relation. Residuals exhibit persistent non-stationary drift. Aggregate output and capital stock do not form an empirically self-sufficient cointegrating system in isolation over the post-war period.
  >
  > Long-run system stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical shock controls.
- **After:**
  > In Stage S2, across 48 attempted bivariate Vector Error Correction Models (VECMs, of which 36 are successfully estimated and 12 fail numerical convergence under $C_1$), none of the 36 successfully estimated specifications identifies an admissible cointegrating relation. Residuals exhibit persistent non-stationary drift. Within the tested bivariate specifications, aggregate output and capital stock do not form an empirically self-sufficient cointegrating system over the post-war period.
  >
  > Within the tested full-sample system grid, long-run system stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical shock controls.

#### 3. `sections/04_econometric_replication.tex` (§4.1 Summary)
- **Location:** Line 10
- **Before:**
  > More importantly, the standalone output--capital relation fails system-level cointegration tests, showing that a stable long-run relationship cannot be identified in a full-sample bivariate setting. The output--capital relation achieves system stability only within a trivariate framework that includes the rate of exploitation, showing that the long-run conversion of capital to capacity is structurally conditioned by the historical distribution of income between wages and profits.
- **After:**
  > More importantly, the standalone output--capital relation fails system-level cointegration tests, showing that a stable long-run relationship cannot be identified in a full-sample bivariate setting. Within the tested full-sample system grid, the output--capital relation achieves system stability only within a trivariate framework that includes the rate of exploitation, showing that the long-run conversion of capital to capacity is structurally conditioned by the historical distribution of income between wages and profits.

#### 4. `sections/04_econometric_replication.tex` (Table 2 Interpretive Implication)
- **Location:** Line 29 (Table 2 row for S2 Trivariate)
- **Before:**
  > Tests whether the structural relation survives exclusively when distribution enters explicitly
- **After:**
  > Tests whether the structural relation survives when distribution enters explicitly within the tested system grid

#### 5. `sections/04_econometric_replication.tex` (§4.6 S2 Opening Paragraph)
- **Location:** Line 415
- **Before:**
  > This breakdown demonstrates that capital accumulation and output cannot sustain a stable long-run trajectory in isolation. Long-run system stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical step controls.
- **After:**
  > Within the tested specification space, this breakdown demonstrates that capital accumulation and output cannot sustain a stable long-run trajectory in isolation. In the tested system grid, long-run system stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical step controls.

#### 6. `sections/04_econometric_replication.tex` (§4.6 S2 Outcome Summary)
- **Location:** Line 424
- **Before:**
  > These results demonstrate that the output--capital relation achieves system stability only when conditioned on functional distribution.
- **After:**
  > These results demonstrate that within the tested system grid, the output--capital relation achieves system stability only when conditioned on functional distribution.

#### 7. `sections/04_econometric_replication.tex` (§4.6 Historical Step Controls)
- **Location:** Line 514
- **Before:**
  > Historical step controls ($S_{1956}, S_{1974}, S_{1980}$) are essential for establishing system-level cointegration. Cointegration holds only when the model includes step controls to absorb permanent structural breaks, preventing permanent mean shifts in residuals from appearing as unit roots.
- **After:**
  > Within the tested trivariate models, historical step controls ($S_{1956}, S_{1974}, S_{1980}$) are essential for establishing system-level cointegration. Cointegration holds only when the model includes step controls to absorb permanent structural breaks, preventing permanent mean shifts in residuals from appearing as unit roots.

#### 8. `sections/05_discussion_conclusion.tex` (Discussion)
- **Location:** Line 4
- **Before:**
  > Cointegration fails entirely in the standalone bivariate system over the post-war period, and long-run stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical step controls.
- **After:**
  > Cointegration fails entirely in the standalone bivariate system over the post-war period, and within the tested full-sample system grid, long-run stability becomes recoverable only when the rate of exploitation enters the state vector alongside historical step controls.

#### 9. `sections/05_discussion_conclusion.tex` (Conclusion)
- **Location:** Line 25
- **Before:**
  > Third, system-level estimation (Stage S2) demonstrates that across 48 attempted bivariate VECM specifications, 36 are successfully estimated, and none of those 36 identifies an admissible cointegrating relation over the 1947--2011 sample. Cointegration becomes recoverable only when the rate of exploitation enters the state vector alongside historical step controls.
- **After:**
  > Third, system-level estimation (Stage S2) demonstrates that across 48 attempted bivariate VECM specifications, 36 are successfully estimated, and none of those 36 identifies an admissible cointegrating relation over the 1947--2011 sample. Within the tested full-sample system grid, cointegration becomes recoverable only when the rate of exploitation enters the state vector alongside historical step controls.

---

## 2. Item G2 — Reserve-Army Interpretation Calibration

### Rationale
In Section 4.6, the cointegrating vector normalized on $\ln e_t$ yields a parameter of $-0.050$. While theoretically aligned with classical-Marxian reserve-army mechanisms, the macroeconomic VECM models aggregate time-series co-movements and does not identify structural bargaining channels, labor-market tightening, or wage-pressure mechanisms directly. The wording was calibrated to explicitly designate this as an interpretive political-economy framework while stating the econometric boundary of the VECM.

### File Modifications
- **File:** `sections/04_econometric_replication.tex`
- **Location:** Lines 458–461
- **Before:**
  > \begin{equation}
  > \label{eq:focal_vecm_reserve_army}
  > \ln e_t = -0.050 \, \left(\ln Y_t - 0.727 \ln K_t\right) + c + \hat{v}_t.
  > \end{equation}
  > The term $(\ln Y_t - 0.727 \ln K_t)$ represents capacity utilization disequilibrium. The estimated elasticity of $-0.050$ reflects a reserve-army feedback: when the economy operates above normal capacity ($\ln Y_t > 0.727 \ln K_t$), labor market tightening dampens the exploitation rate, raising the wage share. When excess capacity develops, unemployment relieves wage pressure, restoring the exploitation rate. At the system level, capacity utilization and distribution adjust jointly within a single cointegrating relationship.
- **After:**
  > \begin{equation}
  > \label{eq:focal_vecm_reserve_army}
  > \ln e_t = -0.050 \, \left(\ln Y_t - 0.727 \ln K_t\right) + c + \hat{v}_t.
  > \end{equation}
  > The term $(\ln Y_t - 0.727 \ln K_t)$ represents capacity utilization disequilibrium. Renormalizing on $\ln e_t$ yields a coefficient of $-0.050$. I interpret this negative association as consistent with a reserve-army mechanism: conditional on the maintained cointegrating relation, higher output relative to capital is associated with a lower exploitation rate. A classical reserve-army interpretation would connect this pattern to labor-market tightening and wage pressure, but the VECM does not identify that causal mechanism directly. At the system level, capacity utilization and distribution adjust jointly within a single cointegrating relationship.

---

## 3. Item G3 — Diagnostic and Johansen Inference Calibration

### Item G3A: Breusch–Godfrey LM(4) Diagnostic Calibration
- **Rationale:** The Breusch–Godfrey LM(4) test rejects the null of no autocorrelation ($LM(4) = 60.81, p = 0.006$). Prior text claimed this "does not invalidate the superconsistent Johansen ML estimates." While asymptotic superconsistency means cointegrating parameters converge at rate $T$ rather than $\sqrt{T}$, residual autocorrelation in finite macroeconomic samples ($T = 65$) distorts test statistics and indicates incomplete whitening. The text was calibrated to transparently report the statistic and acknowledge it as a diagnostic limitation that weakens conventional finite-sample inference, without asserting that superconsistency eliminates the concern.
- **File:** `sections/04_econometric_replication.tex`
- **Location:** Line 446
- **Before:**
  > While the Breusch--Godfrey LM(4) statistic is $60.81$ ($p=0.006$), reflecting lag-4 sensitivity in a small macroeconomic sample ($T=65$) with multiple exogenous step indicators, this does not invalidate the superconsistent Johansen ML estimates, though it qualifies claims of absolute residual whitening and warrants transparent reporting.
- **After:**
  > The Breusch--Godfrey LM(4) statistic is $60.81$ ($p=0.006$), indicating residual serial dependence at lag 4. While this diagnostic limitation does not by itself overturn the estimated rank-one cointegrating relation, it weakens conventional finite-sample inference and reflects incomplete residual whitening in a small macroeconomic sample ($T=65$).

### Item G3B: Bivariate "Residuals are I(1)" Calibration
- **Rationale:** In the bivariate VECM discussion, describing the failure to cointegrate as "Residuals remain non-stationary ($I(1)$)" is loose terminology for a multi-equation Johansen maximum-likelihood procedure. Cointegration in a VECM is evaluated through trace and maximum eigenvalue rank tests on the coefficient matrix $\Pi = \alpha \beta'$. The text was replaced with precise econometric phrasing specifying that none of the 36 estimated systems identifies a stationary cointegrating vector under Johansen rank tests.
- **File:** `sections/04_econometric_replication.tex`
- **Location:** Line 415
- **Before:**
  > Across 48 attempted bivariate specifications (of which 36 are successfully estimated and 12 fail numerical convergence under $C_1$), none of the 36 estimated bivariate specifications identifies an admissible cointegrating relationship. Residuals remain non-stationary ($I(1)$).
- **After:**
  > Across 48 attempted bivariate specifications (of which 36 are successfully estimated and 12 fail numerical convergence under $C_1$), none of the 36 successfully estimated bivariate systems identifies a stationary cointegrating vector under the Johansen rank tests.

---

## Summary of Changes

| Guard ID | Affected File(s) | Primary Semantic Modification | Status |
|:---|:---|:---|:---|
| **G1** | `working_paper.tex`, `01_introduction.tex`, `04_econometric_replication.tex`, `05_discussion_conclusion.tex` | Bound system claims with "Within the tested full-sample system grid", "Within the tested bivariate specifications", "within the tested system grid" | **APPLIED & VERIFIED** |
| **G2** | `04_econometric_replication.tex` | Present reserve-army feedback as consistent interpretation; add explicit boundary stating VECM does not identify causal mechanism directly | **APPLIED & VERIFIED** |
| **G3A** | `04_econometric_replication.tex` | Transparently acknowledge BG LM(4) = 60.81 ($p=0.006$) as residual dependence weakening finite-sample inference | **APPLIED & VERIFIED** |
| **G3B** | `04_econometric_replication.tex` | Replace "Residuals remain non-stationary ($I(1)$)" with failure to identify a stationary cointegrating vector under Johansen rank tests | **APPLIED & VERIFIED** |
