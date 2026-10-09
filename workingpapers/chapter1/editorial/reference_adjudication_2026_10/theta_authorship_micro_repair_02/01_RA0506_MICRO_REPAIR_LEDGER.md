# REFERENCE ATTRIBUTION MICRO-REPAIR 02 — THETA AUTHORSHIP CONSISTENCY
## 01_RA0506_MICRO_REPAIR_LEDGER.md

**Date:** 2026-10-09  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Scope Enforcement:** EXACTLY TWO MANUSCRIPT LOCATIONS MODIFIED  

---

### Row A — Introduction

- **SOURCE FILE:** `sections/01_introduction.tex`
- **LINE RANGE:** Line 6
- **BEFORE (EXACT TEXT):**
```latex
To evaluate this relation, I reframe the aggregate output--capital coefficient as a capacity transformation elasticity ($\theta \equiv \partial \ln Y^p / \partial \ln K$). Under the balanced-growth knife-edge assumption standard in post-Keynesian models, this elasticity is constrained to unity ($\theta = 1.0$), meaning productive capacity expands in lockstep with capital accumulation. When $\theta \neq 1.0$, however, capacity formation decouples from accumulation: an elasticity below unity ($\theta < 1.0$) defines structural overaccumulation, where capital accumulates faster than capacity expands, while $\theta > 1.0$ generates chronic excess capacity. Reconstructing Shaikh's single-equation ARDL(2,4) baseline (Stage S0) demonstrates that the estimation is approximately reproducible within canonical data bounds ($\hat{\theta} \approx 0.72$ versus Shaikh's published 0.66), yielding a point estimate within the structural overaccumulation interval.
```
- **AFTER (EXACT TEXT):**
```latex
To evaluate this relation, I reframe the aggregate output--capital coefficient as a capacity transformation elasticity ($\theta \equiv \partial \ln Y^p / \partial \ln K$). I use $\theta = 1$ to represent the balanced-growth knife-edge in which productive capacity expands in lockstep with capital accumulation. When $\theta \neq 1$, however, capacity formation decouples from accumulation: an elasticity below unity ($\theta < 1$) defines structural overaccumulation, where capital accumulates faster than capacity expands, while $\theta > 1$ generates chronic excess capacity. Reconstructing Shaikh's single-equation ARDL(2,4) baseline (Stage S0) demonstrates that the estimation is approximately reproducible within canonical data bounds ($\hat{\theta} \approx 0.72$ versus Shaikh's published 0.66), yielding a point estimate within the structural overaccumulation interval.
```
- **ATTRIBUTION PROBLEM:** The legacy phrasing `"Under the balanced-growth knife-edge assumption standard in post-Keynesian models, this elasticity is constrained to unity ($\theta = 1.0$)"` inadvertently implied that the literature provided the paper's scalar capacity transformation parameterization $\theta$.
- **OWNERSHIP INVARIANT ENFORCED:** Enforces first-person authorial ownership: `"I use $\theta = 1$ to represent the balanced-growth knife-edge..."`, establishing that the scalar parameter $\theta$ and the $\theta=1$ benchmark are the author's analytical abstraction.
- **CITATIONS CHANGED:** NONE.
- **VERIFICATION RESULT:** PASS.

---

### Row B — Section 3.3

- **SOURCE FILE:** `sections/03_conceptual_framework.tex`
- **LINE RANGE:** Lines 62–64
- **BEFORE (EXACT TEXT):**
```latex
Marxian reproduction theory provides a benchmark of proportional accumulation, as formalized in different ways by \citet{Okishio2022} and \citet{Basu2022}. In those formulations, the problem is interdepartmental: reproduction depends on proportional relations among departments and on the material requirements of accumulation. I translate this disproportionality problem into a single-sector capacity framework by allowing the transformation elasticity between capital accumulation and productive-capacity growth to depart from unity. In this representation, $\theta = 1$ is the proportional-growth benchmark, while $\theta \neq 1$ captures persistent divergence between capital accumulation and capacity formation. In canonical post-Keynesian and classical models, balanced growth is represented by a unitary transformation elasticity ($\theta = 1.0$), ensuring that productive capacity expands in lockstep with the capital stock ($g_{Y^p} = g_K$). Combined with demand-driven investment, this unitary assumption generates the Harrodian knife-edge baseline.

Relaxing the unitary assumption introduces an unbalanced growth closure ($\theta \neq 1$), where capacity formation systematically diverges from capital accumulation. Table~\ref{tab:growth_regimes} defines the three resulting accumulation regimes.
```
- **AFTER (EXACT TEXT):**
```latex
Marxian reproduction theory provides a benchmark of proportional accumulation, as formalized in different ways by \citet{Okishio2022} and \citet{Basu2022}. In those formulations, the problem is interdepartmental: reproduction depends on proportional relations among departments and on the material requirements of accumulation. I translate this disproportionality problem into a single-sector capacity framework by allowing the transformation elasticity between capital accumulation and productive-capacity growth to depart from unity. In this representation, $\theta = 1$ is the proportional-growth benchmark, while $\theta \neq 1$ captures persistent divergence between capital accumulation and capacity formation.

Within this scalar representation, relaxing the proportional-growth benchmark ($\theta = 1$) introduces an unbalanced-growth closure ($\theta \neq 1$), where capacity formation systematically diverges from capital accumulation. Table~\ref{tab:growth_regimes} defines the three resulting accumulation regimes.
```
- **ATTRIBUTION PROBLEM:** The legacy sentence `"In canonical post-Keynesian and classical models, balanced growth is represented by a unitary transformation elasticity ($\theta = 1.0$)..."` attributed the paper's scalar parameter $\theta$ to canonical classical and post-Keynesian models, blurring the authorial boundary.
- **OWNERSHIP INVARIANT ENFORCED:** Replaced the stale sentence and redundant transition with `"Within this scalar representation, relaxing the proportional-growth benchmark ($\theta = 1$) introduces an unbalanced-growth closure ($\theta \neq 1$)..."`. Okishio (2022) and Basu (2022) remain strictly at the interdepartmental source layer, while the scalar framework and regime definitions are author-owned.
- **CITATIONS CHANGED:** NONE.
- **VERIFICATION RESULT:** PASS.

---

### Scope Audit Summary

- Total Substantive Manuscript Rows: **EXACTLY 2**
- Scope Audit Status: **PASS**
