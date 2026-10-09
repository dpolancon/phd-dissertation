# 05 — Post-Repair PDF Smoke Test

**Severity:** Verification  
**Status:** PASSED  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target Document:** `workingpapers/chapter1/working_paper.pdf` (56 pages, 1,981,817 bytes)  
**Compilation:** `latexmk -pdf -interaction=nonstopmode working_paper.tex` (Exit Code 0)  
**Date:** October 2026  

---

## 1. Executive Summary

A comprehensive page-by-page visual and textual audit of the newly rendered 56-page PDF (`working_paper.pdf`) was conducted following the implementation of repairs R1 through R8. All eight reader-level issues have been verified in the rendered document. No new layout defects, orphan headings, broken math strings, or undefined references/citations were introduced.

---

## 2. Page-by-Page Smoke Test Ledger

| Target Page(s) | Section / Object | Focus of Audit | Observed Rendered State | Verdict |
|:---|:---|:---|:---|:---|
| **Page 1** | Title & Abstract | Title lock; $\hat{\theta}$ qualification ($[0.65, 0.95]$ vs $2.20$) | Locked title intact. Abstract states: *"expanding the specification space across a 500-model ARDL lattice reveals substantial sensitivity (with $\hat{\theta} \in [0.65, 0.95]$ among retained no-trend specifications, while trend-containing models reach 2.20)"*. | **PASS** |
| **Pages 2–3** | Introduction | S1 sensitivity; nested admissibility; VECM scope; causal calibration | P. 2 qualifies $\hat{\theta} \in [0.65, 0.95]$ among retained no-trend specifications while trend-containing reach 2.20. Reports 102 models at 10% and 62 at 5%. Reports 48 attempted bivariate VECMs (36 successfully estimated). Distributionally conditioned framing intact. | **PASS** |
| **Pages 9–10** | §3.3, Table 1, Fig. 1 | R1 theoretical dynamics; stagnation equilibrium at $\hat{k}^*=0$; initial acceleration $\mp 0.048\%$ | Table 1 reports: *"Accumulation decelerates toward stagnation ($\hat{k}^* = 0$)"*. §3.3 prose states deceleration toward *"stable stagnation equilibrium at $\hat{k}^* = 0$"*. Figure 1 correctly displays $\hat{k}^*=0$ as stable attractor in Panel A with leftward flow arrows for $\hat{k}>0$ and rightward for $(-\delta, 0)$; $\hat{k}^*=-\delta$ labeled unstable. Initial acceleration annotated as $\mp 0.048\%$. Caption completely reconciled. | **PASS** |
| **Pages 20–21** | §4.2, Fig. 4, §4.3 | Growth rates; Fig. 4 caption (R8); admissibility criteria (R4); no-dummy qualification (R2) | Fig. 4 caption states: *"Annual growth rates of output ($\Delta y_t$) and gross capital ($\Delta k_t$), 1947–2011"* (unplotted net capital removed). §4.3 explicitly defines outer admissibility as $p_F \le 0.10$ with 5% and 1% nested subsets. Explains $t$-bounds bypass for Cases II and IV. Qualifies no-dummy counterfactual: *"Most surviving specifications require historical step controls... although a small subset of no-dummy models remains $F$-admissible under restricted intercept configurations (PSS Case II)"*. | **PASS** |
| **Page 24** | Table 6 & §4.5 | R2 Case II $t$-bounds; focal model diagnostics; no-dummy survival | RICOMP focal model correctly reports $F$-bounds `3.269 (Case 2) [Reject **]` and $t$-bounds `— (not defined for Case II)`. Table note explicitly states: *"The $t$-bounds test is defined only for Cases I, III, and V; it is not defined for Case II"*. Text reports 102 at 10%, 62 at 5%, 13 at 1%, with 92% requiring historical controls and 8% no-dummy surviving under Case II. | **PASS** |
| **Pages 26–28** | §4.5, Table 8, Fig. 7, Fig. 8 | R6 $\hat{\theta}$ range qualification; trend-containing sensitivity | Table 8 reports Max $\hat{\theta} = 2.20$ under BIC and HQ. P. 27 explains: *"In no-trend configurations (PSS Cases I, II, and III), surviving elasticities lie below unity ($\hat{\theta} \in [0.65, 0.95]$)... Conversely, trend-containing configurations (Cases IV and V) produce elasticities averaging 1.36 and reaching up to 2.20"*. P. 28 synthesis repeats exact qualified range. | **PASS** |
| **Pages 29–35** | §4.6, Table 11, §4.7 | R7A S2 taxonomy; R7B causal calibration; VECM counts | P. 31 classifies $C_3$ branch as *"Statistical survivor; not preferred"*. Table 11 labels $C_3$ models as *"Tier 1 statistical survivor; not preferred under deterministic criterion (trend overparameterization)"*. P. 34 states: *"Conditioning on $\ln e_t$ accounts for these distributionally mediated shifts..."* and clarifies institutional settlements as conceptual interpretation. Table 12 reports cross-stage synthesis. | **PASS** |
| **Pages 35–38** | §5, §6 | Discussion & Conclusion; Sraffa–Kalecki calibration; final summary | Discussion (p. 36) qualifies $\hat{\theta} \in [0.65, 0.95]$ in no-trend models; calibrates Sraffa-Kalecki error-correction implications without overstatement. Conclusion (p. 37) qualifies $[0.65, 0.95]$ in no-trend and 2.20 in trend models; restates 48 attempted / 36 estimated bivariate VECMs failing cointegration. | **PASS** |
| **Pages 48–51** | App. B.1–B.7, Table 14, Table 15 | Provenance notes; pulse vs step indicators; ERS/KPSS/ZA unit root tests | Table 14 note clarifies $P_{56}, P_{74}, P_{80}$ are descriptive pulse indicators while estimation uses permanent step indicators $S_{yy,t}$. Table 15 reports full unit root suite on $\Delta k_t$: ERS ($P_T = 2.40 < 3.11$, reject unit root at 5%), KPSS ($LM = 0.28 < 0.46$, fail to reject stationarity), ZA (Model A, 1963 break, stat $-3.75 > -4.80$, fail to reject unit root). | **PASS** |
| **Pages 52–53** | App. B.8, Table 16 | R3 legacy language elimination; illustrative diagnostic subset | P. 52 states: *"Table 16 displays an illustrative diagnostic subset of the specification grid ($p, q \in \{1, \dots, 5\}$; Cases I–V)..."*. Table 16 note states: *"Illustrative diagnostic subset of ARDL($p,q$) specifications estimated with permanent step controls $S_{1956}, S_{1974}, S_{1980}$... Full 500-model specification grid ($p, q \in \{1, \dots, 5\}$; Cases I–V; four dummy configurations) available in replication code"*. All legacy "impulse dummies" and "1–6 lags" removed. | **PASS** |
| **Pages 54–56** | App. B.9–B.10 | Figures 17–22; final appendix page | Figure 21 note distinguishes pulse shock markers from permanent estimation step controls. Figure 22 correctly renders series construction flowchart. Clean visual termination at page 56. | **PASS** |

---

## 3. Visual & Typographical Smoke Test Checks

1. **Overfull / Underfull Boxes:**
   - Log inspection shows only standard benign microtype math formula warnings (e.g., long variable subscripts in Appendix B data descriptions).
   - No margins clipped, no table column collisions, no text overflow into page numbers or headers.
2. **Floats and Placement:**
   - All 22 figures and 16 tables placed properly near their textual invocations.
   - LaTeX warning `Text page 55 contains only floats` checked: page 55 cleanly hosts Figure 19 (baseline residual diagnostics) and Figure 20 ($\theta$ stability grid).
3. **Bibliography and Hyperlinks:**
   - `working_paper.bbl` integrated cleanly with 0 undefined citations (`LaTeX Warning: Citation ... undefined` count: 0).
   - All internal section, table, and equation references resolved with 0 broken references (`LaTeX Warning: There were undefined references` count: 0).

---

## 4. Verification Conclusion

The rendered document `working_paper.pdf` is completely free of the contradictions identified in reader-level audit 03. All theoretical equations, econometric tables, empirical descriptions, and interpretive boundaries are aligned and mutually reinforcing.
