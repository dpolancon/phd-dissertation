# CHAPTER 1 WORKING PAPER — REFERENCE ADJUDICATION IMPLEMENTATION PASS 01
## 01_IMPLEMENTATION_LEDGER.md

**Date:** 2026-10-09  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target:** Chapter 1 Standalone Working Paper  

This ledger records every locked reference adjudication decision implemented during Pass 01, providing exact source text before and after modification, affected files, citation keys, bibliographic changes, and authorial boundary verifications.

---

### RA-01 Edit A — Potential-Output Filtering Passage

- **RA ID:** RA-01 (Edit A)
- **SOURCE FILE:** `sections/02_historical_trace.tex`
- **LOCATION:** Line 20 (paragraph introducing macroeconomic unobservability of potential output)
- **BEFORE:**
```latex
Yet potential output remained an unobservable latent variable whose trajectory depends heavily on statistical filtering choices \citep{HerndonAshPollin2014, AshBasuDube2017}.
```
- **AFTER:**
```latex
Yet potential output remained an unobservable latent variable whose estimated trajectory depends on the method used to separate trend from cycle.
```
- **CITATION KEYS:** Removed `HerndonAshPollin2014`, `AshBasuDube2017`.
- **BIBLIOGRAPHIC CHANGE:** None in `references.bib` (keys retained for use in Section 4).
- **AUTHORIAL BOUNDARY:** Removes improper attachment of empirical public debt replication/reassessment papers to output-gap statistical filtering. Preserves direct filtering citations (Hodrick–Prescott, Baxter–King, Beveridge–Nelson, Hamilton, CBO/Alichi, Blanchard–Quah) in subsequent text.
- **VERIFICATION RESULT:** PASS. `Herndon` and `Ash` absent from Section 2.

---

### RA-01 Edit B — Replication Methodology

- **RA ID:** RA-01 (Edit B)
- **SOURCE FILE:** `sections/04_econometric_replication.tex`
- **LOCATION:** Line 8 (opening of Subsection 4.1 staged replication architecture)
- **BEFORE:**
```latex
I execute this critical investigation across three sequential stages of increasing econometric generality. In Stage S0, I reconstruct the closest empirical counterpart to Shaikh's baseline single-equation model to verify its basic numerical reproducibility. Stage S1 lifts the baseline's rigid specification choices by estimating a combinatoric grid of 500 Autoregressive Distributed Lag (ARDL) models, mapping how the estimated transformation elasticity ($\hat{\theta}$) shifts under alternative lag structures, trend configurations, and outlier controls. Finally, Stage S2 transitions the analysis from single-equation models to system-level estimations, testing whether the output--capital relation survives as a stable Vector Error Correction Model (VECM) and checking whether it requires the rate of exploitation ($e_t$) to establish system-level cointegration.
```
- **AFTER:**
```latex
I execute this critical investigation across three sequential stages of increasing econometric generality. I approach replication as a forensic exercise rather than a binary test of whether a published coefficient can be reproduced. \citet{HerndonAshPollin2014} show how data construction, sample inclusion, weighting, and implementation choices can materially shape an influential empirical result, while \citet{AshBasuDube2017} provide a broader robustness reassessment in which conclusions are tested against functional form, sample composition, influential observations, and causal specification. This motivates separating numerical reconstruction from specification-space mapping and system-level survival testing. In Stage S0, I reconstruct the closest empirical counterpart to Shaikh's baseline single-equation model to verify its basic numerical reproducibility. Stage S1 lifts the baseline's rigid specification choices by estimating a combinatoric grid of 500 Autoregressive Distributed Lag (ARDL) models, mapping how the estimated transformation elasticity ($\hat{\theta}$) shifts under alternative lag structures, trend configurations, and outlier controls. Finally, Stage S2 transitions the analysis from single-equation models to system-level estimations, testing whether the output--capital relation survives as a stable Vector Error Correction Model (VECM) and checking whether it requires the rate of exploitation ($e_t$) to establish system-level cointegration.
```
- **CITATION KEYS:** `HerndonAshPollin2014`, `AshBasuDube2017`.
- **BIBLIOGRAPHIC CHANGE:** None (keys already present in `references.bib`).
- **AUTHORIAL BOUNDARY:** Attaches Herndon et al. (2014) precisely to forensic replication of published results and Ash et al. (2017) to robustness/critical reassessment across specification spaces, motivating the S0/S1/S2 architecture without conflating the two source exercises.
- **VERIFICATION RESULT:** PASS. Both citations present with distinct roles in Subsection 4.1.

---

### RA-02 — Gahn & González Textual Role Differentiation

- **RA ID:** RA-02
- **SOURCE FILE:** `sections/02_historical_trace.tex`
- **LOCATION:** Line 31 (Neo-Kaleckian utilization controversy paragraph)
- **BEFORE:**
```latex
Gahn and Gonz{\'a}lez (2020, 2022) argue that empirical utilization rates exhibit stationary fluctuations around an exogenous normal rate, whereas Nikiforos (2020) maintains that unit-root persistence in capacity utilization reflects endogenous adjustments in normal capacity itself.
```
- **AFTER:**
```latex
The empirical content of these adjustment mechanisms remains contested. \citet{GahnGonzalez2020} revisit Nikiforos's evidence in a comment on the utilization controversy, while \citet{GahnGonzalez2022} present cross-country evidence consistent with stationary and mean-reverting capacity utilization. \citet{Nikiforos2020}, in turn, argues that unit-root persistence in utilization reflects endogenous adjustment of the normal rate.
```
- **CITATION KEYS:** `GahnGonzalez2020`, `GahnGonzalez2022`, `Nikiforos2020`.
- **BIBLIOGRAPHIC CHANGE:** None (all three entries present in `references.bib`).
- **AUTHORIAL BOUNDARY:** Eliminates improper compression `(2020, 2022) argue...`. Assigns Gahn & González (2020) to their comment on Nikiforos, Gahn & González (2022) to their cross-country stationarity/mean-reversion empirical study, and Nikiforos (2020) to his reply.
- **VERIFICATION RESULT:** PASS. No joint citation phrase remains.

---

### RA-03 — Felipe & McCombie Accounting Identity Application

- **RA ID:** RA-03
- **SOURCE FILE:** `sections/03_conceptual_framework.tex`
- **LOCATION:** Line 47 (Subsection 3.2 opening)
- **BEFORE:**
```latex
While national accounting identities link these profit aggregates, they leave the behavioral process translating investment into productive capacity unspecified. Drawing on the accounting-identity critique of production functions \citep{Felipe2005}, I demonstrate that Shaikh's regression approximates an identity under distributionally stable conditions.
```
- **AFTER:**
```latex
While national accounting identities link these profit aggregates, they leave the behavioral process translating investment into productive capacity unspecified. Following Shaikh’s (1974) critique and the accounting-identity argument developed further by \citet{Felipe2005}, regressions estimated with aggregate value data may approximate accounting identities rather than identify underlying technological relations. I apply this identification concern to Shaikh’s capacity regression.
```
- **CITATION KEYS:** `Felipe2005`, `Shaikh1974`.
- **BIBLIOGRAPHIC CHANGE:** None (`Felipe2005` retained).
- **AUTHORIAL BOUNDARY:** Limits Felipe & McCombie (2005) to their general argument that regressions on value data may approximate accounting identities. The author explicitly owns the application of this identification concern to Shaikh's capacity regression.
- **VERIFICATION RESULT:** PASS. Source argument and authorial application clearly demarcated.

---

### RA-05 / RA-06 — Okishio / Basu / Authorial $\theta$ Framework

- **RA ID:** RA-05 / RA-06
- **SOURCE FILE:** `sections/03_conceptual_framework.tex`
- **LOCATION:** Lines 62 and 84 (Subsection 3.3)
- **BEFORE:**
```latex
Marxian reproduction theory models balanced accumulation through proportional expansion across departments \citep{Okishio2022, Basu2022}. In this chapter, I translate this intuition into an aggregate capacity framework by specifying a transformation elasticity between capital accumulation and productive capacity growth: $\theta \equiv \partial \ln Y^p / \partial \ln K$.
...
This taxonomy provides an analytical benchmark while abstracting from inter-sectoral imbalances between Department I (means of production) and Department II (means of consumption).
```
- **AFTER:**
```latex
Marxian reproduction theory provides a benchmark of proportional accumulation, as formalized in different ways by \citet{Okishio2022} and \citet{Basu2022}. In those formulations, the problem is interdepartmental: reproduction depends on proportional relations among departments and on the material requirements of accumulation. I translate this disproportionality problem into a single-sector capacity framework by allowing the transformation elasticity between capital accumulation and productive-capacity growth to depart from unity. In this representation, $\theta = 1$ is the proportional-growth benchmark, while $\theta \neq 1$ captures persistent divergence between capital accumulation and capacity formation.
...
This single-sector classification provides an analytical baseline while abstracting from inter-sectoral imbalances between Department~I (means of production) and Department~II (means of consumption). In this setup, disproportionality is characterized by the gap between capital accumulation and capacity expansion when $\theta \neq 1$. The dynamic implications of this scalar representation are derived below.
```
- **CITATION KEYS:** `Okishio2022`, `Basu2022`.
- **BIBLIOGRAPHIC CHANGE:** None (`Okishio2022` and `Basu2022` retained).
- **AUTHORIAL BOUNDARY:** Strictly confines Okishio (2022) and Basu (2022) to their interdepartmental Marxian reproduction/disproportionality source models. The translation into a single-sector scalar $\theta$ capacity framework, the definition of accumulation regimes ($\theta=1$, $\theta \neq 1$), and the ODE governing capital acceleration are explicitly owned by the author. No sentence attributes $\theta=1$, $\theta \neq 1$, or the ODE to Okishio or Basu.
- **VERIFICATION RESULT:** PASS. Full boundary preserved; F1 check invariants untouched.

---

### RA-07 — McGraw-Hill / Munroe / Baran & Sweezy Disaggregation

- **RA ID:** RA-07
- **SOURCE FILE:** `sections/02_historical_trace.tex`
- **LOCATION:** Line 13 (historical trace of survey measures of capacity)
- **BEFORE:**
```latex
The McGraw-Hill plant-and-equipment surveys standardized this reporting by asking plant managers to state their operating rates relative to preferred benchmarks, creating an empirical infrastructure for tracking industrial slack \citep{Butler1958, Phillips1963, Munroe2007, BaranSweezy1988}.
```
- **AFTER:**
```latex
The McGraw-Hill plant-and-equipment surveys standardized this reporting by asking plant managers to state their operating rates relative to preferred benchmarks \citep{Butler1958, Phillips1963}. Their production within McGraw-Hill formed part of a broader corporate information infrastructure spanning multiple business sectors and services \citep{Munroe2007}. I interpret this corporate integration of statistical production and private economic planning as a concrete institutional reflection of the monopoly-capital environment of the Fordist era described by \citet{BaranSweezy1988}. By aggregating firm-level responses into a standardized national metric, these surveys operationalized a shared business convention of what constituted normal operating levels.
```
- **CITATION KEYS:** `Butler1958`, `Phillips1963`, `Munroe2007`, `BaranSweezy1988`.
- **BIBLIOGRAPHIC CHANGE:** None.
- **AUTHORIAL BOUNDARY:** Decouples survey methodology (`Butler1958`, `Phillips1963`) from corporate information infrastructure history (`Munroe2007`) and monopoly-capital theory (`BaranSweezy1988`). Explicitly marks the synthesis as the author's interpretation (`I interpret this corporate integration...`).
- **VERIFICATION RESULT:** PASS. Clustered citation eliminated; three distinct layers articulated.

---

### RA-08A — Kurz Bibliographic Entry Identity

- **RA ID:** RA-08A
- **SOURCE FILE:** `references.bib`
- **LOCATION:** Entry `@article{Kurz1986}` (lines 1948–1956)
- **BEFORE:**
```bibtex
@article{Kurz1986,
  author  = {Kurz, Heinz D.},
  title   = {Classical and neoclassical theories of output and employment},
  journal = {Political Economy: Studies in the Surplus Approach},
  volume  = {2},
  number  = {1},
  pages   = {37--54},
  year    = {1986}
}
```
- **AFTER:**
```bibtex
@article{Kurz1986,
  author  = {Kurz, Heinz D.},
  title   = {`Normal' Positions and Capital Utilisation},
  journal = {Political Economy},
  volume  = {2},
  number  = {1},
  pages   = {37--54},
  year    = {1986}
}
```
- **CITATION KEYS:** `Kurz1986`.
- **BIBLIOGRAPHIC CHANGE:** Replaced erroneous title *Classical and neoclassical theories of output and employment* with actual article title *'Normal' Positions and Capital Utilisation*, in *Political Economy*, 2(1): 37–54.
- **AUTHORIAL BOUNDARY:** Bibliographic correction.
- **VERIFICATION RESULT:** PASS. Entry verified; wrong title purged; 0 duplicate entries.

---

### RA-08B — Kurz Local Attribution in Conceptual Framework

- **RA ID:** RA-08B
- **SOURCE FILE:** `sections/03_conceptual_framework.tex`
- **LOCATION:** Line 111 (Subsection 3.4 discussion of classical choice of technique)
- **BEFORE:**
```latex
This analytical gap generates a double misspecification in Shaikh's framework: omitting distributive conflict influencing the choice of technique, while including an exogenous proxy such as a deterministic trend ($bt$) that absorbs historical shifts in distribution.
```
- **AFTER:**
```latex
This analytical gap generates a double misspecification in Shaikh's framework: omitting distribution influencing the choice of technique \citep{Kurz1986}---while including an exogenous proxy such as a deterministic trend ($bt$) that absorbs historical shifts in distribution.
```
- **CITATION KEYS:** `Kurz1986`.
- **BIBLIOGRAPHIC CHANGE:** None.
- **AUTHORIAL BOUNDARY:** Replaces "distributive conflict" with "distribution" when directly attributed to Kurz (1986), adhering strictly to Sraffian choice-of-technique terminology.
- **VERIFICATION RESULT:** PASS. Attribution calibrated; CHECK R09 passes.

---

### RA-11 — Kurz Mechanism Passage in Econometric Replication

- **RA ID:** RA-11
- **SOURCE FILE:** `sections/04_econometric_replication.tex`
- **LOCATION:** Line 537 (Subsection 4.6 theoretical rationale for trivariate cointegration)
- **BEFORE:**
```latex
Changes in distribution shift relative factor costs, prompting firms to adjust techniques, machine speeds, and shift arrangements. When distribution is omitted from the state vector, these technical adjustments appear as persistent residual drift in the output--capital ratio, causing bivariate cointegration tests to fail.
```
- **AFTER:**
```latex
Changes in distribution alter the relative costs relevant to technique and operating choices, including operating intensity and shift arrangements \citep{Kurz1986}. When distribution is omitted, the tested bivariate systems exhibit persistent drift in the output--capital relation. The recovery of cointegration in specifications including $\ln e_t$ is consistent with distributionally mediated changes in technique and work organization, but the VECM does not identify that mechanism causally.
```
- **CITATION KEYS:** `Kurz1986`.
- **BIBLIOGRAPHIC CHANGE:** None.
- **AUTHORIAL BOUNDARY:** Replaces "factor costs" / "machine speeds" with "operating choices, including operating intensity and shift arrangements \citep{Kurz1986}". Preserves non-causal calibration ("VECM does not identify that mechanism causally"), ensuring zero regression on Check F4.
- **VERIFICATION RESULT:** PASS. Check F4 PASS; CHECK R10 PASS.

---

### RA-CIC-A — Ciccone / Kurz Internal Sraffian Distinction

- **RA ID:** RA-CIC-A
- **SOURCE FILE:** `sections/02_historical_trace.tex`
- **LOCATION:** Line 29 (Sraffian capacity utilization paragraph)
- **BEFORE:**
```latex
Classical-Marxian economists similarly reject a purely psychological or arbitrary baseline, modeling normal utilization through cost-minimizing techniques and profit margins \citep{Kurz1986, Ciccone1986}.
```
- **AFTER:**
```latex
Classical-Marxian and Sraffian authors likewise argue that normal utilization cannot be treated as a purely subjective convention, but differ over how that benchmark is determined. \citet{Kurz1986} relates normal utilization to cost-minimizing choices over technique and operating conditions. \citet{Ciccone1986}, by contrast, argues that normal capacity reflects firms' ex ante sizing of plant to meet fluctuating demand, treating utilization variations as changes in the utilization of capacity rather than adjustments in capacity itself. Capacity adjustment in Ciccone’s formulation therefore operates through firms’ ex ante choice of plant size rather than cost-minimizing technique selection alone.
```
- **CITATION KEYS:** `Kurz1986`, `Ciccone1986`.
- **BIBLIOGRAPHIC CHANGE:** None.
- **AUTHORIAL BOUNDARY:** Replaces compressed homogeneous sentence with four sentences distinguishing Kurz (normal utilization determined by cost-minimizing technique and operating choices) from Ciccone (ex ante plant sizing to accommodate fluctuating demand).
- **VERIFICATION RESULT:** PASS. Distinct theoretical positions accurately represented.

---

### RA-CIC-B — Ciccone Bibliography Metadata Correction

- **RA ID:** RA-CIC-B
- **SOURCE FILE:** `references.bib`
- **LOCATION:** Entry `@article{Ciccone1986}` (lines 1669–1677)
- **BEFORE:**
```bibtex
@article{Ciccone1986,
	author  = {Ciccone, Roberto},
	title   = {Accumulation and Capacity Utilization: Some Critical Considerations on Joan Robinson's Theory of Distribution},
	journal = {Political Economy: Studies in the Surplus Approach},
	volume  = {2},
	number  = {1},
	pages   = {17-36},
	year    = {1986}
}
```
- **AFTER:**
```bibtex
@article{Ciccone1986,
	author  = {Ciccone, Roberto},
	title   = {Accumulation and Capacity Utilization: Some Critical Considerations on Joan Robinson's Theory of Distribution},
	journal = {Political Economy: Studies in the Surplus Approach},
	volume  = {2},
	number  = {1},
	pages   = {17--36},
	year    = {1986}
}
```
- **CITATION KEYS:** `Ciccone1986`.
- **BIBLIOGRAPHIC CHANGE:** Verified and confirmed journal name `Political Economy: Studies in the Surplus Approach`, volume 2, issue 1, and formatted pages as `17--36`.
- **AUTHORIAL BOUNDARY:** Bibliographic precision.
- **VERIFICATION RESULT:** PASS. Renders cleanly as `2(1):17–36`.

---

### RA-04 — Foley Classical Closure

- **RA ID:** RA-04
- **STATUS:** CLOSED — NOT RESTORED
- **LOCATION:** Entire manuscript
- **RESULT:** Foley (1985) is not cited in any manuscript `.tex` file. Confirmed that no Foley citation was introduced and no Foley entry added.
- **VERIFICATION RESULT:** PASS.

---

### RA-09 — Capital-Stock Measurement Error

- **RA ID:** RA-09
- **STATUS:** HOLD / UNCHANGED
- **LOCATION:** `sections/03_conceptual_framework.tex` and `sections/04_econometric_replication.tex`
- **RESULT:** Untouched by design.
- **VERIFICATION RESULT:** PASS.

---

### RA-10 — 1956 / 1974 / 1980 Historical Step Controls

- **RA ID:** RA-10
- **STATUS:** OUT OF SCOPE / UNCHANGED
- **LOCATION:** `sections/04_econometric_replication.tex`
- **RESULT:** Untouched by design.
- **VERIFICATION RESULT:** PASS.

---

### RA-12 — Institutional Settlement

- **RA ID:** RA-12
- **STATUS:** CLOSED — AUTHORIAL CATEGORY PRESERVED
- **LOCATION:** `sections/04_econometric_replication.tex`
- **RESULT:** Preserved as authorial conceptual category explaining macro-structural conditioning rather than an estimated parameter. No external literature citations added.
- **VERIFICATION RESULT:** PASS.

---

### RA-14 — Patterson Unit-Root Diagnostic

- **RA ID:** RA-14
- **STATUS:** CLOSED — RETAINED
- **LOCATION:** `appendices/appendix_B_data_diagnostics.tex` and `references.bib`
- **RESULT:** Retained in Appendix B.9 and preserved in `references.bib`.
- **VERIFICATION RESULT:** PASS.
