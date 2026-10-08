# 09 — E-01 Diagnostic Resolution: Capital Stock Integration Order

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1 / EMPIRICAL RECONCILIATION  
**Date:** October 8, 2026  
**Investigator / Senior Managing Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*  
**Empirical Source of Truth:** `C:\ReposGitHub\Critical-Replication-Shaikh`  
**Editorial Source of Truth:** `C:\ReposGitHub\phd-dissertation\workingpapers\chapter1\editorial\wp_conversion_2026_10`  
**Manuscript Status:** **STRICTLY READ-ONLY** (Preserved without modification during this diagnostic pass)  
**Classification Outcome:** **`DEFENSIBLE_I1`**

---

## 1. Executive Summary & Audit Mandate

### 1.1 The Open Question (Issue 1 from Audit Pass 02.1)
During the external audit of Integration Pass 02, Item **E-01** (order of integration of the corporate capital stock $k_t$) was flagged as unresolved:
1. Levels of the log corporate capital stock $k_t$ fail unit-root rejection across all standard tests ($\text{ADF} = -1.714$, $\text{PP} = -0.386$).
2. The first difference $\Delta k_t$ fails baseline Dickey-Fuller rejection at the 5% level ($\text{ADF} = -2.067, p = 0.228$; $\text{PP} = -1.903, p = 0.297$, against a 5% critical value of $-2.89$).
3. The second difference $\Delta^2 k_t$ strongly rejects the unit root null ($\text{ADF} = -4.283, p < 0.001$).

**The Methodological Flaw in Prior Reconciliation:** In time-series econometrics, the sequence $\{k_t \text{ non-rejection}, \Delta k_t \text{ non-rejection}, \Delta^2 k_t \text{ rejection}\}$ merely establishes that $k_t$ is integrated of order *at most* 2 ($k_t \in \{I(0), I(1), I(2)\}$). If $k_t \sim I(2)$, its first difference $\Delta k_t \sim I(1)$ and its second difference $\Delta^2 k_t \sim I(0)$. Consequently, rejecting the unit root in $\Delta^2 k_t$ **does not rule out $I(2)$**; it only rules out $I(3)+$.

To establish that $k_t$ can be treated as $I(1)$ in the empirical analysis, one must test whether $\Delta k_t$ is stationary ($I(0)$). Because baseline ADF and PP tests fail to reject the unit root in $\Delta k_t$, attributing this failure to small-sample power loss requires positive empirical verification from complementary testing procedures.

### 1.2 The Resolution Verdict: `DEFENSIBLE_I1`

Using the empirical source repository (`Critical-Replication-Shaikh`), a comprehensive diagnostic battery was executed on the corporate sector dataset ($T=65$, 1947–2011), including an Elliott-Rothenberg-Stock (ERS) point-optimal test, a KPSS stationarity test battery across bandwidths, dynamic autoregressive root analysis, and a bounded Zivot-Andrews endogenous break unit-root test.

**FINAL CLASSIFICATION: `DEFENSIBLE_I1`**

**Core Conclusion:**
> **Taken jointly, the complementary tests support treating $k_t$ as $I(1)$, although capital-stock growth is highly persistent in this short annual sample.**

The classification rests on the following evidence:
1. **Stationarity supported under high-power testing:** The Elliott-Rothenberg-Stock (ERS, 1996) point-optimal unit root test **rejects the unit-root null in $\Delta k_t$ at the 5% critical value** ($P_T = 2.4029 < 3.11$).
2. **Stationarity null not rejected:** The Kwiatkowski-Phillips-Schmidt-Shin (KPSS, 1992) test **fails to reject the null hypothesis of stationarity for $\Delta k_t$** ($\text{LM} = 0.2828 < 0.347$, $p > 0.10$). Stationarity cannot be rejected across any autocorrelation-adjusted bandwidth ($l \in [2, 6]$). In sharp contrast, $k_t$ levels strongly reject stationarity at the 1% level ($\text{LM} = 1.7244 \gg 0.739$).
3. **Autoregressive dynamics are dynamically stable:** An AIC-selected AR(3) model for $\Delta k_t$ reveals that all characteristic roots of the lag polynomial lie strictly outside the unit circle (minimum modulus $= 1.2631 > 1.0$), with a dominant real eigenvalue of $\lambda_1 = 0.7917 < 1.0$.
4. **The autocorrelation function decays geometrically:** The sample autocorrelation of $\Delta k_t$ smoothly declines from $\hat{\rho}_1 = 0.8415$ to $\hat{\rho}_8 = 0.0021$, consistent with a persistent covariance-stationary AR process rather than a random walk.
5. **Break-adjusted unit root test remains underpowered:** The bounded Zivot-Andrews test (Model A, mean break) identifies a potential shift in 1963 but fails to reject the unit root null ($t = -3.7469$ vs. 5% CV $-4.80$), confirming that Dickey-Fuller-type testing remains constrained by the severe critical-value penalty in a short sample of 64 annual observations.

Consequently, while $k_t$ cannot be described as "definitively confirmed $I(1)$ across all tests," treating $k_t$ as $I(1)$ is **econometrically defensible** (`DEFENSIBLE_I1`) and provides a sound empirical foundation for ARDL bounds testing and VECM estimation.

---

## 2. Empirical Setup & Series Reconstruction

The series were extracted from `Critical-Replication-Shaikh/data/processed/corporate_sector_dataset.csv` and cross-referenced with `data/raw/shaikh_data/Shaikh_canonical_series_v1.csv` for the canonical replication sample ($T=65$, 1947–2011):

$$\text{Price Deflator: } p_t = 100 \times \frac{\text{pKN}_t}{\text{pKN}_{2005}}$$

$$\text{Real Log Output: } y_t = \ln\left(\frac{\text{GVAcorp}_t}{p_t / 100}\right)$$

$$\text{Real Log Capital: } k_t = \ln\left(\frac{\text{KGCcorp}_t}{p_t / 100}\right)$$

$$\text{First Differences: } \Delta y_t = y_t - y_{t-1}, \quad \Delta k_t = k_t - k_{t-1}, \quad \Delta^2 k_t = \Delta k_t - \Delta k_{t-1}$$

### Summary Statistics ($T=65$, 1947–2011)

| Series | Definition | Min | Mean | Median | Max | Std. Dev. |
|:---|:---|---:|---:|---:|---:|---:|
| $y_t$ | Log Real Corporate GVA | 13.892 | 14.933 | 14.871 | 15.760 | 0.584 |
| $k_t$ | Log Real Gross Capital Stock | 14.803 | 15.972 | 15.981 | 17.113 | 0.738 |
| $\Delta y_t$ | Output Growth Rate | $-0.0528$ | $0.0292$ | $0.0332$ | $0.0894$ | $0.0279$ |
| $\Delta k_t$ | Capital Stock Growth Rate | $0.0097$ | $0.0361$ | $0.0347$ | $0.0635$ | $0.0135$ |
| $\Delta^2 k_t$ | Acceleration of Capital | $-0.0182$ | $-0.0001$ | $-0.0006$ | $0.0184$ | $0.0075$ |

---

## 3. Comprehensive Multi-Test Unit Root & Stationarity Battery

The table below compiles the full diagnostic battery, combining baseline tests with the newly computed ERS, KPSS, AR root, and Zivot-Andrews break tests:

| Variable | Form | Test Family | Deterministic Spec. | Test Statistic | Lag / Bandwidth | 5% Critical Value | $p$-value / Outcome | Econometric Implication |
|:---|:---|:---|:---|---:|:---:|---:|:---:|:---|
| **$y_t$** | Level | ADF | Drift | $-0.877$ | 1 (AIC) | $-2.89$ | $p > 0.10$ (Fail) | Non-stationary level |
| $y_t$ | Level | ADF | Trend | $-2.477$ | 1 (AIC) | $-3.45$ | $p > 0.10$ (Fail) | Non-stationary level |
| $y_t$ | Level | PP | Constant | $-1.328$ | 3 (NW) | $-2.907$ | $p > 0.10$ (Fail) | Non-stationary level |
| $y_t$ | Level | KPSS | Level ($\mu$) | $1.642$ | 3 (Bartlett) | $0.463$ | $p < 0.01$ (Reject $H_0$) | Confirms non-stationarity |
| **$\Delta y_t$** | 1st Diff | ADF | Drift | $-5.097$ | 1 (AIC) | $-2.89$ | **$p < 0.01$ (Reject)** | $\Delta y_t \sim I(0)$; $y_t \sim I(1)$ confirmed |
| $\Delta y_t$ | 1st Diff | PP | Constant | $-5.964$ | 3 (NW) | $-2.908$ | **$p < 0.01$ (Reject)** | $\Delta y_t \sim I(0)$; $y_t \sim I(1)$ confirmed |
| $\Delta y_t$ | 1st Diff | KPSS | Level ($\mu$) | $0.231$ | 3 (Bartlett) | $0.463$ | **$p > 0.10$ (Fails to reject)** | Fails to reject stationarity |
| $\Delta y_t$ | 1st Diff | ERS $P$-test | Constant | $0.982$ | — | $3.11$ | **Rejects at 5% CV** | Super-efficient rejection of unit root |
| **$k_t$** | Level | ADF | Drift | $-1.714$ | 3 (AIC) | $-2.89$ | $p = 0.424$ (Fail) | Non-stationary level |
| $k_t$ | Level | ADF | Trend | $-1.166$ | 3 (AIC) | $-3.45$ | $p = 0.916$ (Fail) | Non-stationary level |
| $k_t$ | Level | PP | Constant | $-0.386$ | 3 (NW) | $-2.907$ | $p = 0.908$ (Fail) | Non-stationary level |
| $k_t$ | Level | DF-GLS | Constant | $-1.196$ | 6 (AIC) | $-1.95$ | $p > 0.10$ (Fail) | Non-stationary level |
| $k_t$ | Level | DF-GLS | Trend | $-1.617$ | 6 (AIC) | $-3.03$ | $p > 0.10$ (Fail) | Non-stationary level |
| $k_t$ | Level | KPSS | Level ($\mu$) | $1.724$ | 3 (Bartlett) | $0.463$ | $p < 0.01$ (Reject $H_0$) | Strongly rejects level stationarity |
| $k_t$ | Level | KPSS | Trend ($\tau$) | $0.186$ | 3 (Bartlett) | $0.146$ | $p < 0.05$ (Reject $H_0$) | Strongly rejects trend stationarity |
| $k_t$ | Level | ERS $P$-test | Constant | $18.421$ | — | $3.11$ | $p \gg 0.10$ (Fail) | Non-stationary level |
| **$\Delta k_t$** | 1st Diff | ADF | Drift | $-2.067$ | 3 (AIC) | $-2.89$ | $p = 0.228$ (Fail) | Dickey-Fuller non-rejection (low power) |
| $\Delta k_t$ | 1st Diff | ADF | Trend | $-2.348$ | 3 (AIC) | $-3.45$ | $p = 0.407$ (Fail) | Dickey-Fuller non-rejection (low power) |
| $\Delta k_t$ | 1st Diff | PP | Constant | $-1.903$ | 3 (NW) | $-2.908$ | $p = 0.297$ (Fail) | Phillips-Perron non-rejection (low power) |
| $\Delta k_t$ | 1st Diff | PP | Trend | $-1.843$ | 3 (NW) | $-3.481$ | $p = 0.683$ (Fail) | Phillips-Perron non-rejection (low power) |
| $\Delta k_t$ | 1st Diff | DF-GLS | Constant | $-1.360$ | 6 (AIC) | $-1.95$ | $p > 0.10$ (Fail) | Finite-sample power boundary |
| $\Delta k_t$ | 1st Diff | **ERS $P$-test** | Constant | **$2.403$** | — | **$3.11$** | **Rejects at 5% CV** | **Rejects unit-root null at 5% critical value** |
| $\Delta k_t$ | 1st Diff | **KPSS** | Level ($\mu$) | **$0.283$** | 3 (Bartlett) | **$0.463$** | **Fails to reject** | **Fails to reject stationarity at 5% and 10%** |
| $\Delta k_t$ | 1st Diff | **Zivot-Andrews** | Intercept (Model A) | **$-3.747$** | 3 (AIC) | **$-4.80$** | **$p > 0.10$ (Fail)** | **Break at 1963; fails to reject unit root** |
| **$\Delta^2 k_t$** | 2nd Diff | ADF | None | $-4.304$ | 3 (AIC) | $-1.95$ | **$p < 0.001$ (Reject)** | Rejects unit-root null in $\Delta^2 k_t$ |
| $\Delta^2 k_t$ | 2nd Diff | ADF | Drift | $-4.283$ | 3 (AIC) | $-2.89$ | **$p < 0.001$ (Reject)** | Rejects unit-root null in $\Delta^2 k_t$ |

---

## 4. Dedicated Bounded Break-Adjusted Diagnostic (Zivot-Andrews on $\Delta k_t$)

To satisfy the specific protocol requirement for a break-adjusted unit-root diagnostic on capital accumulation growth, the Zivot and Andrews (1992) procedure was executed using `urca::ur.za`.

### 4.1 Econometrically Defensible Specification
- **Variable:** $\Delta k_t$ (capital stock annual growth rate, $T=64$, 1948–2011).
- **Economic Motivation:** In macroeconomic growth theory, capital accumulation evolves around a steady-state mean rate of accumulation. The primary institutional regime shift in post-war US accumulation is a change in the average rate of growth (Perron 1989 "crash" or regime shift between post-war Fordism and post-1970s restructuring).
- **Model Choice:** **Model A (Intercept Break / Mean Shift)**:
  $$\Delta k_t = \mu + \beta t + \theta D U_t(\lambda) + \alpha \Delta k_{t-1} + \sum_{j=1}^k c_j \Delta^2 k_{t-j} + e_t$$
  where $D U_t(\lambda) = 1$ if $t > T_B$ and $0$ otherwise.
  *Note:* Model A is the standard specification for differenced series. A slope break ("trend break") in $\Delta k_t$ would imply quadratic acceleration/deceleration in the level $k_t$, which is not standard.
- **Lag Augmentation:** $k = 3$ lags of $\Delta^2 k_t$, selected to match the AIC lag order from the baseline ADF regression.

### 4.2 Diagnostic Results
- **Null Hypothesis ($H_0$):** $\Delta k_t$ is a unit root process without structural break ($\alpha = 1, \theta = 0$).
- **Alternative Hypothesis ($H_1$):** $\Delta k_t$ is trend-stationary with a one-time mean shift at an unknown break point.
- **Estimated Break Year:** **1963** (observation index 16; $1947 + 16 = 1963$).
- **Test Statistic ($t_{\hat{\alpha}}$):** **$-3.7469$** (or $-3.2885$ if unaugmented, $k=0$).
- **Critical Values (Zivot-Andrews Model A):**
  - 1% Critical Value: $-5.34$
  - 5% Critical Value: $-4.80$
  - 10% Critical Value: $-4.58$
- **Decision:** **Fail to reject the unit root null at all conventional levels** ($|-3.7469| < |-4.58|$).

### 4.3 Interpretation & Assessment
1. **Plausibility of Break Date:** The identified break in **1963** coincides with the transition into the mid-1960s capital accumulation boom. The shift parameter is positive and statistically significant ($\hat{\theta} = +0.0068, t = 3.16$), indicating that capital growth accelerated during the 1960s.
2. **Why the Test Fails to Reject:** The Zivot-Andrews procedure searches endogenously over all potential break dates in the sample ($15\% \le \lambda \le 85\%$). To prevent false rejections of the unit root null due to data mining, the critical value distribution is shifted heavily into the negative tail (5% CV is $-4.80$, compared to $-2.89$ in standard ADF). In a sample of only 64 annual observations, estimating an additional break parameter while searching across the entire sample imposes severe power loss. While the $t$-statistic becomes more negative ($-3.75$ compared to $-2.07$ in standard ADF), it cannot cross the $-4.80$ threshold.
3. **Impact on Classification:** This outcome does *not* materially contradict treating $k_t$ as $I(1)$, but it confirms that Dickey-Fuller-type unit root tests (both standard and break-adjusted) are uninformative in this short annual sample. It demonstrates why the classification cannot be stated as "definitively confirmed across all tests," and reinforces why the evidence rests on the complementary ERS, KPSS, and AR dynamic tests.

---

## 5. Complementary Evidence: High-Power & Dynamic Diagnostics

### 5.1 ERS Point-Optimal Test ($P_T = 2.403$)
Standard Dickey-Fuller tests suffer from well-documented local power deficiencies when the autoregressive root is close to unity ($\rho \approx 0.80\text{--}0.85$) in moderate samples ($T=64$). Elliott, Rothenberg, and Stock (1996) derived the family of point-optimal unit root tests ($P_T$), which optimize the asymptotic power envelope against stationary local alternatives:
$$P_T = \frac{S(\bar{a}) - \bar{a} S(1)}{s^2}$$
Under $H_0: \Delta k_t \sim I(1)$, the 5% critical value is $3.11$, and the rejection region is $P_T < 3.11$.
**Result:** For $\Delta k_t$, $P_T = 2.4029 < 3.11$, **rejecting the unit root null at the 5% level**.

### 5.2 KPSS Stationarity Test ($\text{LM}_\mu = 0.2828$)
The KPSS test posits stationarity as the null hypothesis:
$$H_0: \Delta k_t \sim I(0) \quad \text{vs.} \quad H_1: \Delta k_t \sim I(1)$$
Under baseline Bartlett lag truncation ($l=3$):
$$\text{LM}_\mu = 0.2828 < 0.347 \text{ (10\% CV)} \implies \text{Fails to reject stationarity at } p > 0.10$$
Across all bandwidths $l \ge 2$, the test consistently fails to reject stationarity:
- $l=2: 0.3456 < 0.347$ (Fails to reject stationarity)
- $l=3: 0.2828 < 0.347$ (Fails to reject stationarity)
- $l=4: 0.2453 < 0.347$ (Fails to reject stationarity)
- $l=5: 0.2207 < 0.347$ (Fails to reject stationarity)
- $l=6: 0.2038 < 0.347$ (Fails to reject stationarity)

In contrast, on $k_t$ levels, KPSS strongly rejects stationarity ($\text{LM}_\mu = 1.7244 \gg 0.739, p < 0.001$).

### 5.3 Autoregressive Dynamics & Root Modulus
An AIC-selected AR(3) model for $\Delta k_t$:
$$\Delta k_t = 0.0062 + 1.2136 \Delta k_{t-1} - 0.5844 \Delta k_{t-2} + 0.1983 \Delta k_{t-3} + \hat{\epsilon}_t$$
- **Persistence:** $\sum_{i=1}^3 \hat{\phi}_i = 0.8274 < 1.0$.
- **Roots of Characteristic Polynomial:**
  - Real Root: $z_1 = 1.2631$
  - Complex Conjugates: $z_{2,3} = 0.8423 \pm 1.8121 i$ (Modulus: $|z_{2,3}| = 1.9983$)
- **Modulus Condition:** All roots lie strictly outside the unit circle ($|z_i| > 1.26$). The companion matrix eigenvalues satisfy $|\lambda_i| \le 0.7917 < 1.0$. There is no unit root ($\lambda = 1.0$) and no explosive root.

### 5.4 Autocorrelation Function (ACF) Decay Profile
The sample autocorrelation function of $\Delta k_t$ displays geometric decay:
- Lag 1: $+0.8415$
- Lag 2: $+0.6036$
- Lag 3: $+0.4391$
- Lag 4: $+0.3362$
- Lag 5: $+0.2464$
- Lag 6: $+0.1607$
- Lag 7: $+0.0714$
- Lag 8: **$+0.0021$** (complete dissipation to zero)

This rapid geometric decay to zero within 8 years is characteristic of a covariance-stationary AR process with positive serial correlation, and inconsistent with a unit root process.

---

## 6. Synthesis and Calibrated Classification

### 6.1 Classification Status
- **Prior Status (Pass 02.1 Audit):** **OPEN** (Ambiguous between high persistence and potential $I(2)$).
- **Post-Diagnostic Status:** **`DEFENSIBLE_I1` (RESOLVED & CLOSED)**.

### 6.2 Evidentiary Synthesis
1. Standard Dickey-Fuller and Phillips-Perron tests fail to reject a unit root in $\Delta k_t$ due to finite-sample power deficiencies against high persistence ($\sum \phi = 0.827$) in a sample of $T=64$.
2. The bounded Zivot-Andrews endogenous break test identifies a shift in 1963 but fails to reject the unit root null ($t = -3.747$ vs. CV $-4.80$) due to heavy critical-value penalties in a short sample.
3. However, higher-power and direct stationarity tests provide positive affirmative evidence:
   - The ERS point-optimal test rejects the unit root null at 5% ($P_T = 2.403 < 3.11$).
   - The KPSS test fails to reject the stationarity null across all autocorrelation-adjusted bandwidths ($p > 0.10$).
   - Dynamic polynomial roots lie strictly outside the unit circle ($|z_i| \ge 1.263$).
   - Autocorrelation decays to zero by lag 8.

**Conclusion:**
> **Taken jointly, the complementary tests support treating $k_t$ as $I(1)$, although capital-stock growth is highly persistent in this short annual sample.**

Treating $k_t$ as $I(1)$ satisfies the operational requirements for Pesaran-Shin-Smith ARDL bounds testing and Johansen VECM cointegration analysis, while maintaining methodological transparency regarding sample persistence.

---

## 7. Recommendations for Downstream Editorial Unlocking

When the manuscript is subsequently unlocked for editorial updates in a future integration pass:

1. **Table A.2 (Appendix B / Appendix A):**
   - Supplement the unit root table with the ERS $P$-test statistic ($P_T = 2.403^*$, 5% CV $3.11$), the KPSS test statistic ($\text{LM} = 0.2828$, 10% CV $0.347$), and the Zivot-Andrews Model A statistic ($t = -3.747$, 5% CV $-4.80$, Break: 1963) for $\Delta k_t$.
2. **Appendix Section A.7 (Accompanying Table A.2):**
   - Use the calibrated classification narrative: explain that while standard ADF/PP and break-adjusted Zivot-Andrews tests fail to reject the unit root in $\Delta k_t$ due to finite-sample power loss against high persistence ($\sum \phi = 0.83$), complementary diagnostics—including the ERS point-optimal test, the KPSS stationarity test, and dynamic root analysis—support treating $k_t$ as $I(1)$ (`DEFENSIBLE_I1`).
3. **Sections 4.2 & 4.6:**
   - Maintain the honest acknowledgment that capital accumulation exhibits high inertia ($\rho \approx 0.83$), affirming that the system satisfies the prerequisite $I(1)$ bounds requirements.

---
*End of Governance Artifact `09_E01_DIAGNOSTIC_RESOLUTION.md`*
