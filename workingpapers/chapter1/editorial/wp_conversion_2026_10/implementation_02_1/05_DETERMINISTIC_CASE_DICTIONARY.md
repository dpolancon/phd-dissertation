# 05 — Deterministic Case Dictionary & S2 Taxonomy

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Global Deterministic Case Dictionary

To prevent contradictory descriptions (e.g. labeling $C_2$ as a "restricted constant" in one place and "unrestricted constant" in another), the following dictionary defines the deterministic specifications across the codebase and manuscript:

| Branch Code | Johansen (1995) Classification | Constant Location | Linear Trend Location | Implementation (`tsDyn` / `urca`) | Theoretical & Empirical Behavior |
|:---:|:---|:---|:---|:---|:---|
| **$C_0$ ($d0$)** | Case 1 (No deterministic terms) | None | None | `include = "none"`, `LRinclude = "none"` | Imposes zero mean in differences; forces secular drift into cointegrating vector, inflating $\hat{\theta} = 1.19$ in VAR(2). |
| **$C_1$ ($d1$)** | Case 2 (Restricted constant in cointegrating space) | Restricted to cointegrating equation only | None | `include = "none"`, `LRinclude = "const"` | Assumes zero drift in differences; fails numerical convergence in `tsDyn` for this dataset (0 estimated). |
| **$C_2$ ($d2$)** | Case 3 (Unrestricted constant in differences) | Unrestricted in short-run dynamics ($\bm{\mu}$) | None | `include = "const"`, `LRinclude = "none"` | **Standard macroeconomic specification for trending levels.** Short-run constant absorbs secular linear drift in levels without contaminating cointegrating vector. **Focal branch.** |
| **$C_3$ ($d3$)** | Case 5 (Unrestricted constant and trend in differences) | Unrestricted in short-run dynamics | Unrestricted in short-run dynamics | `include = "both"`, `LRinclude = "none"` | Imposes quadratic trend in levels; overparameterizes small sample ($T=65$), causing linear trend to absorb output growth and destabilizing $\hat{\theta}$ ($-0.81, 11.31$). |

---

## 2. Re-articulation of the S2 Two-Tier Model Taxonomy

The external audit identified a potential circularity in Pass 02: defining Tier 2 as "Economically Admissible Survivors" solely because $\hat{\theta} < 1.0$, and then using Tier 2 to claim empirical confirmation of $\hat{\theta} < 1.0$.

### Non-Circular Two-Tier Taxonomy

1. **Tier 1 — Statistical Rank Survivors (6 Specifications):**
   Defined strictly by mechanical statistical admissibility:
   - Numerical convergence of Johansen ML estimator;
   - Rejection of null hypothesis of zero cointegrating vectors ($r=0$) at 5% via Johansen trace test, alongside non-rejection of $r \leq 1$;
   - Companion matrix stability (moduli of all $m-r$ stationary roots strictly inside the unit circle).
2. **Tier 2 — Preferred Deterministic-Branch Specifications ($C_2$ Branch):**
   Selected by an **ex-ante deterministic specification criterion**, completely independent of the estimated $\theta$ magnitude:
   - **Ex-Ante Econometric Rationale:** The series $\ln Y_t$ and $\ln K_t$ exhibit persistent upward secular drift over 1947–2011. In time-series econometrics, omitting the constant ($C_0$) is inappropriate for trending macroeconomic series because it forces the long-run slope to absorb the intercept, while including a linear trend in differences ($C_3$) implies accelerating quadratic growth that overparameterizes small samples ($T=65$). Therefore, the unrestricted short-run constant specification ($C_2$) is the standard theoretical and econometric benchmark for trending macroeconomic data.
   - **Empirical Parameter Outcome (Observed Ex-Post):** Conditional on selecting the econometrically justified $C_2$ branch, the estimated transformation elasticities are $\hat{\theta} = 0.971$ (VAR(1)) and $\hat{\theta} = 0.727$ (VAR(2), focal model). Both sit within the structural overaccumulation interval ($\hat{\theta} < 1.0$).
   - The $C_0$ and $C_3$ specifications are not discarded as "bad models," but documented transparently as models where unmodeled drift ($C_0$) or saturated trend overparameterization ($C_3$) distort the capital coefficient.

---

## 3. Audited Table 11 Structure

```latex
\begin{tabular}{lcccrl}
\toprule
Spec ID & Lag ($p$) & Det.\ Case & Shocks & $\hat{\theta}$ & Evaluation / Classification \\
\midrule
\midrule
\texttt{p1\_d0\_h2\_r1} & 1 & $C_0$ & $h_2$ & 0.91 & Tier 1 statistical survivor (unmodeled secular drift) \\
\texttt{p1\_d2\_h2\_r1} & 1 & $C_2$ & $h_2$ & 0.97 & Tier 2 preferred deterministic branch (linear drift absorbed) \\
\texttt{p1\_d3\_h2\_r1} & 1 & $C_3$ & $h_2$ & -0.81 & Tier 1 statistical survivor (saturated trend overparameterization) \\
\texttt{p2\_d0\_h2\_r1} & 2 & $C_0$ & $h_2$ & 1.19 & Tier 1 statistical survivor / BIC winner (drift forced into $\hat{\theta} > 1$) \\
\texttt{p2\_d2\_h2\_r1} & 2 & $C_2$ & $h_2$ & 0.73 & Tier 2 focal specification (linear drift absorbed; $\hat{\theta} = 0.727$) \\
\texttt{p2\_d3\_h2\_r1} & 2 & $C_3$ & $h_2$ & 11.31 & Tier 1 statistical survivor / AIC winner (saturated trend overparameterization) \\
\bottomrule
\end{tabular}
```
