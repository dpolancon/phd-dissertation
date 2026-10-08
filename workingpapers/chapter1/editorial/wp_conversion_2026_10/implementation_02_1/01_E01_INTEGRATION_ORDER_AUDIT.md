# 01 — E-01 Integration Order Audit

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Audit Mandate & Methodological Principle

The previous reconciliation report (Report 08) concluded that $k_t \sim I(1)$ based on the sequence:
1. $k_t$ levels fail unit-root rejection;
2. $\Delta k_t$ fails ADF/PP unit-root rejection at 5%;
3. $\Delta^2 k_t$ strongly rejects unit-root null ($p < 0.001$).

**Methodological Correction:** In rigorous time-series econometrics, rejecting the null of a unit root in second differences ($\Delta^2 k_t \sim I(0)$) merely establishes that $k_t$ is integrated of order *at most* 2 ($k_t \in I(0), I(1), I(2)$). It **does not rule out $I(2)$**; if $k_t \sim I(2)$, then its first difference $\Delta k_t \sim I(1)$ and its second difference $\Delta^2 k_t \sim I(0)$. 

To establish that $k_t \sim I(1)$, one must demonstrate that $\Delta k_t$ is stationary ($I(0)$). Because baseline ADF and PP tests on $\Delta k_t$ fail to reject the unit root at conventional levels (5% and 10%), stationarity of $\Delta k_t$ is not established by standard Dickey-Fuller inference. Attributing this non-rejection to "small-sample power" or "near-unit-root persistence" is a plausible conjecture, but without an independent diagnostic test (such as a KPSS test of the stationarity null, or a break-adjusted test), stationarity of $\Delta k_t$ remains unverified.

---

## 2. Comprehensive Inventory of Existing Unit Root Diagnostics

The following table compiles all existing unit root test outputs from `Critical-Replication-Shaikh/output/appendix_A/tables/table_A2_unit_root_tests.csv`:

| Test | Variable/Form | Null Hypothesis | Specification | Statistic | Lag/BW | Critical Value (5%) | Result | Implication |
|:---|:---|:---|:---|---:|:---:|---:|:---:|:---|
| **ADF** | $y_t$ (level) | Unit root ($I(1)$) | None | $+3.003$ | 1 | $-1.95$ | Fail to reject | Non-stationary level |
| **ADF** | $y_t$ (level) | Unit root ($I(1)$) | Intercept | $-0.877$ | 1 | $-2.89$ | Fail to reject | Non-stationary level |
| **PP** | $y_t$ (level) | Unit root ($I(1)$) | Intercept | $-1.328$ | 3 | $-2.907$ | Fail to reject | Non-stationary level |
| **ADF** | $y_t$ (level) | Unit root ($I(1)$) | Trend | $-2.477$ | 1 | $-3.45$ | Fail to reject | Non-stationary level |
| **PP** | $y_t$ (level) | Unit root ($I(1)$) | Trend | $-2.134$ | 3 | $-3.480$ | Fail to reject | Non-stationary level |
| **ADF** | $\Delta y_t$ (1st diff) | Unit root ($I(2)$) | Intercept | $-5.097$ | 1 | $-2.89$ | **Reject** ($p < 0.01$) | $\Delta y_t \sim I(0)$; $y_t \sim I(1)$ confirmed |
| **PP** | $\Delta y_t$ (1st diff) | Unit root ($I(2)$) | Intercept | $-5.964$ | 3 | $-2.908$ | **Reject** ($p < 0.01$) | $\Delta y_t \sim I(0)$; $y_t \sim I(1)$ confirmed |
| **ADF** | $\Delta y_t$ (1st diff) | Unit root ($I(2)$) | Trend | $-5.191$ | 1 | $-3.45$ | **Reject** ($p < 0.01$) | $\Delta y_t \sim I(0)$; $y_t \sim I(1)$ confirmed |
| **PP** | $\Delta y_t$ (1st diff) | Unit root ($I(2)$) | Trend | $-5.946$ | 3 | $-3.481$ | **Reject** ($p < 0.01$) | $\Delta y_t \sim I(0)$; $y_t \sim I(1)$ confirmed |
| **ADF** | $k_t$ (level) | Unit root ($I(1)$) | None | $+1.155$ | 4 | $-1.95$ | Fail to reject | Non-stationary level |
| **ADF** | $k_t$ (level) | Unit root ($I(1)$) | Intercept | $-1.714$ | 3 | $-2.89$ | Fail to reject | Non-stationary level |
| **PP** | $k_t$ (level) | Unit root ($I(1)$) | Intercept | $-0.386$ | 3 | $-2.907$ | Fail to reject | Non-stationary level |
| **ADF** | $k_t$ (level) | Unit root ($I(1)$) | Trend | $-1.166$ | 3 | $-3.45$ | Fail to reject | Non-stationary level |
| **PP** | $k_t$ (level) | Unit root ($I(1)$) | Trend | $-1.211$ | 3 | $-3.480$ | Fail to reject | Non-stationary level |
| **DF-GLS** | $k_t$ (level) | Unit root ($I(1)$) | Intercept | $-1.196$ | 6 | $-1.95$ | Fail to reject | Non-stationary level |
| **DF-GLS** | $k_t$ (level) | Unit root ($I(1)$) | Trend | $-1.617$ | 6 | $-3.03$ | Fail to reject | Non-stationary level |
| **ADF** | $\Delta k_t$ (1st diff) | Unit root ($I(2)$) | None | $-0.554$ | 3 | $-1.95$ | Fail to reject | Non-rejection of unit root |
| **ADF** | $\Delta k_t$ (1st diff) | Unit root ($I(2)$) | Intercept | $-2.067$ | 3 | $-2.89$ | **Fail to reject** ($p = 0.228$) | Fails stationarity at 5% |
| **PP** | $\Delta k_t$ (1st diff) | Unit root ($I(2)$) | Intercept | $-1.903$ | 3 | $-2.908$ | **Fail to reject** ($p = 0.297$) | Fails stationarity at 5% |
| **ADF** | $\Delta k_t$ (1st diff) | Unit root ($I(2)$) | Trend | $-2.348$ | 3 | $-3.45$ | **Fail to reject** | Fails stationarity at 5% |
| **PP** | $\Delta k_t$ (1st diff) | Unit root ($I(2)$) | Trend | $-1.843$ | 3 | $-3.481$ | **Fail to reject** | Fails stationarity at 5% |
| **ADF** | $\Delta^2 k_t$ (2nd diff) | Unit root ($I(3)$) | None | $-4.304$ | 3 | $-1.95$ | **Reject** ($p < 0.001$) | $\Delta^2 k_t \sim I(0)$; rules out $I(3)+$ |
| **ADF** | $\Delta^2 k_t$ (2nd diff) | Unit root ($I(3)$) | Intercept | $-4.283$ | 3 | $-2.89$ | **Reject** ($p < 0.001$) | $\Delta^2 k_t \sim I(0)$; rules out $I(3)+$ |

---

## 3. Evaluation Against Audit Criteria

1. **Does $\Delta^2 k_t \sim I(0)$ rule out $I(2)$?**
   **No.** By definition, if $k_t \sim I(2)$, its second difference $\Delta^2 k_t$ must be stationary ($I(0)$). Rejecting the unit root in $\Delta^2 k_t$ proves only that $k_t$ is not integrated of order 3 or higher. It is completely consistent with both $k_t \sim I(1)$ and $k_t \sim I(2)$.
2. **Do existing outputs independently confirm that $\Delta k_t \sim I(0)$?**
   **No.** Both ADF (intercept $t = -2.067$, trend $t = -2.348$) and Phillips-Perron (intercept $t = -1.903$, trend $t = -1.843$) fail to reject the unit root null at conventional levels (5% and 10%). No KPSS test, DF-GLS test on first differences, or structural-break unit root test on $\Delta k_t$ is present in the existing output artifacts.
3. **Manuscript Implication:**
   The manuscript cannot claim that ARDL and Johansen VECM $I(1)$ validity is "confirmed" or that $I(2)$ has been "ruled out." The paper must transparently report that while output $y_t$ is cleanly $I(1)$, capital stock growth $\Delta k_t$ fails baseline Dickey-Fuller rejection, leaving its exact order of integration an open diagnostic question that qualifies standard $I(1)$ bounds inference.

---

## 4. Bounded Follow-Up Request

To formally resolve E-01 for journal submission (authorized separately):
1. **KPSS Test on $\Delta k_t$:** Run the Kwiatkowski-Phillips-Schmidt-Shin test where the null hypothesis is stationarity ($H_0: \Delta k_t \sim I(0)$). Failure to reject the KPSS null would provide direct evidence supporting $I(1)$.
2. **Break-Adjusted Unit Root Test on $\Delta k_t$:** Run Zivot-Andrews or Lee-Strazicich two-break Lagrange Multiplier unit root test allowing for structural shifts in the mean growth rate of corporate capital.
3. **Johansen $I(2)$ Trace Test:** Estimate the formal Johansen (1995) two-stage procedure for $I(2)$ systems on $(y_t, k_t, e_t)$ to test the rank of $I(2)$ components directly.

---

## 5. Audit Verdict

**E-01 STATUS: OPEN**

**E-01 REMAINS OPEN — ADDITIONAL DIAGNOSTIC REQUIRED**
