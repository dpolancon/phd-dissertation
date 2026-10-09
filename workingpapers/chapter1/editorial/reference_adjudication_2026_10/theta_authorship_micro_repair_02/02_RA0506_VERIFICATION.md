# REFERENCE ATTRIBUTION MICRO-REPAIR 02 — THETA AUTHORSHIP CONSISTENCY
## 02_RA0506_VERIFICATION.md

**Date:** 2026-10-09  
**Check ID:** `RA0506_THETA_AUTHORSHIP`  
**Target:** Source & Rendered Layer Verification for $\theta$ Authorship and Attribution Boundaries  

---

### 1. Source-Layer Required Semantics Evaluation

| Invariant Item | Required Semantic Condition | Observed Manuscript Text | Evaluation |
|---|---|---|---|
| **1. Intro First-Person Ownership** | Introduction explicitly uses first-person ownership for $\theta = 1$ (`"I use \theta = 1..."`) | `sections/01_introduction.tex` line 6: *"I use $\theta = 1$ to represent the balanced-growth knife-edge in which productive capacity expands in lockstep with capital accumulation."* | **PASS** |
| **2. Section 3.3 Translation Ownership** | Section 3.3 contains first-person ownership of translation (`"I translate this disproportionality problem..."`) | `sections/03_conceptual_framework.tex` line 62: *"I translate this disproportionality problem into a single-sector capacity framework by allowing the transformation elasticity between capital accumulation and productive-capacity growth to depart from unity."* | **PASS** |
| **3. Section 3.3 Representation Framing** | Section 3.3 contains `"In this representation..."` and/or `"Within this scalar representation..."` | `sections/03_conceptual_framework.tex` line 62 & 64: *"In this representation, $\theta = 1$ is the proportional-growth benchmark..."* and *"Within this scalar representation, relaxing the proportional-growth benchmark..."* | **PASS** |
| **4. Literature Confined to Disproportionality** | Okishio/Basu retained only at interdepartmental reproduction layer | `sections/03_conceptual_framework.tex` line 62: *"Marxian reproduction theory provides a benchmark of proportional accumulation, as formalized in different ways by \citet{Okishio2022} and \citet{Basu2022}. In those formulations, the problem is interdepartmental..."* | **PASS** |
| **5. ODE Derivation Author-Owned** | The ODE derivation in Section 3.3 and Appendix A has zero Okishio/Basu attribution | Section 3.3 lines 84–86 and Appendix A contain zero occurrences of Okishio or Basu. The dynamical derivation is explicitly presented as the author's dynamic formalization. | **PASS** |

---

### 2. Negative Constraints & Forbidden Patterns Audit

| Forbidden Pattern / Semantic Equivalence | Target Section | Pattern Scan Result | Result |
|---|---|---|---|
| `"canonical post-Keynesian and classical models"` + `"\theta"` | Section 3.3 | Zero matches. Stale legacy sentence completely purged. | **PASS** |
| `"standard in post-Keynesian models"` + `"theta is constrained to unity"` | Introduction | Zero matches. Purged and replaced with authorial ownership. | **PASS** |
| `"Okishio"` within direct attribution to $\theta = 1$ | Entire manuscript | Zero matches. Okishio attached solely to interdepartmental models. | **PASS** |
| `"Basu"` within direct attribution to $\theta = 1$ | Entire manuscript | Zero matches. Basu attached solely to interdepartmental models. | **PASS** |
| `"Okishio"` directly attached to ODE derivation | Section 3.3 & Appendix A | Zero matches. | **PASS** |
| `"Basu"` directly attached to ODE derivation | Section 3.3 & Appendix A | Zero matches. | **PASS** |

---

### 3. Programmatic & Manual Verification Script Execution

The read-only audit script [`check_ra0506.py`](file:///C:/ReposGitHub/phd-dissertation/workingpapers/chapter1/editorial/reference_adjudication_2026_10/theta_authorship_micro_repair_02/check_ra0506.py) was executed with the following output:

```
RA0506_THETA_AUTHORSHIP Overall: PASS
  [PASS] intro_first_person_ownership: Found 'I use $\theta = 1$ to represent the balanced-growth knife-edge' in Introduction.
  [PASS] sec3_first_person_translation: Found 'I translate this disproportionality problem into a single-sector capacity framework' in Section 3.3.
  [PASS] sec3_scalar_representation_phrasing: Found 'In this representation...' and 'Within this scalar representation...' in Section 3.3.
  [PASS] forbidden_patterns_check: Zero forbidden literature-attribution patterns found.
  [PASS] ode_author_ownership: ODE derivation in Section 3.3 and Appendix A has zero Okishio/Basu attribution.
```

### Overall Decision: PASS
All required positive semantics are verified; zero forbidden negative patterns are detected.
