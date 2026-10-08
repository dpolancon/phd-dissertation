# 00 — Repair Scope: Editorial Integration Repair Pass 02.1

**Session:** EDITORIAL INTEGRATION REPAIR PASS 02.1  
**Target Repository:** `C:\ReposGitHub\phd-dissertation\workingpapers\chapter1`  
**Date:** October 7, 2026  
**Auditor / Editor:** Diego Polanco & Editorial Integration Team  
**Manuscript:** *Replicating Shaikh's Capacity Utilization Measure: Specification Sensitivity and Distribution*

---

## 1. Directive & Mission Statement

Editorial Integration Pass 02 established the foundational working-paper architecture:
- Locked title implemented;
- 7-paragraph Introduction established;
- Separate Discussion and Conclusion created;
- Conceptual handoff of institutional settlement structured.

An external audit of Pass 02 identified empirical-governance inconsistencies in the implementation and reconciliation reports. Pass 02.1 is a **controlled repair pass** designed to resolve these specific inconsistencies without reopening the paper wholesale, changing the locked title, altering the core structure, or performing unauthorized empirical re-estimation.

---

## 2. Inventory of Issues and Targeted Repairs

1. **Issue 1 (E-01 Capital Integration Order):** Reopen E-01. Rejection of unit root in $\Delta^2 k_t$ does not rule out $I(2)$ or prove $I(1)$ for $k_t$. Existing tests for $\Delta k_t$ (ADF, PP) fail to reject at 5%. Since no existing diagnostic independently establishes stationarity for $\Delta k_t$, set `E-01 STATUS: OPEN`, create a bounded follow-up request, and remove claims of "confirmed $I(1)$ validity" from the manuscript.
2. **Issue 2 (E-02 Admissibility Gate Taxonomy):** Resolve the contradiction between the $p > 0.05$ Residual Diagnostic Gate and the focal model's Breusch-Godfrey LM(4) $p = 0.006$. Restructure the taxonomy to match the empirical pipeline: the mechanical S2 survival gate consists of (1) convergence, (2) Johansen rank ($r=1$), and (3) companion matrix stability. Residual diagnostics are treated as subsequent quality assessments.
3. **Issue 3 (E-04 Variance Decomposition Claim):** Audit the $5.6\%, 5.0\%, 99.1\%$ calculation. These are marginal variance ratios ($\text{Var}(C_i)/\text{Var}(\beta' X)$) that omit large negative covariance terms and sum to $109.7\%$. Remove "99.1%" from Abstract, Introduction, and Conclusion. In Section 4.6, explain the exact non-additive construction. Reframe as an asymmetry of precision ($\hat{\beta}_e$ precisely identified vs $\hat{\theta}$ imprecisely identified).
4. **Issue 4 (E-05 Dummy Nomenclature):** Establish explicit notation separating step estimation controls ($S_{yy,t} \equiv \mathbf{1}\{t \ge yy\}$) from pulse diagnostic variables ($P_{yy,t} \equiv \mathbf{1}\{t = yy\}$). Repair Table 4, Section 4.1, Section 4.2, Section 4.6, Table 10, and Appendix B.
5. **Issue 5 (E-06 Specification Counts):** Audit and reconcile S2 attempted (48 per block, 144 total) versus estimated (36 per block, 108 total, due to 12 non-converging $C_1$ models). Distinguish attempted and estimated across all tables and text. Correct S1 grid to $p,q \in \{1,\dots,5\}$ (500 models).
6. **Issue 6 (Introduction S1 Count):** Replace undocumented "135" in Introduction with exact documented admissibility counts from Table 7 (102 at 10%, 62 at 5%).
7. **Issue 7 (Deterministic-Case Labels):** Build a global dictionary for $C_0, C_1, C_2, C_3$. Correct $C_2$ from "restricted constant" to "unrestricted short-run constant" (absorbing linear drift in levels).
8. **Issue 8 (E-07 Two-Tier Taxonomy):** Disentangle Tier 2 from circular filtering by $\theta < 1$. Rename Tier 2 to "Preferred Deterministic-Branch Specifications ($C_2$)", justified ex-ante by linear drift absorption, describing $\theta$ outcomes afterward.
9. **Issue 9 (Overaccumulation Framing):** Clarify that S1 provides the empirical evidence for sub-unitary $\theta$, whereas S2 overaccumulation is an interpretation conditional on the focal point estimate ($\hat{\theta} = 0.727, \text{SE} = 4.852$), not statistically established.
10. **Issue 10 (Half-Life Statement):** Delete the $\ln(2)/0.019 \approx 37$ years statement as unestablished for multivariate VECM adjustment dynamics.
11. **Issue 11 (Self-Citation / Dissertation Reference):** Remove formal bibliographic citation to `Polanco (2026)` from front matter and `references.bib`. Maintain factual note regarding dissertation origin.
12. **Issue 12 (Global Claim Calibration):** Soften uncalibrated words ("demonstrates", "only", "requires", "fundamentally") across Section 4.7, Discussion, and Conclusion.

---

## 3. Git Mode & Boundary Constraints

- **Strict Git Mode:** NO COMMIT, NO PUSH, NO MERGE, NO BRANCH CREATION.
- **Repository Boundaries:** Only modify files inside `workingpapers/chapter1/`. Zero edits to `Chapter1/` or other directories.
- **Empirical Boundary:** Zero new estimation.
