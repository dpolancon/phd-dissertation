# SYSTEM 6 SIGN-SEMANTICS NOTE
## Pre-October-1973 Conditional VAR(3) Analysis

**Author:** Integration Editor  
**Date:** September 2026  
**Context:** Phase 10A Section 5.3 Contraction  
**Specification:** System 6 — Central Bank Solvency System  
- **Sample:** Pre-October 1973 ($N_{\text{eff}} = 161$, 1960:02–1973:09)  
- **Lag:** $k = 3$ (selected by AIC among admissible models; unique serial-admissible specification)  
- **Information Set:** $Y_t = [g_{\text{SolvR\_H},t}, g_{\text{gold},t}, g_{e,t}, g_{H,t}, \pi_t]'$  
- **Diagnostics:** Stable ($\max |\lambda| = 0.8817$), System BG $p = 0.1262$, Min Eq BG $p = 0.0557$, PT12 $p = 0.0754$.

---

### 1. Mathematical Variable Definitions

The central solvency metric is defined as:
$$\text{SolvR}^H_t \equiv \frac{e_t \cdot \text{IR}_t}{H_t \cdot 1000}$$
where $e_t$ is the nominal exchange rate (escudos per USD), $\text{IR}_t$ is gross international reserves (USD millions), and $H_t$ is high-powered monetary base (millions of escudos).

The entered stationary variable is the monthly percentage rate of change:
$$g_{\text{SolvR\_H},t} \equiv \Delta \ln \text{SolvR}^H_t \times 100$$

Sign semantics of $g_{\text{SolvR\_H},t}$:
- $g_{\text{SolvR\_H},t} > 0$: **Solvency expansion / improvement** (official reserve value growth outpaces base money growth).
- $g_{\text{SolvR\_H},t} < 0$: **Solvency contraction / depletion** (base money growth outpaces official reserve value growth).

---

### 2. Estimated Coefficient Vector (Unrestricted OLS)

#### Equation 1: Base Money Growth ($g_{H,t}$ as Dependent Variable)
Test of $H_0: g_{\text{SolvR\_H}} \not\to g_H$:
- $F(3, 145) = 6.983$, $p = 0.00020$ (**Reject $H_0$ at 0.1% level**)

Estimated lag coefficients for $g_{\text{SolvR\_H}}$:
- Lag 1: $\hat{\beta}_1 = -0.0119$ ($\text{SE} = 0.0184, t = -0.650, p = 0.516$)
- Lag 2: $\hat{\beta}_2 = -0.0295$ ($\text{SE} = 0.0200, t = -1.472, p = 0.143$)
- Lag 3: $\hat{\beta}_3 = +0.0568$ ($\text{SE} = 0.0190, t = +2.991, p = 0.0033$)
- **Sum of coefficients:** $\sum_{i=1}^3 \hat{\beta}_i = +0.0153$

#### Equation 2: Solvency Ratio Growth ($g_{\text{SolvR\_H},t}$ as Dependent Variable)
Test of $H_0: g_H \not\to g_{\text{SolvR\_H}}$:
- $F(3, 145) = 2.951$, $p = 0.03475$ (**Reject $H_0$ at 5% level**)

Estimated lag coefficients for $g_H$:
- Lag 1: $\hat{\gamma}_1 = -0.1303$ ($\text{SE} = 0.3741, t = -0.348, p = 0.728$)
- Lag 2: $\hat{\gamma}_2 = -0.9775$ ($\text{SE} = 0.3598, t = -2.717, p = 0.0074$)
- Lag 3: $\hat{\gamma}_3 = +0.2713$ ($\text{SE} = 0.3731, t = +0.727, p = 0.468$)
- **Sum of coefficients:** $\sum_{i=1}^3 \hat{\gamma}_i = -0.8365$

#### Equation 3: Nominal Devaluation Rate ($g_{e,t}$ as Dependent Variable)
Test of $H_0: g_{\text{SolvR\_H}} \not\to g_e$:
- $F(3, 145) = 3.073$, $p = 0.02972$ (**Reject $H_0$ at 5% level**)
- Lag coefficients: $\hat{\delta}_1 = +0.0512$ ($p = 0.014$), $\hat{\delta}_2 = +0.0593$ ($p = 0.0095$), $\hat{\delta}_3 = +0.0182$ ($p = 0.395$)
- **Sum of coefficients:** $\sum_{i=1}^3 \hat{\delta}_i = +0.1287$

---

### 3. Sign-Semantic Audit & Reconciliation

1. **Base Money Growth drains Solvency Growth ($g_H \to g_{\text{SolvR\_H}}$):**
   The sign of $\sum \hat{\gamma}_i$ is $-0.837$, heavily concentrated at lag 2 ($\hat{\gamma}_2 = -0.978, p = 0.0074$). An acceleration in base money growth precedes a sharp reduction in solvency ratio growth two months later. This is economically and accounting-wise completely consistent: domestic money creation, holding external reserves fixed, mechanically and dynamically erodes reserve backing.

2. **Solvency Growth into Base Money Growth ($g_{\text{SolvR\_H}} \to g_H$):**
   The sum of coefficients is $+0.0153$, with the predictive rejection driven by the positive coefficient at lag 3 ($\hat{\beta}_3 = +0.0568, p = 0.0033$).
   - A literal reading of this linear relation is: higher solvency growth precedes higher base money growth three months later (or conversely, negative solvency growth precedes slower base money growth).
   - In older drafts, prose loosely asserted that "reserve depletion leads base money expansion with a positive sign." That phrasing conflated the direction of the variable change ($g_{\text{SolvR\_H}} < 0$) with the mathematical sign of $\hat{\beta}$.
   - In a linear symmetric VAR, if $\hat{\beta}_3 > 0$, an increase in solvency ratio growth is associated with higher future money growth.
   - Therefore, §5.3 prose must **not** claim that the linear regression shows "depletion stimulates money emission." Instead, it must report the result in exact variable terms: lagged solvency growth ($g_{\text{SolvR\_H}}$) contains statistically significant predictive information for base money growth ($p = 0.0002$), with a positive lag-3 coefficient ($\hat{\beta}_3 = +0.057$).
   - This exact finding underlines why a **linear** specification is inherently limited: defensive accommodation under crisis is intrinsically an asymmetric, state-dependent mechanism (active when reserves are depleted, inactive when reserves are abundant). The linear model cannot distinguish positive reserve windfalls from crisis-driven accommodation, motivating the non-linear Threshold VAR of Section 5.4.

3. **Status in Evidence Hierarchy:**
   Retained as `QUALIFIED_LINEAR_RESULT` strictly within the pre-October-1973 conditional VAR(3), highlighting the bilateral predictive feedback between domestic base money and the central bank's foreign solvency ratio.
