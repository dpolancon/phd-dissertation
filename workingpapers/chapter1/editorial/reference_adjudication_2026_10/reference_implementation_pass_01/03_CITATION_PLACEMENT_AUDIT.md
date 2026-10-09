# CHAPTER 1 WORKING PAPER — REFERENCE ADJUDICATION IMPLEMENTATION PASS 01
## 03_CITATION_PLACEMENT_AUDIT.md

**Date:** 2026-10-09  
**Repository:** `C:\ReposGitHub\phd-dissertation`  
**Target:** Citation and Attribution Boundary Audit for Chapter 1 Working Paper  

---

### Audit Matrix: Checks R01 to R16

| Check | Focus / Target | Verification Rule | Textual Evidence | Result |
|---|---|---|---|---|
| **CHECK R01** | Herndon / Ash | Herndon/Ash absent from potential output filtering in §2; present in replication methodology in §4.1. | Section 2 L20 has `depends on the method used to separate trend from cycle.` Section 4.1 L8 includes `\citet{HerndonAshPollin2014}` and `\citet{AshBasuDube2017}`. | **PASS** |
| **CHECK R02** | Gahn & González | Gahn 2020 and 2022 differentiated; no joint phrase `(2020, 2022) argue...`. | Section 2 L31: `\citet{GahnGonzalez2020} revisit Nikiforos's evidence in a comment... while \citet{GahnGonzalez2022} present cross-country evidence...` | **PASS** |
| **CHECK R03** | Felipe & McCombie | Attributed to accounting-identity critique; author explicitly owns application to Shaikh. | Section 3.2 L47: `accounting-identity argument developed further by \citet{Felipe2005}... I apply this identification concern to Shaikh’s capacity regression.` | **PASS** |
| **CHECK R05** | Okishio / Basu | Attached only to reproduction / disproportionality; paper owns single-sector $\theta$. | Section 3.3 L62: `Marxian reproduction theory... formalized in different ways by \citet{Okishio2022} and \citet{Basu2022}... I translate this disproportionality problem into a single-sector capacity framework...` | **PASS** |
| **CHECK R06** | Okishio / Basu ODE Boundary | No sentence attributes $\theta=1$, $\theta \neq 1$, or ODE to Okishio or Basu. | Section 3.3 L84–86: `In this setup, disproportionality is characterized by the gap between capital accumulation and capacity expansion when $\theta \neq 1$. The dynamic implications of this scalar representation are derived below. The dynamic tendencies... can be formalized through an ordinary differential equation...` | **PASS** |
| **CHECK R07** | McGraw-Hill / Munroe / Baran & Sweezy | Butler/Phillips to survey measurement; Munroe to corporate information; Baran & Sweezy to monopoly capital. | Section 2 L13: `relative to preferred benchmarks \citep{Butler1958, Phillips1963}. Their production within McGraw-Hill formed part of a broader corporate information infrastructure... \citep{Munroe2007}. I interpret this corporate integration... environment of the Fordist era described by \citet{BaranSweezy1988}.` | **PASS** |
| **CHECK R08** | Kurz Bibliography Entry | Correct title *'Normal' Positions and Capital Utilisation* present; wrong title absent. | `references.bib` lines 1948–1956: title is `{`Normal' Positions and Capital Utilisation}`, journal `{Political Economy}`. Old title *Classical and neoclassical theories...* purged. | **PASS** |
| **CHECK R09** | Kurz Local Attribution | Uses "distribution" rather than "distributive conflict" when directly attributed to Kurz in §3.4. | Section 3.4 L111: `omitting distribution influencing the choice of technique \citep{Kurz1986}`. | **PASS** |
| **CHECK R10** | Kurz Mechanism Passage | "operating intensity" used instead of "machine speeds" in §4.6 mechanism passage. | Section 4.6 L537: `operating choices, including operating intensity and shift arrangements \citep{Kurz1986}`. "machine speeds" completely absent. | **PASS** |
| **CHECK R11** | Ciccone / Kurz Distinction | Ciccone and Kurz presented as distinct theoretical positions; old joint sentence absent. | Section 2 L29: Four distinct sentences detailing Kurz (cost-minimizing technique) vs. Ciccone (ex ante plant sizing for fluctuating demand). | **PASS** |
| **CHECK R12** | Ciccone Bibliography Metadata | Correct metadata: *Political Economy: Studies in the Surplus Approach*, 2(1): 17–36. | `references.bib` lines 1669–1677: `volume = {2}, number = {1}, pages = {17--36}`. Rendered PDF p. 39 confirmed. | **PASS** |
| **CHECK R13** | Foley Absence | Foley absent from manuscript source and rendered PDF; not introduced in this pass. | 0 occurrences of Foley citation across all `.tex` files; 0 occurrences in rendered PDF. | **PASS** |
| **CHECK R14** | Patterson Retention | Patterson (2000) retained in bibliography and cited in Appendix B.9. | Appendix B.9 L254 contains `\citep{Patterson2000}`; entry retained in `references.bib` lines 1819–1826; rendered on PDF p. 41 & 54. | **PASS** |
| **CHECK R15** | RA-09 Measurement Error | Capital-stock measurement-error passage untouched (under human hold). | Unchanged in `sections/03_conceptual_framework.tex` and `sections/04_econometric_replication.tex`. | **PASS** |
| **CHECK R16** | RA-10 Historical Controls | 1956/1974/1980 step control interpretation untouched by this pass. | Unchanged in `sections/04_econometric_replication.tex`. | **PASS** |

---

### Conclusion

All 16 citation placement and authorial boundary checks (R01 through R16) have been evaluated with exact textual matching and are confirmed **PASS**.
