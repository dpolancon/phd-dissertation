# PHASE 11B — MASTER CHANGE LEDGER
## Bounded Final Prose, Factual, and Reference Modifications

**Document:** `paper/Version7/audits/final_editing/phase11b_bounded_edits/PHASE11B_CHANGE_LEDGER.md`  
**Phase:** 11B (Bounded Final Edits)  
**Date:** September 29, 2026  
**Audited Baseline:** Master Manuscript `paper/Version7/Chapter3_Paper.tex` (Version 7)  
**Git Mode:** NO COMMIT / NO PUSH  

---

### 1. Overview of Ledger Actions

In strict compliance with `PHASE11B_STAGED_PROTOCOL.md` and the Phase 11B execution overrides:
- Every edit is uniquely mapped to an authorized Phase 11A ledger ID.
- Zero empirical specifications, lag lengths, or parameter values were altered.
- All Phase 10D empirical and causal-language locks are preserved.
- Paragraph boundaries were maintained; zero general rewriting was performed.
- Items classified as `SAFE_NO_EDIT` or `NO_EDIT_NEEDED` were left untouched.

---

### 2. Itemized Change Ledger

| ID | File & Location | Phase 11A Failure Type | Before (Exact Snippet) | After (Exact Snippet) | Analytical Rationale | Preserved Locks | Reference Action |
|:---|:---|:---|:---|:---|:---|:---|:---:|
| **REP-01** | `05_historical_empirical_results.tex:63` | `CAUSAL_OVERREACH` | "The bidirectional finding refutes the strict monetarist premise of unidirectional money exogeneity, while demonstrating that nominal transmission operated as a reciprocal spiral." | "The bidirectional finding is difficult to reconcile with the strict monetarist premise of unidirectional money exogeneity, while demonstrating that nominal transmission operated as a reciprocal spiral." | Eliminates absolute falsification verb ("refutes") per binding Causal-Language Contract, while preserving evidentiary contrast. | System 1 linear Granger estimates ($F=15.004, F=2.718$), bidirectional accommodation. | None |
| **REP-02** | `appendix_bop_levr.tex:140` | `CAUSAL_OVERREACH` | "...refuting closed-economy monetarist assertions of autonomous monetary emission." | "...challenging closed-economy monetarist accounts of autonomous monetary emission." | Eliminates absolute falsification participle ("refuting") per Causal-Language Contract. | Appendix A balance-of-payments threshold derivation; structural balance-sheet properties. | None |
| **REP-07** | `06_discussion_conclusion.tex:20` | `FACTUAL_MISMATCH` | "...while quarterly external reserve depletion systematically predicts base money expansion ($\text{SolvR}^H \to g_H$)." | "...while monthly central bank solvency ratio growth systematically predicts base money expansion ($g_{\text{SolvR\_H}} \to g_H$)." | Corrects factually incorrect time frequency (System 6 is monthly, $N_{\text{eff}}=161$, not quarterly) and aligns notation with System 6 variable definition. | System 6 pre-1973 conditional VAR(3) estimates ($F=2.455, p=0.0655$). | None |
| **REP-08** | `06_discussion_conclusion.tex:20` | `CAUSAL_OVERREACH` | "...ruling out the reverse monetarist channel." | "...providing no empirical support for the forward monetarist channel." | Calibrates absolute exclusion language ("ruling out") to rigorous empirical reporting of conditional independence in PCMCI. | PCMCI causal discovery results (Appendix C); Causal-Language Contract. | None |
| **REP-09** | `04_data_architecture.tex:23` | `CONFIRMED_MANUSCRIPT_ERROR` | "In the threshold specification, the predetermined lag $\text{SolvR}^H_{t-1}$ satisfies the consistency conditions of \citet{Hansen1999}." | "In the threshold specification, the estimated transition variable is the predetermined lagged Solvency Growth Gap ($\Delta s_{t-1} \equiv g^F_{t-1} - g^H_{t-1}$), with threshold estimation and inference following the grid-search procedure of \citet{Hansen1999}." | Corrects specification residue: the estimated TVAR transition variable is the stationary growth gap $\Delta s_{t-1}$ (`ds_H_l1` in code), not the $I(1)$ level ratio $\text{SolvR}^H_{t-1}$. Aligns with code provenance (`codes/tvar/01_data_and_spec.R:116`). | TVAR estimation architecture; optimal threshold $\hat{\gamma} = -4.615\%$. | None |
| **REP-10** | `01_introduction.tex:22` | `FRONTMATTER_MISMATCH` | "Four methodological and empirical appendices provide..." | "Five methodological and empirical appendices provide the balance-of-payments accounting derivation (Appendix~\ref{app:bop_levr}), the archival data codebook (Appendix~\ref{app:archival_codebook}), the multivariate PCMCI causal discovery results (Appendix~\ref{app:pcmci_ee1}), the complete 25-pathway Threshold VAR impulse response atlas (Appendix~\ref{app:tvar_girf_atlas}), and the linear VAR diagnostic space (Appendix~\ref{app:linear_var_diagnostics})." | Synchronizes introduction roadmap with compiled manuscript, which contains five active appendices (Appendices A through E). | Manuscript structure and appendix cross-referencing. | None |
| **REP-11** | `04_data_architecture.tex:48` | `AI_CADENCE` / Typo | `\subsection{Integration Order of Variables Included in Empirical Excercises}` | `\subsection{Integration Order of Variables Included in Empirical Exercises}` | Corrects orthographic error ("Excercises" $\to$ "Exercises"). | Section numbering and structure. | None |
| **REP-12** | `01_introduction.tex:20` | `AI_CADENCE` | "In our vector autoregressive and Threshold VAR systems..." | "In the vector autoregressive and Threshold VAR systems..." | Eliminates first-person plural pronoun ("our") in single-authored Ph.D. dissertation chapter. | Single-author dissertation voice. | None |
| **REP-13a**| `02_literature_review.tex:220` | `CITATION_GAP` | "...without sacrificing rigorous causal identification \citep{JenkinsRubin2024,CharnyshFinkelGehlbach2023}." | "...without sacrificing rigorous causal identification \citep{Gailmard2021,JenkinsRubin2024,CharnyshFinkelGehlbach2023}." | Adds founding editorial essay of the *Journal of Historical Political Economy* directly supporting the in-text reference to *JHPE*, with zero prose expansion. | Epistemological balance; literature review boundary. | Added `Gailmard2021` |
| **REP-14** | `02_literature_review.tex:236, 248` | `CITEKEY_METADATA_DRIFT` | `\citet{AldunateGonzalezPrem2022}` and `\citep{...AldunateGonzalezPrem2022...}` | `\citet{AldunateGonzalezPrem2024}` and `\citep{...AldunateGonzalezPrem2024...}` | Repoints stale citekey to published version (*Journal of Development Economics*, 166: 103212, 2024) per human-approved bridge. | Bibliographic integrity. | Repointed citekey |
| **REP-15** | `02_literature_review.tex:248` | `CITEKEY_METADATA_DRIFT` | `\citep{...GonzalezPrem2026}` | `\citep{...GonzalezPrem2026Nat,GonzalezPrem2026Trans}` | Splits single placeholder into two distinct human-approved 2026 objects: nationalizations (*JEH*) and crisis transfers (Working Paper). | Distinct analytical objects preserved. | Split citekeys |
| **REP-16** | `02_literature_review.tex:195` | `CITEKEY_METADATA_DRIFT` | "Sergio \citet{Ramos1979} and Joseph \citet{Ramos1980}" | "Sergio \citet{RamosSergio1979} and Joseph \citet{RamosJoseph1980}" | Disambiguates Sergio Ramos (1979) and Joseph Ramos (1980) into distinct verified citekeys with complete metadata. | Epistemological divide in Section 2. | Repointed citekeys |
| **REP-17** | `02_literature_review.tex:292` | `CITEKEY_METADATA_DRIFT` | `\citep{...Sossdorf2024Trade}` | `\citep{...Sossdorf2024}` | Repoints placeholder citekey to canonical verified record (*Latin American Journal of Trade Policy*, 7(18): 4, 2024). | Contemporary dependency / rentier accumulation. | Repointed citekey |
| **REP-18** | `02_literature_review.tex:24` | `CITEKEY_METADATA_DRIFT` | `\citep{CardenasLanaSeabra2022}` | `\citep{CardenasSeabra2022}` | Repoints citekey to human-approved canonical Ariadna Ediciones book entry. | CESO intellectual history. | Repointed citekey |
| **REP-19** | `02_literature_review.tex:80` | `CITEKEY_METADATA_DRIFT` | `\citep{...Zavaleta1974...}` | `\citep{...ZavaletaMercado1974...}` | Repoints citekey to human-approved canonical Siglo XXI book entry. | Dual power / capitalist world system. | Repointed citekey |
| **REP-20** | `02_literature_review.tex:248` | `CITEKEY_METADATA_DRIFT` | `\citep{...BautistaGonzalezMartinezMunozPrem2023...}` | `\citep{...BautistaEtAl2023...}` | Repoints unwieldy placeholder to canonical verified key (*AJPS*, 67(1): 101–118, 2023). | Geography of repression in HPE. | Repointed citekey |
| **REP-21** | `references.bib` | `CITEKEY_METADATA_DRIFT` | 5 records with `title = {[Title to verify]}` | Full verified metadata injected for `Gonzalez2013`, `GonzalezPremUrzua2020`, `GonzalezVial2021`, `AhumadaChang2025`, and `Gailmard2021` | Eliminates literal placeholder strings in compiled bibliography using exact approved records from Qwen handoff. | Professional dissertation bibliography. | Injected metadata |
| **REP-24** | `05_historical_empirical_results.tex:51` | `AI_CADENCE` | "Furthermore, empirical admission..." | "Empirical admission..." | Removes formulaic transitional discourse marker ("Furthermore") to strengthen academic cadence. | Admissibility criteria for linear systems. | None |
| **REP-26** | `05_1_historical_background.tex` | `REDUNDANCY` | Scaffolding comments `% SEC51-VERIFY-...` on 11 lines | Cleaned out all scaffolding comments from LaTeX source | Cleans obsolete editorial residue from source code; zero visual or text impact on compiled PDF. | Historical narrative integrity. | None |

---

### 3. Items Evaluated and Deliberately Left Unchanged

| ID | Section / Location | Description | Verdict | Reason for Invariance |
|:---|:---|:---|:---:|:---|
| **REP-03** | §5.4 `05_4_threshold_var.tex:174` | "under low solvency" (2 occurrences) | `SAFE_NO_EDIT` | Explicit scope override: verified as Category B econometric shorthand for $\Delta s_{t-1} \le -4.615\%$. Zero causal violation. Retained as is. |
| **REP-04** | §5.4 `05_4_threshold_var.tex:176` | "under low solvency" / "the low-solvency regime" | `SAFE_NO_EDIT` | Explicit scope override: verified as Category A/B descriptive regime label and shorthand. Retained as is. |
| **REP-05** | §5.4 `05_4_threshold_var.tex:178` | "the low-solvency regime" / "under low solvency" | `SAFE_NO_EDIT` | Explicit scope override: verified as Category A/B descriptive regime label and shorthand. Retained as is. |
| **REP-06** | Table 4 `tab04_tvar_estimates.tex:15` | `\textbf{Panel A: Low-Solvency Regime}` | `SAFE_NO_EDIT` | Explicit scope override: Category A tabular header with mathematical condition explicitly attached. Retained as is. |
| **REP-13b**| §6.4 `06_discussion_conclusion.tex:44` | Methodological boundaries disclaimer | `SAFE_NO_EDIT` | Explicit scope override: direct authorial voice on time-series VAR econometrics is self-contained. Gailmard integration barred here. |
| **REP-22** | §5.1 `05_1_historical_background.tex:66` | `\citep{Garces2002,Murphy2015}` | `SAFE_NO_EDIT` | Explicit scope override: Garcés (2002) is `HUMAN_VERIFIED` and retained in manuscript and bibliography. |
| **REP-23** | `references.bib` | Legacy removal queue (`Prashad2023`, `Quijano1974`, `Rozenas2021`, `RosensteinRodan1973`) | `SAFE_NO_EDIT` | Explicit scope override: deletion deferred to archive hygiene pass. Uncited records remain untouched. |
| **REP-25** | App E `appendix_linear_var_diagnostics.tex:47, 79` | "Accordingly, these statistics..." | `NO_EDIT_NEEDED` | Improvement marginal; original phrasing is standard econometric reporting. Retained per change discipline. |
| **REP-27** | §2.13 `02_literature_review.tex:283` | "Kvangraven refutes the mainstream caricature..." | `SAFE_NO_EDIT` | Applies to secondary historiographical debate, not econometric falsification. Retained as is. |
| **REP-28** | §1.2 `01_introduction.tex:6` | Solvency threshold $-4.615\%$, GIRF 9m/3.55pp vs 10m/6.54pp | `SAFE_NO_EDIT` | Locked core numbers; preserved untouched. |
| **REP-29** | §5.3.2 `05_historical_empirical_results.tex:70` | System 2 conditional VAR(3) estimates | `SAFE_NO_EDIT` | Locked Phase 10D estimates; preserved untouched. |
| **REP-30** | §5.4.3 `05_4_threshold_var.tex:190-250` | TVAR GIRF Tournament narrative | `SAFE_NO_EDIT` | Locked Phase 10D empirical core; preserved untouched. |
