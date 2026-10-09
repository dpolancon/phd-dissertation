# CHAPTER 1 WORKING PAPER — REFERENCE ADJUDICATION IMPLEMENTATION PASS 01
## 00_SCOPE_AND_LOCKS.md

**Date:** 2026-10-09  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Active Working Paper Directory:** `workingpapers\chapter1\`  
**Empirical Source-of-Truth Repository:** `C:\ReposGitHub\Critical-Replication-Shaikh` (READ ONLY — UNTOUCHED)  
**Accepted Baseline Commit:** `d786eda` (*Finalize Chapter 1 working paper baseline*)  
**Verifier Script:** `workingpapers\chapter1\tools\final_pass.py` (v1.2 — FROZEN, UNTOUCHED)

---

### 1. Document Architecture & Resolved Source Files

- **Master TeX File:** `workingpapers\chapter1\working_paper.tex`
- **Active Bibliography File:** `workingpapers\chapter1\references.bib`
- **Section Source Files:**
  - `sections\01_introduction.tex`
  - `sections\02_historical_trace.tex`
  - `sections\03_conceptual_framework.tex`
  - `sections\04_econometric_replication.tex`
  - `sections\05_discussion_conclusion.tex`
  - `appendices\appendix_A_ODE.tex`
  - `appendices\appendix_B_data_diagnostics.tex`

---

### 2. Resolved Target Citation Keys

The citation keys in `references.bib` corresponding to the human-adjudicated target sources are resolved as follows:

| Target Literature / Author | Year | Resolved BibTeX Citation Key | File Location & Entry Type |
|---|---|---|---|
| Herndon, Ash & Pollin | 2014 | `HerndonAshPollin2014` | `@article`, Cambridge Journal of Economics |
| Ash, Basu & Dube | 2017 | `AshBasuDube2017` | `@techreport`, UMASS Amherst Working Paper |
| Gahn & González | 2020 | `GahnGonzalez2020` | `@article`, Cambridge Journal of Economics |
| Gahn & González | 2022 | `GahnGonzalez2022` | `@article`, Review of Keynesian Economics |
| Nikiforos | 2020 | `Nikiforos2020` | `@article`, Cambridge Journal of Economics |
| Felipe & McCombie | 2005 | `Felipe2005` | `@article`, Journal of Post Keynesian Economics |
| Kurz | 1986 | `Kurz1986` | `@article`, Political Economy: Studies in the Surplus Approach |
| Ciccone | 1986 | `Ciccone1986` | `@article`, Political Economy: Studies in the Surplus Approach |
| Okishio | 2022 | `Okishio2022` | `@book`, Springer / The Theory of Accumulation |
| Basu | 2022 | `Basu2022` | `@book`, Cambridge University Press / The Logic of Capital |
| Butler | 1958 | `Butler1958` | `@article`, American Economic Review |
| Phillips | 1963 | `Phillips1963` | `@article`, American Economic Review |
| Munroe | 2007 | `Munroe2007` | `@incollection`, Academic Publishing Industry |
| Baran & Sweezy | 1988 | `BaranSweezy1988` | `@book`, Siglo XXI / El capital monopolista |
| Patterson | 2000 | `Patterson2000` | `@book`, Palgrave Macmillan / Unit Root Tests in Time Series |

---

### 3. Hard Locks & Invariants

1. **Title & Macro Architecture Locked:** The title, section boundaries, and overall three-stage empirical design (S0, S1, S2) are strictly locked.
2. **Frozen Verifier (`tools/final_pass.py`):** The Python verifier script is FROZEN at v1.2 and was NOT edited. All 14 tests (F1–F6, G1–G3, H1–H5) must pass without regression.
3. **No External Modifications:** No files outside `workingpapers\chapter1\` were modified. The root scripts (`scripts\export_working_paper.py`, `scripts\toggle_paragraph_numbers.py`) and the empirical repository (`Critical-Replication-Shaikh`) remain untouched.
4. **No Git Branching/Committing/Pushing:** Pass mode is STRICTLY surgical local implementation. No commits, pushes, merges, or branch switching are performed.
5. **No New Source Discovery:** Zero new references added to the literature base.

---

### 4. Out-of-Scope & Human Hold Items

- **RA-09 (Capital-Stock Measurement Error):** Under explicit human hold. The passage discussing capital measurement error in Section 3 and Section 4 remains untouched.
- **RA-10 (1956 / 1974 / 1980 Historical Controls):** Out of scope. Historical-control interpretations remain unchanged.
- **Institutional Settlement (RA-12):** Closed authorial interpretive category. Preserved without adding external literature citations.
- **Patterson (2000) (RA-14):** Cited in Appendix B.9 (`appendix_B_data_diagnostics.tex`). Retained in `references.bib` without modification.
- **Foley (1985) (RA-04):** Closed. Foley is unsupported for $\mu=1$ classical closure. No Foley citation was introduced, and Foley remains absent from the manuscript.
