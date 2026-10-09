# APPENDIX A TERMINOLOGY MICRO-REPAIR 03 — TWO-LINE TECHNICAL WORDING PASS
## 01_TWO_LINE_REPAIR_LEDGER.md

**Date:** 2026-10-09  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target:** Standalone Chapter 1 Working Paper — Appendix A  

---

### Row A — Component Count Correction

- **FILE:** `appendices/appendix_A_ODE.tex`
- **LOCATION:** Opening paragraph (Line 4)
- **ISSUE:** Incorrect count of conceptual components (listed four components, but text stated "three components")
- **BEFORE:**
```latex
This appendix provides the derivation of the dynamical equations summarized in \S\ref{subsec:balanced_unbalanced_growth} and \S\ref{subsec:trend_stabilized_closure}. All results follow from three components: the net growth rate of the capital stock $\hat{k} \equiv \dot{K}/K$, the gross investment accounting identity $\hat{k} + \delta = I/K = \phi^p B$, the unbalanced growth closure $g_{Y^p} = \theta g_K$, and the investment-savings closure $\phi^p = s$.
```
- **AFTER:**
```latex
This appendix provides the derivation of the dynamical equations summarized in \S\ref{subsec:balanced_unbalanced_growth} and \S\ref{subsec:trend_stabilized_closure}. All results follow from four components: the net growth rate of the capital stock $\hat{k} \equiv \dot{K}/K$, the gross investment accounting identity $\hat{k} + \delta = I/K = \phi^p B$, the unbalanced growth closure $g_{Y^p} = \theta g_K$, and the investment-savings closure $\phi^p = s$.
```
- **CHANGE TYPE:** Wording only
- **MATHEMATICS CHANGED:** NO
- **CITATIONS CHANGED:** NO
- **RESULT:** PASS

---

### Row B — Bernoulli Terminology Correction

- **FILE:** `appendices/appendix_A_ODE.tex`
- **LOCATION:** Subsection A.1 (Line 29)
- **ISSUE:** Incorrect Bernoulli terminology (equation is a first-order differential equation with nonlinear exponent $n=2$, but was described as "order 2")
- **BEFORE:**
```latex
This is a Bernoulli equation of order 2 in $\hat{k}$, where the nonlinearity arises from the product $\hat{k}(\hat{k} + \delta)$.
```
- **AFTER:**
```latex
This is a first-order Bernoulli equation with exponent $n=2$, where the nonlinearity arises from the product $\hat{k}(\hat{k} + \delta)$.
```
- **CHANGE TYPE:** Terminology only
- **EQUATION CHANGED:** NO
- **DERIVATION CHANGED:** NO
- **CITATIONS CHANGED:** NO
- **RESULT:** PASS

---

### Ledger Scope Verification

- **Total Substantive Manuscript Repair Rows:** EXACTLY 2
- **Scope Audit:** PASS
