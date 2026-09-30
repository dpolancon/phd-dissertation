# VERSION 8.1 CONTROL DIFF AND VERIFICATION REPORT
## Controlled Source-Level Surgical Repair against Immutable Version 8 Baseline

- **Repository:** `C:\ReposGitHub\Chapter3_RPEUP`
- **Branch:** `main` (HEAD: `7e336978d1416135e0475e739d179e41b60cd3f0`)
- **Immutable Historical Baseline:** `paper/Version7/` (PDF SHA-256: `6211614F96BC9716B9AA1E0E4AA9CC37A93B030E635B237D57186E345BF049E8`)
- **Immutable Reader Baseline:** `paper/Version8/`
- **Active Surgical Workspace:** `paper/Version8_1/` (excluded from git via `.git/info/exclude`)
- **Diagnostic Source:** `chapter3_vault/25_FinalEditing/V8_FINAL_PDF_SMOKE_TEST_AUDIT.md`
- **Compiled PDF Output:** `paper/Version8_1/Chapter3_Paper.pdf`
- **Version 8.1 PDF SHA-256:** `CE1181BBE1E5D941A740F03DD6B9B654C05C413C8FCC10E8A2BF023E4F98432D`
- **Page Count:** 94 pages
- **Compilation Status:** 0 fatal errors, 0 undefined references, 0 undefined citations, 0 duplicate labels.

---

## 1. EXECUTIVE SUMMARY

The **Version 8.1 Surgical Repair Pass** was executed strictly according to the binding specifications of `chapter3_vault/25_FinalEditing/V8_FINAL_PDF_SMOKE_TEST_AUDIT.md` and the binding accounting and theoretical locks. 

No open-ended rewriting, literature re-scoping, or empirical re-estimation was performed. All edits were surgical, targeted to source `.tex` and figure files, verified by literal search and protected-number invariance checks, and validated through a 4-pass LaTeX compilation and selective visual rendering.

Version 8.1 resolves the freeze-blocking formal-accounting inconsistencies (F1, F2), eliminates introductory stock/flow conflation, propagates the Minsky theoretical lock to the roadmap and Appendix A, standardizes statistical state nomenclature to `Adverse Solvency-Growth State` and `Non-Adverse Solvency-Growth State`, corrects Appendix D dynamic simulation indexing to $P(\Delta s_{t+h-1} \le \gamma)$, refines causal-claim language across Section 5.4, Section 6, and Appendix C, and resolves all six mechanical/editorial items (M1–M6).

---

## 2. ITEMIZED AUDIT OF EXECUTED REPAIRS

### F1 & F2. Formal Accounting Consistency & Valuation Law
- **`sections/03_macro_framework.tex` (Eq 3):**
  Replaced the mixed-growth formulation with the exact discrete level Solvency Ratio law:
  $$\Delta \text{SolvR}_t = \frac{\Delta F_t - \text{SolvR}_{t-1} \Delta M_t}{M_t}$$
  Explicitly integrated the exact discrete valuation identity for foreign assets $F_t = e_t IR_t$:
  $$\Delta F_t = e_t \Delta IR_t + IR_{t-1} \Delta e_t$$
  Harmonized foreign-currency reserve flows with the empirical balance-of-payments identity:
  $$\Delta IR_t = CA_t + KA_t + EO_t + SDR_t$$
- **`appendix/appendix_bop_levr.tex` (A.3, A.4, A.6, A.7, A.8, A.9, A.11, A.12):**
  - Standardized exact product rule: $\Delta F_t = M_t \Delta \text{SolvR}_t + \text{SolvR}_{t-1} \Delta M_t$.
  - Divided by $M_t$ to yield the exact discrete level law.
  - Defined conventional lag-base growth separately: $g^L_{M,t} \equiv \Delta M_t / M_{t-1}$ for the constraint condition:
    $$\Delta \text{SolvR}_t < 0 \iff g^L_{M,t} > \frac{\Delta F_t}{F_{t-1}}$$
  - Separated reserve flows $\Delta IR_t$ from exchange-rate revaluation $IR_{t-1}\Delta e_t$, fully harmonizing Appendix A with empirical reserve accounting and Table 4.

### 2. Minsky Theoretical Lock Propagation
- **`sections/01_introduction.tex` (§1.7 Roadmap):**
  Replaced "transposing Minskyan solvency regimes to the peripheral central bank" with:
  *"formalizing how peripheral financial fragility and central-bank balance-sheet exposure condition macroeconomic transmission."*
- **`appendix/appendix_bop_levr.tex` (A.4, A.12):**
  Replaced "operationalizes the transposition of Minsky's financial postures to the peripheral central bank's own balance sheet" with:
  *"and formalizes central bank reserve backing and balance-sheet exposure, providing the balance-sheet foundation through which to examine peripheral financial fragility \citep{Foley2003,Chamorro2025}."*
  Explicitly noted that the empirical regimes are estimated from the Solvency Growth Gap rather than imported from Minsky's private-firm taxonomy.

### 3. Introductory Stock/Flow Threshold Repair
- **`sections/01_introduction.tex` (§1.6):**
  Eliminated dimensional conflation claiming reserves fall below $-4.615\%$. Replaced with:
  *"push the economy across the estimated Solvency Growth Gap threshold ($\Delta s_{t-1} \le -4.615\%$, entering the adverse solvency-growth state reflecting conditions of central bank insolvency)..."*

### 4. State Nomenclature Standardization
- **Manuscript-Wide Standard:**
  Statistical model regimes are named **Adverse Solvency-Growth State** (or `Adverse` in compact tables) and **Non-Adverse Solvency-Growth State** (or `Non-Adverse` in compact tables). The phrase *"reflecting conditions of central-bank insolvency"* is reserved strictly for economic interpretation.
- **Updated Locations:**
  - `sections/05_4_threshold_var.tex` (regime partition list, GIRF multiplier difference test, Figure 12 caption/notes, world price pass-through, Table 4 intro, endogenous dating).
  - `appendix/appendix_tvar_girf_atlas.tex` (subsections D.1–D.4, Figure D.1, Figure D.3, Figure D.4).
  - `tables/tab_app_d02_girf_metrics.tex` (24 rows updated from `Normal Solvency` / `Central Bank Insolvency` to `Non-Adverse` / `Adverse`).
  - `tables/tab_app_d03_regime_switching.tex` (starting states updated to `Non-Adverse State` / `Adverse Solvency-Growth State`).

### 5. Appendix D Simulation Notation and Indexing
- **`tables/tab_app_d03_regime_switching.tex`:**
  - Table caption and notes updated to:
    $$\Delta P(\Delta s_{t+h-1} \le \gamma) \equiv P(\Delta s_{t+h-1}^{\text{shocked}} \le \gamma) - P(\Delta s_{t+h-1}^{\text{baseline}} \le \gamma)$$
  - Replaced "Net causal shift..." with: *"Change in simulated state probability of occupying the adverse solvency-growth state..."*
- **`appendix/appendix_tvar_girf_atlas.tex`:**
  - Subsection header and text updated to $\Delta P(\Delta s_{t+h-1} \le \gamma)$.
  - Figure 16 caption and notes updated to $\Delta P(\Delta s_{t+h-1} \le \gamma)$ and *"Simulated change in the probability of remaining in the adverse solvency-growth state..."*

### 6. Causal Language and Claim Calibration
- **`sections/05_4_threshold_var.tex` (§5.4.5 & §5.4.6):**
  - Replaced claims that regime-switching probabilities "confirm" entry was not caused by an isolated shock, that windfalls were "powerless", and that this "confirm[s] structural persistence" with:
    *"The simulated probability changes are negligible under these shocks, indicating persistence of the fitted adverse state over the reported horizon."*
  - Replaced "locking the monetary authority into an endogenous accommodation spiral" with direct description of persistent inflationary pressure and defensive accommodation.
- **`sections/06_discussion_conclusion.tex` (§6.2 & §6.4):**
  - Replaced PCMCI "detects direct causal links" with: *"retains directed lagged conditional links"*.
  - Replaced "secondary status of forward transmission" / "bounded forward predictive channel" with statement highlighting conditioning sensitivity across estimators, noting that the VAR and GIRF estimations retain a statistically significant forward response alongside dominant reverse accommodation.
  - Replaced reverse accommodation "out-persists and out-magnifies" with: *"is more persistent and cumulatively larger over the reported horizon"*.
  - Replaced "locked into an endogenous spiral of currency depreciation and defensive monetization" with direct description of persistent domestic price pressures and defensive monetization.
  - Replaced conclusion claim that the framework "identifies the systemic threshold at which external reserve depletion unanchors domestic inflation" with:
    *"estimates a Solvency Growth Gap threshold associated with changes in monetary and price transmission under adverse balance-sheet conditions"*.
- **`appendix/appendix_causal_pcmci_ee1.tex` & `figures/tikz_pcmci_dag.tex`:**
  - Recast PCMCI as a supplementary multivariate robustness check rather than an algorithm that "disciplines the specification that Stage 2 will use".
  - Replaced "detect true causal links" with "detect directed conditional dependencies".
  - Updated TikZ DAG legend from "Confirmed Directed Link" to "FDR-Retained Directed Lagged Link".

### 7. Mechanical and Editorial Fixes (M1–M6)
- **M1:** `sections/02_literature_review.tex` — Corrected "a important analytical compromise" $\to$ "an important analytical compromise".
- **M2:** `appendix/appendix_archival_codebook.tex` — Corrected paragraph headers E.1, E.2, E.3 $\to$ B.1, B.2, B.3.
- **M3:** `tables/tab02_core_granger_evidence.tex` — Renamed "System 6 --- Central Bank Solvency Gate" $\to$ "System 6 --- Central Bank Solvency Dynamics".
- **M4:** `sections/04_data_architecture.tex` — Updated ADF discussion to semicolon formulation: *"Table 1 reports the ADF diagnostics; the transformed series reject the unit root null..."*.
- **M5:** `sections/05_4_threshold_var.tex` & Figure 11 — Updated y-axis in `figures/regime_timeline_level.pdf` and `.png` to `100 \times Solvency Ratio (cents per peso)` and clarified axis units in text and caption.
- **M6:** `sections/04_data_architecture.tex` — Clarified monthly data sample: 252 raw monthly observations (1960:01–1980:12) with $N=250$ usable observations in estimation.

### 8. Post-Surgical Conclusion Landing Edit (V8.1-FINAL-01)
- **`sections/06_discussion_conclusion.tex` (§6.4, Final Paragraph):**
  This was the sole post-surgical substantive edit authorized for Version 8.1. The existing final paragraph was replaced verbatim with the researcher-locked dependency-theory conclusion landing:
  > *"The historical experience of the Unidad Popular therefore points beyond the problem of macroeconomic management narrowly understood. Foreign-exchange budgeting, controls over capital movements, and the regulation of external financial flows can widen the policy space available to peripheral governments and reduce their exposure to destabilizing international liquidity cycles \citep{FfrenchDavis2018}. Yet greater room for maneuver within the balance-of-payments constraint does not by itself transform the relations that reproduce that constraint. A peripheral state may command the domestic means of payment while remaining unable to produce the world money required to reproduce an import-dependent productive structure. Foreign exchange is therefore more than an object of prudent macroeconomic administration: it is a material condition of accumulation and an object of conflict over the control of export revenues, external credit, imported means of production, and the surplus through which productive capacity is reproduced. Macroprudential autonomy can mitigate the vulnerability generated by dependent accumulation, but it cannot by itself overcome it. The problem posed by peripheral transformation is consequently not only how to manage the balance-of-payments constraint, but how to alter the domestic and international relations through which that constraint is continually reproduced."*
  - `\citep{FfrenchDavis2018}` is the sole citation in this paragraph.
  - `Vasudevan2019` was completely removed from the paragraph.
  - No other conclusion prose or sections were modified.

---

## 3. FILE-BY-FILE DIFF STAT (`Version8` $\to$ `Version8_1`)

```text
 paper/{Version8 => Version8_1}/appendix/appendix_archival_codebook.tex        |   6 +-
 paper/{Version8 => Version8_1}/appendix/appendix_bop_levr.tex                 |  70 ++++----
 paper/{Version8 => Version8_1}/appendix/appendix_causal_pcmci_ee1.tex         |   8 +-
 paper/{Version8 => Version8_1}/appendix/appendix_tvar_girf_atlas.tex          |  22 +--
 paper/{Version8 => Version8_1}/figures/regime_timeline_level.pdf              | Bin 21567 -> 21933 bytes
 paper/{Version8 => Version8_1}/figures/regime_timeline_level.png              | Bin 102442 -> 103925 bytes
 paper/{Version8 => Version8_1}/figures/tikz_pcmci_dag.tex                     |   2 +-
 paper/{Version8 => Version8_1}/sections/01_introduction.tex                   |   4 +-
 paper/{Version8 => Version8_1}/sections/02_literature_review.tex              |   2 +-
 paper/{Version8 => Version8_1}/sections/03_macro_framework.tex                |  14 +-
 paper/{Version8 => Version8_1}/sections/04_data_architecture.tex              |   4 +-
 paper/{Version8 => Version8_1}/sections/05_4_threshold_var.tex                |  32 ++--
 paper/{Version8 => Version8_1}/sections/06_discussion_conclusion.tex          |   8 +-
 paper/{Version8 => Version8_1}/tables/tab02_core_granger_evidence.tex         |   2 +-
 paper/{Version8 => Version8_1}/tables/tab_app_d02_girf_metrics.tex            | 102 +++++------
 paper/{Version8 => Version8_1}/tables/tab_app_d03_regime_switching.tex        |  26 +--
 16 substantive files changed, 151 insertions(+), 151 deletions(-)
```

---

## 4. PROHIBITED PATTERN LITERAL SEARCH AUDIT

Automated Python regular expression scan across all active manuscript `.tex` and `.bib` files confirmed **ZERO hits** for all 18 prohibited strings:

| Target Search Pattern | Active Manuscript Status |
|---|:---:|
| `a important` (Grammar M1) | **0 hits** (CLEAN) |
| `Central Bank Solvency Gate` (M3) | **0 hits** (CLEAN) |
| `confirming that the transformed series reject` (M4) | **0 hits** (CLEAN) |
| `transpos* of Minsky` / `transposing Minsky` | **0 hits** (CLEAN) |
| `true causal link(s)` / `detect(s) direct causal link(s)` | **0 hits** (CLEAN) |
| `Confirmed Directed Link` | **0 hits** (CLEAN) |
| `Net causal shift` | **0 hits** (CLEAN) |
| `\Delta P(S_{t+h}` | **0 hits** (CLEAN) |
| `\Delta P(\Delta s_{t+h} \le` ($t+h$ indexing) | **0 hits** (CLEAN) |
| `powerless` | **0 hits** (CLEAN) |
| `confirming structural persistence` | **0 hits** (CLEAN) |
| `out-persists and out-magnifies` | **0 hits** (CLEAN) |
| `locked into an endogenous spiral` | **0 hits** (CLEAN) |
| `unanchors domestic inflation` | **0 hits** (CLEAN) |
| `Central Bank Insolvency Regime` (in statistical labels) | **0 hits** (CLEAN) |
| `Normal Solvency Regime` | **0 hits** (CLEAN) |
| `disciplines the specification that Stage 2` | **0 hits** (CLEAN) |
| `Palma & Marcel` / `Palma and Marcel` | **0 hits** (CLEAN) |

*(Note: The two legacy hits detected in the repository occur solely in archived backup directories `audits/final_editing/...` and `backups/appendix_backup_pre_EE1/...` outside active manuscript compilation).*

---

## 5. PROTECTED EMPIRICAL INVARIANCE VERIFICATION

All core empirical estimates, sample counts, and test statistics were audited and confirmed 100% invariant between Version 8 and Version 8.1:

| Empirical Anchor | Target Value | Version 8.1 Invariance |
|---|:---:|:---:|
| Estimated Lower Threshold ($\hat{\gamma}_1$) | $-4.615\%$ (or $-4.61\%$) | **VERIFIED INTACT** |
| Estimated Upper Threshold ($\hat{\gamma}_2$) | $+20.878\%$ (or $+20.87\%$) | **VERIFIED INTACT** |
| Forward Money Cumulative 12-Month Multiplier | $3.550$ percentage points | **VERIFIED INTACT** |
| Reverse Accommodation Cumulative Multiplier | $6.537$ percentage points | **VERIFIED INTACT** |
| Peak Multiplier Difference ($g^H \to \pi_m$) | $+0.313$ percentage points | **VERIFIED INTACT** |
| Peak Multiplier Difference ($\pi_m \to g^H$) | $+0.837$ percentage points | **VERIFIED INTACT** |
| Peak Multiplier Difference ($g^{gold} \to \pi_m$) | $+0.999$ percentage points | **VERIFIED INTACT** |
| TVAR Sup-LR Test Statistic & Bootstrap p-value | $\text{Sup-LR} = 112.10$, $p = 0.0010$ | **VERIFIED INTACT** |
| Estimation Sample Sizes | $N=250$, $N_1=100$, $N_2=111$, $N_3=38$ | **VERIFIED INTACT** |
| Table 4 TVAR Equation Estimates | All coefficients, t-stats, and p-values | **VERIFIED INTACT** |

---

## 6. COMPILATION AND VISUAL VERIFICATION

- **Compiler Sequence:** 4 full passes (`pdflatex -> bibtex -> pdflatex -> pdflatex`).
- **Fatal Errors:** 0.
- **Undefined References:** 0.
- **Undefined Citations:** 0.
- **Duplicate Labels:** 0.
- **Rendered PDF Page Count:** 94 pages.
- **PDF Hash:** `477DDA3CF5533547174EE2C6B42F04E538796C1F2E6ACA94FE6C4C3AD5D4A140`.

### Selective Rendered Page Inspection:
1. **Pages 4–7 (Introduction):** §1.6 correctly designates $-4.615\%$ as a Solvency Growth Gap threshold without stock conflation; §1.7 roadmap presents balance-sheet exposure and fragility without Minsky regime transposition.
2. **Page 19 (Macro Framework):** Equation (3) displays exact discrete level Solvency Ratio law with exact discrete valuation identity and reserves flow accounting.
3. **Page 54 (Figure 11 Timeline):** Panel A displays `100 \times Solvency Ratio (cents per peso)` on the y-axis; clean formatting, no legend clutter.
4. **Page 58 (Figure 12 TVAR Multipliers):** Clean caption and notes indicating Adverse Solvency-Growth Conditions ($\Delta s_{t-1} \le -4.615\%$, reflecting conditions of central-bank insolvency).
5. **Page 82 (Figure 14 TikZ DAG):** Legend correctly renders "FDR-Retained Directed Lagged Link", omitting "Confirmed Directed Link".
6. **Pages 88–89 (Table 14 & Table 15 / Figure 16):** Table 14 headers and notes read `Non-Adverse` / `Adverse`; Table 15 and Figure 16 display $\Delta P(\Delta s_{t+h-1} \le \gamma)$ with "Change in simulated state probability".

---

## 7. RECOMMENDATION & CONCLUSION

Version 8.1 has satisfied every formal, empirical, and stylistic requirement identified in the reader audit. The manuscript is clean, rigorous, and fully reconciled across formal accounting, causal claims, and state nomenclature.

**RECOMMENDATION:** **FREEZE CHAPTER 3 AT VERSION 8.1.**

*Execution strictly observed: NO COMMIT, NO PUSH.*
