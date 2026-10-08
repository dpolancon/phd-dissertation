# 01 — E-01 Manuscript Change Ledger

**Session:** EDITORIAL INTEGRATION PASS 02.2 (E-01 MANUSCRIPT INTEGRATION)  
**Date:** October 8, 2026  
**Investigator / Senior Managing Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*  
**Classification Target:** **`DEFENSIBLE_I1`**

---

## 1. Itemized Manuscript Modifications

### Location 1: Appendix Table A.2 (`workingpapers/chapter1/appendixA/tables/table_A2_unit_root_tests.tex`)
- **Prior Content:** Contained only ADF and PP statistics for $y_t$ and $k_t$ in levels and first differences.
- **Modification Executed:** Added complementary diagnostic rows for capital stock:
  - $k_t$ ($\Delta$): ERS point-optimal test with constant ($P_T = 2.4029$, 5% CV $3.11$, Rejection: `yes`).
  - $k_t$ ($\Delta$): KPSS level test ($\text{LM} = 0.2828$, 5% CV $0.46$, Rejection: `no`).
  - $k_t$ ($\Delta$): Zivot--Andrews Model A intercept break test ($t = -3.7469$, 5% CV $-4.80$, Break: 1963, Rejection: `no`).
  - $k_t$ ($\Delta^2$): ADF with intercept ($t = -4.2835$, 5% CV $-2.89$, Rejection: `yes`).
- **Table Note Update:** Expanded note to formally define ERS ($H_0$: unit root; statistic $P_T = 2.4029 < 3.11$, rejects the unit-root null at the 5% critical value), KPSS ($H_0$: stationarity; statistic $\text{LM} = 0.2828 < 0.463$, fails to reject stationarity at the 5% level), and Zivot--Andrews Model A ($H_0$: unit root without break; estimated break year 1963, statistic $-3.7469$ vs.\ 5% critical value $-4.80$, fails to reject unit-root null).
- **Audit Rationale:** Provides transparent, comprehensive reporting of the complete diagnostic battery directly in the primary unit-root table.

---

### Location 2: Appendix Section A.7 Narrative (`workingpapers/chapter1/appendices/appendix_B_data_diagnostics.tex`, Line 194)
- **Prior Phrasing:**
  > "Table~\ref{tab:app_summary_stats} reports summary statistics for the core series. Table~\ref{tab:app_unit_roots} presents unit root test results (ADF, Phillips--Perron) for $y_t$ and $k_t$ in levels and first differences. While output first differences ($\Delta y_t$) strongly reject the unit root null across both ADF and PP tests ($p < 0.01$), gross capital first differences ($\Delta k_t$) do not reject the null of a unit root at conventional levels (ADF $t = -2.07, p = 0.228$; PP $t = -1.90, p = 0.297$). While second differences $\Delta^2 k_t$ strongly reject non-stationarity ($t = -4.30, p < 0.001$), ruling out $I(3)$ or higher orders, standard testing on $\Delta k_t$ alone leaves the exact integration order open between high near-unit-root persistence and potential $I(2)$ dynamics in the absence of break-adjusted or KPSS stationarity diagnostics. The ARDL bounds testing framework is therefore essential because it accommodates regressors of uncertain integration order within the $I(0)/I(1)$ interval, although system-level VECM inference warrants explicit awareness of this capital persistence."
- **Repaired Phrasing:**
  > "Table~\ref{tab:app_summary_stats} reports summary statistics for the core series. Table~\ref{tab:app_unit_roots} presents unit root and stationarity test results for $y_t$ and $k_t$ in levels and differences. For output, first differences ($\Delta y_t$) strongly reject the unit-root null across both ADF and PP tests ($p < 0.01$). For corporate capital accumulation, the diagnostic pattern requires more nuanced evaluation. In first differences, baseline ADF ($t = -2.067, p = 0.228$) and PP ($t = -1.903, p = 0.297$) tests on $\Delta k_t$ fail to reject a unit root at conventional levels. Furthermore, a bounded Zivot--Andrews test allowing for an endogenous break in intercept (Model~A) yields an estimated break year of 1963 with a test statistic of $-3.7469$, which fails to reject the unit-root null against the 5\% critical value of $-4.80$ in this short annual sample. However, complementary high-power and stationarity diagnostics provide positive support for differenced stationarity: the Elliott--Rothenberg--Stock (ERS) point-optimal test yields $P_T = 2.4029$, which rejects the unit-root null at the 5\% critical value ($3.11$); the KPSS test yields $\text{LM} = 0.2828$, which fails to reject stationarity of $\Delta k_t$ at the 10\% level ($0.347$), a result that is robust across autocorrelation-adjusted bandwidths; and the characteristic roots of an AIC-selected AR(3) model for $\Delta k_t$ lie strictly in the stationary region (minimum root modulus $1.2631$, dominant companion eigenvalue $\lambda_1 = 0.7917$). In second differences, $\Delta^2 k_t$ rejects the unit-root null ($t = -4.2835$). Taken jointly, the complementary tests support treating $k_t$ as $I(1)$, although capital-stock growth is highly persistent in this short annual sample. Methodologically, Pesaran--Shin--Smith bounds inference accommodates regressors that are $I(0)$ or $I(1)$, but not $I(2)$; these diagnostics therefore remove the specific concern that capital stock may fall outside the admissible $I(0)/I(1)$ range. For system-level estimation, the complementary diagnostics support treating $k_t$ as $I(1)$, which is consistent with the maintained integration-order treatment of the system variables in the VECM."
- **Audit Rationale:** Fully integrates the governing conclusion verbatim, details the required five evidentiary points, enforces correct ARDL $I(0)/I(1)$ vs $I(2)$ bounds logic, separates Johansen VECM consistency, and eliminates all unhedged claims.

---

### Location 3: Main Text Section 4.2 (`workingpapers/chapter1/sections/04_econometric_replication.tex`, Line 197)
- **Prior Content:** Discussed FISIM adjustment, dummy definitions, and finite-sample stochastic bounds simulations.
- **Modification Executed:** Appended the following methodological prerequisite sentence:
  > "Regarding time-series properties, Pesaran--Shin--Smith bounds inference accommodates regressors that are $I(0)$ or $I(1)$, but not $I(2)$. Complementary unit-root and stationarity diagnostics (Appendix~\ref{subsec:app_desc_stats}) support treating $k_t$ as $I(1)$, removing the specific concern that capital stock may fall outside the admissible $I(0)/I(1)$ range, while providing an integration-order treatment consistent with the maintained assumptions of the system-level VECM."
- **Audit Rationale:** Establishes the precise econometric rationale in the main methodology section without cluttering the text with peripheral test tables, pointing directly to the complete diagnostic battery in Appendix A.7.

---

## 2. Itemized Governance Document Calibrations

### Governance File 1: `08_EMPIRICAL_RECONCILIATION_REPORT.md` (Line 35)
- **Prior Phrasing:** `- **Status:** **RESOLVED** (No re-estimation; $I(2)$ formally ruled out).`
- **Calibrated Phrasing:** `- **Status:** **DEFENSIBLE_I1** (No re-estimation; complementary diagnostics support treating $k_t$ as $I(1)$).`

### Governance File 2: `09_E01_DIAGNOSTIC_RESOLUTION.md`
- **Calibrations Executed:**
  - Standardized classification outcome to **`DEFENSIBLE_I1`**.
  - Replaced all instances of "accept stationarity" with "fails to reject stationarity".
  - Standardized ERS decision text to "rejects the unit-root null at the 5% critical value".
  - Excised all phrases stating "$I(2)$ is ruled out" or "definitively confirmed".
  - Embedded the exact governing conclusion: *“Taken jointly, the complementary tests support treating $k_t$ as $I(1)$, although capital-stock growth is highly persistent in this short annual sample.”*
