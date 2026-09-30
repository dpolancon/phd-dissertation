# SYSTEM 6 LANGUAGE CALIBRATION AUDIT

## 1. Context and Objective
In Section 5.3 (\S\ref{sec:granger_solvency_pre73}), System 6 evaluates the Central Bank Solvency Gate.
Under Phase 10B directives:
1. All descriptions must express results in literal variable terms ($g_{\text{SolvR\_H},t}$ growth rate, lagged coefficients, and the algebraic presence of $H_t$ in the denominator of $\text{SolvR}^H$).
2. The narrative must strictly avoid using linear diagnostic failure or subperiod findings to pre-validate the Threshold VAR.
3. The bridge from §5.3 to §5.4 must maintain strict methodological neutrality.

---

## 2. Variable Definition, Denominator Accounting, and Sign Semantics

### Variable Definition:
$$\text{SolvR}^H_t \equiv \frac{e_t \cdot \text{IR}_t}{H_t \cdot 1000}, \quad g_{\text{SolvR\_H},t} \equiv \Delta \ln \text{SolvR}^H_t \times 100$$
Where:
- $e_t$ is the nominal exchange rate (Escudos per US Dollar).
- $\text{IR}_t$ is net international reserves in millions of US Dollars.
- $H_t$ is high-powered monetary base in billions of Escudos.

### Denominator Accounting and Empirical Coefficient Signs:
1. **$g_H \longrightarrow g_{\text{SolvR\_H}}$ ($F = 2.951, p = 0.03475$):**
   - The predictive effect is concentrated at lag 2: $\hat{\beta}_2 = -0.9775$ ($p = 0.0074$), with cumulative sum $\sum \hat{\beta}_i = -0.8365$.
   - **Literal Semantics:** High-powered money growth predictively precedes a decline in solvency ratio growth. Because $H_t$ appears directly in the denominator of $\text{SolvR}^H_t$, monetary expansion automatically depresses the solvency ratio unless offset by an immediate proportional increase in foreign currency reserves ($e_t \cdot \text{IR}_t$). The lagged negative coefficient indicates that reserve accumulation did not offset domestic emission; rather, domestic emission preceded a net worsening of foreign solvency backing.
2. **$g_{\text{SolvR\_H}} \longrightarrow g_H$ ($F = 6.983, p = 0.00020$):**
   - The predictive effect is positive and concentrated at lag 3: $\hat{\beta}_3 = +0.0568$ ($p = 0.0033$), with cumulative sum $\sum \hat{\beta}_i = +0.0153$.
   - **Literal Semantics:** Lagged increases in solvency ratio growth predict subsequent modest increases in base money growth at a three-month lag.
3. **$g_{\text{SolvR\_H}} \longrightarrow g_e$ ($F = 3.073, p = 0.02972$):**
   - Cumulative sum $\sum \hat{\beta}_i = +0.1287$. Solvency growth contains predictive information for subsequent nominal exchange-rate adjustments.
4. **$\pi_t \longrightarrow g_{\text{SolvR\_H}}$ ($F = 0.686, p = 0.5618$):**
   - No predictive relationship ($p > 0.10$).

---

## 3. Before vs. After Text Comparison

### Previous Wording (§5.3):
> "Panel~C of Table~\ref{tab:core_granger_evidence} reports the conditional Granger causality results for this admissible pre-1973 model. Solvency ratio growth predictively Granger-causes base money growth ($F = 6.983, p = 0.0002$), driven by a statistically significant positive coefficient at lag 3 ($\hat{\beta}_3 = +0.0568, p = 0.0033$; sum $\sum \hat{\beta}_i = +0.0153$). In the reverse direction, base money growth predictively Granger-causes solvency ratio growth ($F = 2.951, p = 0.0347$), with a large negative coefficient concentrated at lag 2 ($\hat{\beta}_2 = -0.9775, p = 0.0074$; sum $\sum \hat{\beta}_i = -0.8365$). Domestic base money expansion thus preceded subsequent reductions in foreign reserve backing. Solvency ratio growth also contains predictive information for nominal exchange-rate devaluations ($g_{\text{SolvR\_H}} \to g_e$: $F = 3.073, p = 0.0297, \sum \hat{\beta}_i = +0.129$). Consumer price inflation does not predict solvency growth in this conditional specification ($F = 0.687, p = 0.5618$)."

### Calibrated Wording (§5.3):
> "Panel~C of Table~\ref{tab:core_granger_evidence} reports the conditional Granger causality results for this admissible pre-1973 model. Solvency ratio growth predictively Granger-causes base money growth ($F = 6.983, p = 0.0002$), driven by a statistically significant positive coefficient at lag 3 ($\hat{\beta}_3 = +0.0568, p = 0.0033$; sum $\sum \hat{\beta}_i = +0.0153$). In the reverse direction, base money growth predictively Granger-causes solvency ratio growth ($F = 2.951, p = 0.0347$), with a large negative coefficient concentrated at lag 2 ($\hat{\beta}_2 = -0.9775, p = 0.0074$; sum $\sum \hat{\beta}_i = -0.8365$). Because high-powered money enters directly into the denominator of $\text{SolvR}^H_t$, this negative predictive lag confirms that domestic monetary emission preceded subsequent deteriorations in external backing rather than being matched by offsetting reserve accumulation. Solvency ratio growth also contains predictive information for nominal exchange-rate adjustments ($g_{\text{SolvR\_H}} \to g_e$: $F = 3.073, p = 0.0297, \sum \hat{\beta}_i = +0.129$). Consumer price inflation does not predict solvency growth in this conditional specification ($F = 0.687, p = 0.5618$). The linear specification does not determine whether these predictive relationships vary with the inherited solvency state. Section~\ref{sec:tvar_solvency_regimes} examines that possibility directly."

---

## 4. Calibration of the Transition Bridge to §5.4

### Previous Bridge Wording (§5.3.5 / lines 99--101):
> "The admissible linear vector autoregressive results establish two key findings: domestic monetary emission operated as an accommodative response to nominal price pressures and commercial-bank credit demand, and external solvency backing interacted with domestic base money prior to October 1973. However, constant-parameter linear models impose time-invariant transmission across fundamentally distinct historical regimes... This parameter non-constancy motivates the non-linear Threshold Vector Autoregression developed in Section~\ref{sec:tvar_solvency_regimes}..."

### Calibrated Bridge Wording (§5.3.5):
> "The admissible linear vector autoregressive results establish two key findings: domestic monetary emission operated as an accommodative response to nominal price pressures and commercial-bank credit demand, and external solvency backing interacted with domestic base money prior to October 1973. However, constant-parameter linear models impose time-invariant transmission across fundamentally distinct historical regimes. In a financially subordinate open economy lacking international currency status, the macroeconomic impact of price and credit shocks may differ depending on whether foreign exchange reserves are available to buffer imports or whether the central bank faces reserve exhaustion. The linear specification does not determine whether these predictive relationships vary with the inherited solvency state; Section~\ref{sec:tvar_solvency_regimes} examines that possibility directly. In accordance with the chapter's methodological discipline, this transition is motivated by balance-sheet theory and historical regime sensitivity; the failure of linear specifications to whiten residuals in some systems is treated as an empirical boundary of linear modeling, not as econometric validation of the threshold mechanism. The non-linear model stands entirely on its own balance-sheet derivation, concentrated least squares threshold identification, and bootstrap inference."

---

## 5. Prohibited Phrasing Audit

| Prohibited Concept | Checked | Status |
| :--- | :--- | :--- |
| Claiming linear residual failures "prove" state dependence | YES | Strictly eliminated. Linear residual failure is defined solely as a diagnostic boundary. |
| Claiming linear results "necessitate" or "mandate" TVAR | YES | Strictly eliminated. Replaced with neutral sentence: "The linear specification does not determine whether these predictive relationships vary with the inherited solvency state. Section 5.4 examines that possibility directly." |
| Conflating predictive precedence with structural causation | YES | Strictly compliant with causal-language contract. |
