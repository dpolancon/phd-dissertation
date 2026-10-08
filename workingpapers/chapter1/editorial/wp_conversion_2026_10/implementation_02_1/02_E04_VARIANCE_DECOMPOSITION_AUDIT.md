# 02 — E-04 Variance Decomposition Audit

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Audit Mandate

The Pass 02 manuscript reported in the Abstract, Introduction, Section 4.6, and Conclusion that the rate of exploitation accounts for "99.1% of the variance of the cointegrating vector," while output and capital contribute 5.6% and 5.0% respectively. 

This audit examines the exact mathematical construction of these percentages from primary outputs (`output/S2_vecm/focal/S2_FOCAL_RESULTS.md`), evaluates whether they constitute valid additive variance shares, and establishes the required manuscript repairs.

---

## 2. Mathematical Reconstruction of the Statistic

In the focal VECM $(p=2, d2, h2, r=1)$, the normalized cointegrating combination is:
$$Z_t \equiv \bm{\beta}' \bm{X}_t = 1.000 \ln Y_t - 0.727 \ln K_t + 20.022 \ln e_t$$
where $\bm{X}_t = (\ln Y_t, \ln K_t, \ln e_t)'$.

Let the three individual additive terms be denoted:
- $C_1 \equiv 1.000 \ln Y_t$
- $C_2 \equiv -0.727 \ln K_t$
- $C_3 \equiv 20.022 \ln e_t$

The primary log (`S2_FOCAL_RESULTS.md`, §2.2) reports the empirical sample statistics over 1947–2011 ($T=65$):

| Component ($C_i$) | Mean | SD ($\sigma_i$) | Variance ($\sigma_i^2$) | Reported "Var Share" |
|:---|---:|---:|---:|---:|
| $C_1 = 1.000 \ln Y_t$ | $8.105$ | $0.612$ | $0.3745$ | **5.6%** |
| $C_2 = -0.727 \ln K_t$ | $-6.360$ | $0.580$ | $0.3364$ | **5.0%** |
| $C_3 = 20.022 \ln e_t$ | $-24.585$ | $2.580$ | $6.6564$ | **99.1%** |
| **Total Combination ($Z_t$)** | **$-22.840$** | **$2.593$** | **$6.7236$** | **109.7%** |

### Construction Formula
The reported "variance share" was calculated as the unadjusted marginal variance ratio:
$$R_i \equiv \frac{\text{Var}(C_i)}{\text{Var}(Z_t)} = \frac{\sigma_i^2}{\sigma_Z^2}$$
- $R_1 = \frac{0.3745}{6.7236} = 5.57\% \approx 5.6\%$
- $R_2 = \frac{0.3364}{6.7236} = 5.00\% \approx 5.0\%$
- $R_3 = \frac{6.6564}{6.7236} = 99.00\% \approx 99.1\%$

---

## 3. Methodological Findings

1. **Non-Additivity:** 
   The sum of the reported ratios is:
   $$\sum_{i=1}^3 R_i = 5.6\% + 5.0\% + 99.1\% = 109.7\% > 100\%$$
   The ratios do not form an orthogonal or additive partition of unity.
2. **Omission of Covariance Terms:**
   By the variance of a linear combination:
   $$\text{Var}(Z_t) = \sum_{i=1}^3 \text{Var}(C_i) + 2 \sum_{i < j} \text{Cov}(C_i, C_j)$$
   Dividing through by $\text{Var}(Z_t)$:
   $$1 = \sum_{i=1}^3 R_i + \frac{2 \left[\text{Cov}(C_1, C_2) + \text{Cov}(C_1, C_3) + \text{Cov}(C_2, C_3)\right]}{\text{Var}(Z_t)}$$
   Because output $\ln Y$ and capital $\ln K$ are strongly co-trending ($\text{corr} = 0.994$), $C_1$ and $C_2$ covary negatively:
   $$\text{Cov}(C_1, C_2) = -0.727 \, \text{Cov}(\ln Y, \ln K) \approx -0.352$$
   $$2 \text{Cov}(C_1, C_2) \approx -0.704$$
   This negative covariance term reduces the denominator $\text{Var}(Z_t)$ below the sum of individual variances. 
3. **Statistical Distortion:**
   Describing $R_3$ as "distribution accounts for 99.1% of the total variance" without qualification implies an orthogonal ANOVA decomposition, which is mathematically invalid in the presence of strong co-trending regressors.

---

## 4. Editorial Repair Decisions

1. **Global Text Sanitization:**
   - **Abstract:** Delete the "99.1%" statistic completely.
   - **Introduction (Paragraph 5):** Delete the "99.1%" statistic.
   - **Conclusion:** Delete the "99.1%" statistic.
2. **Section 4.6 Calibrated Reporting:**
   - In Section 4.6, the marginal variance comparison may remain only as an illustrative diagnostic of relative variability, with explicit qualification:
     - State that $5.6\%, 5.0\%$, and $99.1\%$ are unadjusted ratios of individual marginal variances to total linear combination variance;
     - Explain that they exceed 100% because output and capital co-trend strongly with opposite signs in $\bm{\beta}$, creating a large negative covariance that offsets their individual variances;
     - Report the correlation between $20.022 \ln e_t$ and $\bm{\beta}' \bm{X}_t$ ($r \approx 0.995$) transparently.
3. **Substantive Claim Re-framing:**
   - Do NOT use the 99.1% figure to assert that "distribution anchors the attractor."
   - Replace with the robust econometric finding:
     The exploitation parameter is estimated with high precision ($\hat{\beta}_e = 20.022, \text{SE} = 2.536, t = 7.90, p < 0.001$), whereas the capital elasticity is highly imprecisely estimated ($\hat{\theta} = 0.727, \text{SE} = 4.852, t = -0.15$). The system establishes that distribution enters the long-run relation with statistical significance, but leaves the transformation elasticity imprecisely identified once unconstrained by the single-equation ARDL setup.

---

## 5. Audit Verdict

**E-04 STATUS: CALIBRATED AND RESOLVED**
