# 00 — E-01 Manuscript Integration Scope

**Session:** EDITORIAL INTEGRATION PASS 02.2 (E-01 MANUSCRIPT INTEGRATION)  
**Date:** October 8, 2026  
**Investigator / Senior Managing Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*  
**Classification Target:** **`DEFENSIBLE_I1`**

---

## 1. Context and Objective

In Pass 02.1, the order of integration of the corporate capital stock ($k_t$) was flagged as an open question (**E-01**) because:
- $k_t$ levels fail unit-root rejection;
- $\Delta k_t$ fails standard ADF/PP rejection at the 5% level;
- $\Delta^2 k_t$ strongly rejects the unit-root null.

As noted in the audit, rejecting a unit root in second differences does not rule out $I(2)$ non-stationarity without positive evidence that $\Delta k_t$ is stationary ($I(0)$). 

A bounded empirical diagnostic executed against `Critical-Replication-Shaikh` evaluated $\Delta k_t$ across an expanded battery:
- **ERS Point-Optimal Test ($P_T$):** Statistic $2.4029 < 3.11 \implies$ rejects unit-root null at the 5% critical value.
- **KPSS Stationarity Test ($\text{LM}_\mu$):** Statistic $0.2828 < 0.347 \implies$ fails to reject stationarity at the 10% level across autocorrelation-adjusted bandwidths ($l \in [2,6]$).
- **Dynamic Roots of $\Delta k_t$:** AIC-selected AR(3) companion roots all lie strictly outside the unit circle (minimum modulus $1.2631$, dominant eigenvalue $\lambda_1 = 0.7917 < 1.0$).
- **Autocorrelation Function (ACF):** Smooth geometric decay from $\hat{\rho}_1 = 0.8415$ to $\hat{\rho}_8 = 0.0021$.
- **Zivot-Andrews Break Test (Model A):** Estimated break in 1963, test statistic $-3.7469$ vs.\ 5% critical value $-4.80 \implies$ fails to reject unit-root null in this short annual sample.

Based on this joint diagnostic pattern, E-01 was formally classified as **`DEFENSIBLE_I1`**.

The objective of Pass 02.2 is strictly confined to **manuscript integration**: integrating this empirical evidence and its calibrated interpretation into the manuscript text and governance documents.

---

## 2. Binding Editorial Mandates & Constraints

### 2.1 Governing Substantive Conclusion
The manuscript must adopt and express the following substantive conclusion:
> **“Taken jointly, the complementary tests support treating $k_t$ as $I(1)$, although capital-stock growth is highly persistent in this short annual sample.”**

### 2.2 Prohibited Formulations
The text must **NOT** state:
- “$k_t$ is definitively confirmed $I(1)$”
- “$I(2)$ is ruled out”
- “all tests establish $I(1)$”
- “the Zivot-Andrews test confirms stationarity”

### 2.3 Framework-Specific Precision
- **ARDL / Bounds Testing:** Must clarify that Pesaran--Shin--Smith (2001) bounds inference accommodates regressors that are $I(0)$ or $I(1)$, but not $I(2)$. The diagnostic removes the specific concern that capital stock falls outside the admissible $I(0)/I(1)$ interval.
- **Johansen VECM:** Must discuss Johansen separately, stating that the complementary diagnostics support treating $k_t$ as $I(1)$, which is consistent with the maintained integration-order treatment of the system variables (without claiming that the unit-root diagnostic itself validates the entire VECM).
- **Zivot-Andrews Test:** Must report Model A, estimated break year 1963, statistic $-3.7469$, 5% critical value $-4.80$, and failure to reject the unit-root null, without interpreting the estimated break coefficient as independently establishing a historical regime change.
- **Terminology:** For KPSS, use “fails to reject stationarity” (not “accepts stationarity”). For ERS, use “rejects the unit-root null at the 5% critical value”.

---

## 3. Strict Boundary Rules

1. **Scope Boundaries:** Narrow manuscript integration only. Zero re-estimation of S0, S1, or S2 models. Zero modification of empirical scripts. Zero changes to estimated coefficients.
2. **Untouched Sections:** Abstract, Introduction, and Conclusion require no modifications because they carry no flawed integration-order claims. Section 4.6 carries no unresolved $I(2)$ caveats and remains untouched.
3. **Git Mode:** Strict NO COMMIT, NO PUSH, NO MERGE, NO BRANCH CREATION policy.
