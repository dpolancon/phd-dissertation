# REFERENCE ATTRIBUTION MICRO-REPAIR 02 — THETA AUTHORSHIP CONSISTENCY
## 00_SCOPE_AND_AUTHORSHIP_LOCK.md

**Date:** 2026-10-09  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Active Working Paper:** `workingpapers\chapter1\`  
**Master Document:** `workingpapers\chapter1\working_paper.tex`  
**Cumulative Verifier:** `workingpapers\chapter1\tools\final_pass.py` (v1.2 — FROZEN)  
**Accepted Baseline Commit:** `d786eda`  

---

### 1. Purpose & Scope Boundary

The purpose of this surgical micro-repair pass is to eliminate two legacy sentences that blurred the distinction between the literature's interdepartmental reproduction/disproportionality problem and the present paper's scalar capacity transformation elasticity ($\theta$) representation.

**Scope Lock:**
Only TWO manuscript locations are authorized for modification:
1. **Introduction:** The paragraph introducing $\theta$ and the balanced-growth benchmark (`sections/01_introduction.tex`).
2. **Section 3.3:** The paragraph immediately following the corrected Okishio/Basu handoff (`sections/03_conceptual_framework.tex`).

No other manuscript sections, files, bibliography entries, or verifiers may be modified.

---

### 2. Governing Authorship Invariant Hierarchy

The authorship hierarchy governing the conceptual framework is locked as follows:

- **L1 — LITERATURE (Okishio 2022; Basu 2022):**
  - Formalize Marxian reproduction theory in different ways;
  - Analyze proportionality versus disproportionality;
  - Formulate the problem in multi-departmental / material reproduction terms (Department I vs. Department II).
- **L2 — PRESENT PAPER'S ABSTRACTION:**
  - Translates the interdepartmental disproportionality problem into a single-sector capital–capacity framework;
  - Defines $\theta \equiv \partial \ln Y^p / \partial \ln K$ as the transformation elasticity linking productive-capacity growth to capital accumulation.
- **L3 — PRESENT PAPER'S BENCHMARKS:**
  - Uses $\theta = 1$ as the authorial proportional-growth knife-edge benchmark;
  - Uses $\theta \neq 1$ as the scalar representation of persistent divergence between capital accumulation and productive-capacity formation (overaccumulation $\theta < 1$, excess capacity $\theta > 1$).
- **L4 — PRESENT PAPER'S DYNAMICS:**
  - Derives the ordinary differential equation (Bernoulli ODE);
  - Derives the equilibria ($\hat{k}^* = 0$ stable stagnation attractor, $\hat{k}^* = -\delta$ boundary);
  - Derives the phase stability properties.
  - The dynamical framework is entirely author-derived.

---

### 3. Hard Negative Constraints

The manuscript must never state or imply:
- "Okishio's $\theta$" or "Basu's $\theta$";
- "Okishio's balanced-reproduction condition is $\theta = 1$";
- "canonical classical models use $\theta = 1$";
- "canonical post-Keynesian models use the transformation elasticity $\theta$";
- "the literature constrains $\theta$ to unity";
- "$\theta \neq 1$ is Okishio's model";
- "the ODE is derived from Okishio or Basu";
- nor attach Okishio or Basu citations to $\theta = 1$, $\theta \neq 1$, Table 1, or the ODE.

---

### 4. Untouched Invariants

The following components remain strictly UNTOUCHED:
- `references.bib` (0 edits, 0 new references);
- All other sections (`sections/02_historical_trace.tex`, `sections/04_econometric_replication.tex`, `sections/05_discussion_conclusion.tex`);
- All appendices (`appendices/appendix_A_ODE.tex`, `appendices/appendix_B_data_diagnostics.tex`);
- All figures and tables;
- Empirical repository `Critical-Replication-Shaikh` (untouched);
- Verifier `tools/final_pass.py` (frozen at v1.2);
- Root scripts (`scripts/export_working_paper.py`, `scripts/toggle_paragraph_numbers.py`).
