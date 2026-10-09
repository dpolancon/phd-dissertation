# 01 — R1 Theoretical Dynamics & Stability Audit

**Severity:** Blocker  
**Status:** RESOLVED  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Paper:** `workingpapers/chapter1/`  
**Date:** October 2026  

---

## 1. Problem Statement & Reader-Level Contradiction

In the rendered working paper (p. 10, Figure 1 and §3.3 prose):
- Figure 1 and its caption described the overaccumulation trajectory ($\theta < 1.0$) as converging to a "stable stagnation equilibrium at $\hat{k}^* = -\delta$".
- At the initial condition $\hat{k}_0 = 3\%$, the acceleration was reported as $d\hat{k}/dt = -0.128\%$.
- Conversely, Appendix A (p. 45, §A.3) correctly stated that for the differential equation:
  $$\frac{d\hat{k}}{dt} = (\theta - 1)\hat{k}(\hat{k} + \delta)$$
  the Jacobian evaluated at $\hat{k}^* = 0$ is $f'(0) = (\theta - 1)\delta < 0$ when $\theta < 1$, establishing that $\hat{k}^* = 0$ (stationary net capital / zero net accumulation) is the locally stable stagnation attractor.
- These two claims were mathematically contradictory.

---

## 2. Theoretical Derivation & Stability Analysis

### 2.1. Structural Foundations & Equation Formulation
From the classical accounting identities under the Harrod-Marx investment-savings closure:
1. **Net accumulation rate:** $\hat{k} \equiv \dot{K}/K - \delta$, so gross capital growth is $g_K = \hat{k} + \delta$.
2. **Capital productivity:** $B \equiv Y^p / K$, so $\hat{b} \equiv \dot{B}/B = g_{Y^p} - g_K$.
3. **Savings-investment identity:** $\hat{k} + \delta = s B$, where $s = \phi^p$ is the saving propensity out of capacity profit.
4. **Acceleration identity:** Differentiating $\hat{k} + \delta = s B$ with respect to time yields:
   $$\frac{d\hat{k}}{dt} = s \dot{B} = s B \frac{\dot{B}}{B} = (\hat{k} + \delta) \hat{b}.$$
5. **Unbalanced growth closure:** $g_{Y^p} = \theta g_K$. Under growth-rate notation where $\hat{y}^p = \theta \hat{k}$ for net growth deviations, capital productivity growth is:
   $$\hat{b} = (\theta - 1)\hat{k}.$$
6. **Governing Bernoulli ODE:**
   $$\frac{d\hat{k}}{dt} = f(\hat{k}) = (\theta - 1)\hat{k}(\hat{k} + \delta).$$

### 2.2. Root Identification
Setting $f(\hat{k}) = 0$ for $\theta \neq 1$:
$$(\theta - 1)\hat{k}(\hat{k} + \delta) = 0 \implies \hat{k}_1^* = 0, \quad \hat{k}_2^* = -\delta.$$
- $\hat{k}_1^* = 0$: Stationary net capital stock ($\dot{K} = 0$, where gross investment equals depreciation: $g_K = \delta$). This is the classical *stagnation equilibrium*.
- $\hat{k}_2^* = -\delta$: Zero gross investment ($\dot{K}/K = 0$, where $I = 0$ and capital simply depreciates at rate $\delta$). This is the lower physical boundary.

### 2.3. Jacobian & Local Stability
Differentiating $f(\hat{k}) = (\theta - 1)(\hat{k}^2 + \delta \hat{k})$:
$$f'(\hat{k}) = (\theta - 1)(2\hat{k} + \delta).$$

#### Case 1: Overaccumulation ($\theta < 1 \implies \theta - 1 < 0$)
- **At $\hat{k}^*_1 = 0$:**
  $$f'(0) = (\theta - 1)\delta < 0 \quad (\text{since } \delta > 0).$$
  Because $f'(0) < 0$, $\hat{k}^* = 0$ is a **locally asymptotically stable attractor (sink)**.
- **At $\hat{k}^*_2 = -\delta$:**
  $$f'(-\delta) = (\theta - 1)(-2\delta + \delta) = -(\theta - 1)\delta = (1 - \theta)\delta > 0.$$
  Because $f'(-\delta) > 0$, $\hat{k}^* = -\delta$ is an **unstable repeller (source)**.
- **Phase Flow Behavior:**
  - For any positive net accumulation rate $\hat{k} > 0$: $\hat{k} > 0$ and $\hat{k}+\delta > 0$, hence $f(\hat{k}) < 0$. The net accumulation rate decelerates ($d\hat{k}/dt < 0$) downward toward $\hat{k}^* = 0$.
  - For negative net accumulation in the interior $(-\delta, 0)$: $\hat{k} < 0$ while $\hat{k}+\delta > 0$, hence $\hat{k}(\hat{k}+\delta) < 0$. Multiplied by $(\theta-1) < 0$, we have $f(\hat{k}) > 0$. The net accumulation rate accelerates ($d\hat{k}/dt > 0$) upward toward $\hat{k}^* = 0$.
  - Therefore, for all economically viable initial conditions with positive gross investment ($\hat{k}_0 > -\delta$), the trajectory converges globally to the **stagnation equilibrium $\hat{k}^* = 0$**.

#### Case 2: Excess Capacity / Explosive Growth ($\theta > 1 \implies \theta - 1 > 0$)
- **At $\hat{k}^*_1 = 0$:**
  $$f'(0) = (\theta - 1)\delta > 0.$$
  $\hat{k}^* = 0$ is an **unstable repeller (source)**. Any positive accumulation $\hat{k} > 0$ produces $d\hat{k}/dt > 0$, leading to explosive self-reinforcing acceleration away from 0.
- **At $\hat{k}^*_2 = -\delta$:**
  $$f'(-\delta) = -(\theta - 1)\delta < 0.$$
  $\hat{k}^* = -\delta$ is an attractor for trajectories in $(-\infty, 0)$.

### 2.4. Initial Condition Calibration
At stylized parameters $\delta = 0.05$ (5% depreciation), $\hat{k}_0 = 0.03$ (3% initial net capital accumulation):
- For $\theta = 0.8$:
  $$\left.\frac{d\hat{k}}{dt}\right|_{\hat{k}_0=0.03} = (0.8 - 1.0)(0.03)(0.03 + 0.05) = (-0.2)(0.03)(0.08) = -0.00048 = -0.048\%/\text{year}.$$
- For $\theta = 1.2$:
  $$\left.\frac{d\hat{k}}{dt}\right|_{\hat{k}_0=0.03} = (1.2 - 1.0)(0.03)(0.03 + 0.05) = (+0.2)(0.03)(0.08) = +0.00048 = +0.048\%/\text{year}.$$

*(Note: The previous figure script mistakenly evaluated $y = (\theta - 1)(\hat{k}+\delta)^2$, which yielded $(-0.2)(0.08)^2 = -0.00128 = -0.128\%$, missing the factor $\hat{k}$ and collapsing the parabola into a curve that touched zero only at $-\delta$.)*

---

## 3. Scope of Repairs Executed

1. **Figure 1 (`fig_S3_phase_diagram_capital_capacity_dynamics.pdf` & `.png`):**
   - Re-plotted using the exact formula $d\hat{k}/dt = (\theta - 1)\hat{k}(\hat{k} + \delta)$.
   - Panel A: Correctly identifies $\hat{k}^* = 0$ as the stable stagnation attractor with inward flow arrows; identifies $\hat{k}^* = -\delta$ as the unstable threshold.
   - Panel B: Identifies $\hat{k}^* = 0$ as the unstable repeller with outward explosive flow arrows for $\hat{k} > 0$.
   - Corrected annotation values: $d\hat{k}/dt = \mp 0.048\%$.
2. **Section 3.3 Prose & Table 1 (`sections/03_conceptual_framework.tex`):**
   - Table 1: Clarified that accumulation decelerates toward stagnation at $\hat{k}^* = 0$.
   - Paragraph 3.19: Reconciled to state that overaccumulation pushes net accumulation toward the stable stagnation equilibrium at $\hat{k}^* = 0$.
   - Figure 1 caption: Updated description and numeric value ($d\hat{k}/dt = \mp 0.048\%$).
3. **Appendix A (`appendices/appendix_A_ODE.tex`):**
   - Re-verified complete mathematical harmony between Appendix A.3 and Section 3.3.

---

## 4. Before / After Comparison

| Object | Before Repair | After Repair |
|:---|:---|:---|
| **Fig. 1 Panel A Attractor** | Labeled $\hat{k}^* = -\delta$ as stable stagnation | Labeled $\hat{k}^* = 0$ as stable stagnation; $\hat{k}^* = -\delta$ as unstable boundary |
| **Fig. 1 Acceleration at $\hat{k}_0=3\%$** | $d\hat{k}/dt = \mp 0.128\%$ | $d\hat{k}/dt = \mp 0.048\%$ |
| **Fig. 1 Caption** | "...pushing the net accumulation rate toward the stable stagnation equilibrium at $\hat{k}^* = -\delta$." | "...pushing the net accumulation rate toward the stable stagnation equilibrium at $\hat{k}^* = 0$." |
| **Section 3.3 Prose** | "...causing net accumulation to decelerate toward stagnation." | "...causing net accumulation to decelerate toward the stable stagnation equilibrium at $\hat{k}^* = 0$." |
| **Table 1 Tendency** | "Accumulation decelerates toward stagnation" | "Accumulation decelerates toward stagnation ($\hat{k}^* = 0$)" |

**Conclusion:** R1 is fully resolved and verified.
