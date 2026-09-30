# PHASE 11A — PRE-11B RECONCILIATION REPORT
## Formal Resolution of Audit Flags Prior to Manuscript Editing Authorization

**Document:** `paper/Version7/audits/final_editing/phase11a_chapter_consistency/PHASE11A_PRE11B_RECONCILIATION.md`  
**Phase:** 11A Pre-11B Reconciliation Gate  
**Date:** September 29, 2026  
**Audited Artifacts Updated:**  
- `PHASE11A_MASTER_REPAIR_LEDGER.md`
- `PHASE11A_SECTION_SCORECARD.md`
- `PHASE11A_EDIT_ELIGIBILITY_MAP.md`
- `PHASE11A_HUMANIZATION_PATTERN_REPORT.md`
- `PHASE11A_REFERENCE_STATE.md`

---

## 1. Resolution of Garcés (2002)

- **Verification Status:** `HUMAN_VERIFIED` by researcher directly from original PDF.
- **Canonical Bibliographic Metadata:**  
  Mario Garcés Durán. *Tomando su sitio: el movimiento de pobladores de Santiago, 1957–1970*. 1st ed. Santiago: LOM Ediciones, 2002. 450 pp. ISBN: 978-956-282-477-4.
- **Analytical Role in Manuscript:**  
  Documents urban popular mobilization, housing struggles, territorial organization, and the emergence of *pobladores* as a decisive urban political actor in Santiago from the late 1950s through 1970.
- **Reconciliation Action:**  
  Retained in §5.1 (`05_1_historical_background.tex:66`) alongside Murphy (2015) (`\citep{Garces2002,Murphy2015}`). REP-22 is formally resolved from `RESEARCHER_DECISION` to `RESOLVED` (`GREEN`). No manuscript prose modification is required.

---

## 2. Revalidation of TVAR Transition-Variable Specification (REP-09)

- **Audit Classification:** `CONFIRMED_MANUSCRIPT_ERROR`.
- **Code Provenance & Empirical Trace:**
  - `codes/tvar/01_data_and_spec.R:63-65`:
    ```R
    q_H  = F / (H * 1000)
    s_H  = log(q_H)
    ds_H = c(NA, diff(s_H)) * 100  # Solvency Growth Gap (gF - gH)
    ```
  - `codes/tvar/01_data_and_spec.R:87-88`:
    ```R
    threshold_var     <- "ds_H"
    threshold_lag_var <- "ds_H_l1"
    ```
  - `codes/tvar/01_data_and_spec.R:116`:
    ```R
    q_thresh <- sub_clean[[threshold_lag_var]][2:n_full]  # ds_H_{t-1}
    ```
  - `codes/tvar/02_grid_search_and_bootstrap.R:77`:
    ```R
    opt_gamma <- -4.615084  # Optimal threshold gamma in percentage points
    ```
- **Nature of the Error:**  
  The empirical model strictly employs the stationary first difference of log solvency ($\Delta s_{t-1} \equiv g^F_{t-1} - g^H_{t-1}$, the Solvency Growth Gap) as the transition variable. The level stock ratio $\text{SolvR}^H$ is $I(1)$ (ADF test statistic $-0.134, p = 0.978$ in Table 3) and cannot satisfy stationary threshold asymptotic theory. Section 4.2 (`04_data_architecture.tex:23`) incorrectly states:
  > *"In the threshold specification, the predetermined lag $\text{SolvR}^H_{t-1}$ satisfies the consistency conditions of \citet{Hansen1999}."*
  This is a surviving textual draft layer residue from an earlier specification before the stationary growth-gap transformation was adopted.
- **Authorized Phase 11B Correction:**  
  Correct line 23 of `04_data_architecture.tex` to explicitly specify the predetermined Solvency Growth Gap ($\Delta s_{t-1}$) as the transition variable satisfying Hansen's consistency conditions.

---

## 3. Occurrence-by-Occurrence Reassessment of "Low Solvency"

All occurrences of the phrase "low solvency" across §5.4 (`05_4_threshold_var.tex`) and Table 4 were audited against three criteria:
- **Category A:** Descriptive regime label identifying observations where $\Delta s_{t-1} \le -4.615\%$.
- **Category B:** Econometric shorthand for the threshold condition $\Delta s_{t-1} \le \hat{\gamma}$.
- **Category C:** Improper causal overreach converting the threshold state into an independently identified condition of structural central bank insolvency.

### Findings by Occurrence:
1. `05_4_threshold_var.tex:174` (Occurrence 1: "...to 0.581 ($t = 3.90, p < 0.01$) under low solvency..."):  
   **Classification:** `Category B (Shorthand)`. Refers directly to parameter estimation conditional on $\Delta s_{t-1} \le -4.615\%$.
2. `05_4_threshold_var.tex:174` (Occurrence 2: "Under low solvency, that same inflation pulse generated..."):  
   **Classification:** `Category B (Shorthand)`. Contextualizes the GIRF trajectory under the threshold condition.
3. `05_4_threshold_var.tex:176` (Occurrence 3: "...is not statistically significant under low solvency..."):  
   **Classification:** `Category B (Shorthand)`. Contrasts coefficient significance across estimated regimes.
4. `05_4_threshold_var.tex:176` (Occurrence 4: "In contrast, the low-solvency regime exhibits near-unit-root inflation inertia."):  
   **Classification:** `Category A (Regime Label)`. Descriptive label for Regime 1 ($N_1 = 100$ months).
5. `05_4_threshold_var.tex:178` (Occurrence 5: "In the low-solvency regime, this pass-through jumps to 0.778..."):  
   **Classification:** `Category A (Regime Label)`. Descriptive label for Regime 1.
6. `05_4_threshold_var.tex:178` (Occurrence 6: "Under low solvency, this external shield disintegrates."):  
   **Classification:** `Category B (Shorthand)`. Summarizes regime-dependent transmission dynamics.
7. `tab04_tvar_estimates.tex:15` (Table 4 Header: `\textbf{Panel A: Low-Solvency Regime}`):  
   **Classification:** `Category A (Regime Label)`. Accompanied by explicit mathematical condition ($\Delta s_{t-1} \le -4.615\%, N_1 = 100$).

### Verdict:
- **Zero occurrences belong to Category C.** There is no causal overreach asserting ungrounded structural insolvency outside the threshold estimate.
- All occurrences are valid Category A (descriptive labels) or Category B (econometric shorthands).
- **Audit Decision:** Downgraded from an urgent conceptual repair to `LOW` priority stylistic harmonization. In Phase 11B, text may optionally align wording with the canonical chapter phrasing ("in the central bank insolvency regime" / "under conditions of central bank reserve depletion"), but the existing text is technically sound and violates no causal locks.

---

## 4. Reassessment of Gailmard (2021) Integration

### §2.20 (`02_literature_review.tex:218–220`):
- **Current State:** The text discusses the institutionalization of Historical Political Economy around the *Journal of Historical Political Economy*, but cites only Jenkins & Rubin (2024, *Oxford Handbook of Historical Political Economy*).
- **Verdict:** `CITATION ADDITION JUSTIFIED`. Sean Gailmard (2021) is the founding editorial essay of the *Journal of Historical Political Economy*. Attaching `\citep{Gailmard2021}` alongside Jenkins & Rubin (2024) provides direct citation support for the *JHPE* reference without adding prose or expanding scope.
- **Authorized Action:** Add citation key `\citep{Gailmard2021}` to lines 218–220 in Phase 11B.

### §6.4 (`06_discussion_conclusion.tex:44`):
- **Current State:** Paragraph 44 articulates the methodological and epistemological boundaries of macro time-series econometrics (Granger causality, PCMCI+, TVAR) in direct, authoritative authorial voice.
- **Verdict:** `NO ACTION` (`SAFE_NO_EDIT`). Gailmard (2021) addresses the integration of formal game-theoretic models with historical narrative in HPE, not macro time-series VAR econometrics. Adding Gailmard here would risk conceptual stretching and dilute the authorial voice of the chapter's methodological disclaimer.
- **Authorized Action:** Leave §6.4 untouched. No citation or prose modification.

---

## 5. Resulting Changes to Authorized Scope of Phase 11B

With all 4 reconciliation directives executed and logged, the operational scope of Phase 11B is refined as follows:

| Category | Initial Phase 11A Draft | Post-Reconciliation Phase 11B Scope | Delta / Rationale |
|:---|:---:|:---:|:---|
| **Researcher Decisions** | 1 open (`Garces2002`) | **0 open (Zero)** | `Garces2002` verified from original PDF; retained in §5.1. |
| **Section 2 Workload** | Heavy (Metadata + Gailmard in §2.20 & §6.4) | **Targeted Repair (§2 only)** | Gailmard restricted to citekey addition in §2.20; §6.4 locked as `SAFE_NO_EDIT`. BibTeX metadata repairs proceed as planned. |
| **Section 4 Workload** | Typo repair only | **Surgical Repair (§4.2 line 23 & §4.4 title)** | REP-09 confirmed as manuscript error: calibrate $\text{SolvR}^H_{t-1} \to \Delta s_{t-1}$. Typo "Excercises" $\to$ "Exercises". |
| **Section 5.4 Workload** | Causal repair for "low solvency" | **Minor Harmonization (Optional)** | Downgraded from high/medium causal breach to low-priority Category A/B stylistic harmonization. Zero Category C overreach. |
| **Section 6 Workload** | Gailmard addition + factual fix | **Minor Repair (§6.2 lines 20–22 only)** | Correct "quarterly external reserve depletion" $\to$ "monthly central bank solvency ratio growth" (REP-07) and calibrate "ruling out" (REP-08). §6.4 locked. |
| **Total Green Repairs** | 24 | **25** (including surgical §4.2 calibration and citekey repairs) | All repairs strictly bounded to paragraph-level edits. |
| **Integrity Boundary** | Zero `.tex`/`.bib` edits in Phase 11A | **Strictly Preserved** | Phase 11A closed with zero source file mutations. |
