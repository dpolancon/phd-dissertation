# PHASE 11A — REFERENCE STATE REPORT
## Reconciliation of the Phase 11 Reference Bridge Against Current Manuscript (Post-Reconciliation)

**Document:** `paper/Version7/audits/final_editing/phase11a_chapter_consistency/PHASE11A_REFERENCE_STATE.md`  
**Phase:** 11A (Diagnostic Audit Only — Post-Reconciliation Baseline)  
**Date:** September 29, 2026  
**Audited Baseline:** Master Manuscript `paper/Version7/Chapter3_Paper.tex` and `paper/Version7/references.bib`  
**Governance Bridge:** `chapter3_vault/25_FinalEditing/Reference_Consolidation_Phase11_Bridge.md`  
**Provenance Reference:** `chapter3_vault/25_FinalEditing/Reference_Consolidation_QwenHandoff.md`

---

### 1. Overview of Current Bibliographic State

A forensic cross-check of all active `.tex` manuscript files against `references.bib` establishes the following global baseline:
- **Total BibTeX Keys in `references.bib`:** 250
- **Total Unique Keys Cited in Active Manuscript:** 139
- **Cited Keys Missing from `references.bib`:** **0 (Zero)** — This explains why the manuscript compiles cleanly with 0 undefined citations.
- **Uncited Keys in `references.bib`:** 111 (Harmless for PDF compilation because Natbib only prints cited entries, but reflects accumulated drafting layers).
- **Core Finding:** While compilation is error-free, **several actively cited entries in `references.bib` contain literal dummy placeholder titles** (`title = {[Title to verify]}`), and several human-authorized citekey migrations and disambiguations have not yet been executed in Version 7.

---

### 2. Status of the 7 Historical Citekey Migrations

| Historical Key in Manuscript / Bib | Canonical Target Key | Current Manuscript State | Current BibTeX State | Phase 11B Action Required? | Classification |
|:---|:---|:---|:---|:---:|:---|
| `AldunateGonzalezPrem2022` | `AldunateGonzalezPrem2024` | Cited in `02_literature_review.tex` at lines 236 and 248. | Present as 2022 working paper with `GAP FLAG` note. | **YES** | `STILL_ACTIVE` |
| `GonzalezPrem2026` | `GonzalezPrem2026Nat` and `GonzalezPrem2026Trans` | Cited as single key in `02_literature_review.tex:248`. | Present as single entry with `title = {[Title to be confirmed]}`. | **YES** | `STILL_ACTIVE` |
| `Sossdorf2024Trade` | `Sossdorf2024` | Cited in `02_literature_review.tex:292` as `Sossdorf2024Trade`. | `Sossdorf2024Trade` has `title = {[Trade paper title to verify]}`. Full `Sossdorf2024` exists in bib but is uncited. | **YES** | `STILL_ACTIVE` |
| `Ramos1979` / `Ramos1980` | `RamosSergio1979` / `RamosJoseph1980` | Cited in `02_literature_review.tex:195` as `\citet{Ramos1979}` and `\citet{Ramos1980}`. | Both exist as placeholders with `title = {[Title to verify]}`. | **YES** | `STILL_ACTIVE` |
| Old Espinosa Routledge placeholder | `Espinosa2021` | Cited in `02_literature_review.tex:137` as `Espinosa2021`. | Present as `Espinosa2021` (*Economic Affairs* 41(1): 96–110). | **NO** | `RESOLVED_IN_CURRENT_MANUSCRIPT` |
| `EspinosaVéjar2025` | `EspinosaVejar2025` | Cited in `01_introduction.tex:6, 12` and `02_literature_review.tex:309, 311`. | Present as `EspinosaVejar2025` (*RHE* 43(2): 309–332). | **NO** | `RESOLVED_IN_CURRENT_MANUSCRIPT` |
| `CardenasLanaSeabra2022` | `CardenasSeabra2022` | Cited in `02_literature_review.tex:24`. | Present as `CardenasLanaSeabra2022` with `GAP FLAG`. | **YES** | `STILL_ACTIVE` |

---

### 3. Additional Active Citekey Disambiguations and Metadata Gaps

During the whole-chapter audit, three additional active bibliographic issues were identified in Section 2:

1. **`BautistaGonzalezMartinezMunozPrem2023` $\to$ `BautistaEtAl2023`:**
   - *Current State:* Cited in `02_literature_review.tex:248`. In `references.bib` (line 1077), it contains `title = {[Title to verify]}`.
   - *Approved Target:* Canonical key `BautistaEtAl2023` with verified title *"The geography of repression and opposition to autocracy"*, *AJPS* 67(1): 101–118 (2023).
   - *Phase 11B Action:* Repoint citekey and overwrite BibTeX entry with approved metadata. (`STILL_ACTIVE`)

2. **`Zavaleta1974` $\to$ `ZavaletaMercado1974`:**
   - *Current State:* Cited in `02_literature_review.tex:80` as `Zavaleta1974`.
   - *Approved Target:* Canonical key `ZavaletaMercado1974` (*El poder dual en América Latina*, Siglo XXI, 1974).
   - *Phase 11B Action:* Repoint citekey and standardize BibTeX entry. (`STILL_ACTIVE`)

3. **Active Entries with Dummy Titles (`[Title to verify]`):**
   - Four active citations in `02_literature_review.tex` point to BibTeX entries containing the placeholder string `title = {[Title to verify]}`:
     - `Gonzalez2013` (line 248) $\to$ Approved title: *"Can Land Reform Avoid a Left Turn? Evidence from Chile after the Cuban Revolution"*, *B.E. JEAP* 13(1): 31–72.
     - `GonzalezPremUrzua2020` (line 248) $\to$ Approved title: *"The privatization origins of political corporations..."*, *EEH* 78: 101355.
     - `GonzalezVial2021` (line 248) $\to$ Approved title: *"Collective action and policy implementation..."*, *JEH* 81(2): 405–440.
     - `AhumadaChang2025` (line 294) $\to$ Approved title: *"A new international economic order for the twenty-first century..."*, *ROKE* 13(4): 562–580.
   - *Phase 11B Action:* Overwrite placeholder records with approved metadata from Qwen handoff. (`STILL_ACTIVE`)

---

### 4. Status of the Historical Removal Queue

The earlier Qwen session marked 5 records as candidates for removal conditional on being uncited:

| Citekey | Status in `references.bib` | Status in Active Manuscript | Recommended Phase 11B Action | Classification |
|:---|:---:|:---:|:---|:---|
| `Prashad2023` | Present (dummy title) | Uncited (0 cites) | Safe to delete in Phase 11B hygiene pass. | `PRESENT_BUT_UNCITED` |
| `Quijano1974` | Present (`GAP FLAG`) | Uncited (0 cites) | Safe to delete in Phase 11B hygiene pass. | `PRESENT_BUT_UNCITED` |
| `Rozenas2021` | Present (`GAP FLAG`) | Uncited (0 cites) | Safe to delete in Phase 11B hygiene pass. | `PRESENT_BUT_UNCITED` |
| `RosensteinRodan1973` | Present | Uncited (0 cites) | Safe to delete in Phase 11B hygiene pass. | `PRESENT_BUT_UNCITED` |
| `RosensteinRodan1974` | Absent | Uncited (0 cites) | No action needed. | `ALREADY_ABSENT` |

*None of these 5 entries are cited in the manuscript.* Their presence in `references.bib` does not cause PDF compilation errors, but cleaning them out in Phase 11B will restore bibliography hygiene.

---

### 5. Status of the Methods Queue

| Citekey | Status in `references.bib` | Status in Active Manuscript | Recommended Phase 11B Action | Classification |
|:---|:---:|:---:|:---|:---|
| `DoladoLutkepohl1996` | Present | Uncited (0 cites) | Retain as is; no action needed. | `PRESENT_BUT_UNCITED` |
| `AmiriVentelou2012` | Absent | Uncited (0 cites) | No action needed. | `ALREADY_ABSENT` |
| `MacKinnon1996` | Present as `Mackinnon1996` | Uncited (0 cites) | Retain as is; no action needed. | `PRESENT_BUT_UNCITED` |
| `Hansen1997` | Present | Cited (3 cites: §5.4:34, 88; Table 3) | **Preserve active citation and BibTeX record.** | `RESOLVED_IN_CURRENT_MANUSCRIPT` |

---

### 6. Garcés (2002) Status (RESOLVED)

- **Location:** Cited in `sections/05_1_historical_background.tex:66` alongside `Murphy2015`:
  `\citep{Garces2002,Murphy2015}`.
- **BibTeX State:** Present in `references.bib` as `Garces2002`.
- **Researcher Verification:** Directly verified by the researcher from the original PDF:
  *Mario Garcés Durán. Tomando su sitio: el movimiento de pobladores de Santiago, 1957–1970. 1st ed. Santiago: LOM Ediciones, 2002. 450 pp. ISBN 978-956-282-477-4.*
- **Analytical Role:** Movement of pobladores in Santiago; urban popular mobilization; housing struggles and territorial organization; emergence of pobladores as a major urban social actor from the late 1950s through the 1960s.
- **Classification:** **`HUMAN_VERIFIED — RETAIN IN MANUSCRIPT`**.
- **Action:** Retain `\citep{Garces2002,Murphy2015}` in §5.1. No further decision required.

---

### 7. Gailmard (2021) Integration Status (RECALIBRATED)

- **Approved Role:** Author approved `Gailmard2021` (*Journal of Historical Political Economy* 1(1): 69–104, 2021) as an epistemological reference on the boundary between empirical identification and theoretical structural mechanisms in Historical Political Economy.
- **Current Manuscript State:** Present in `references.bib`, uncited in active `.tex` manuscript (0 cites).
- **Location-Specific Reassessment:**
  1. *Section 2.20 (`02_literature_review.tex:218–220`):*
     - Text explicitly discusses the institutionalization of HPE around the *Journal of Historical Political Economy*, but cites only the *Oxford Handbook* (`JenkinsRubin2024, CharnyshFinkelGehlbach2023`).
     - **Classification:** **`CITATION ADDITION JUSTIFIED`**.
     - **Phase 11B Action:** Attach `\citep{Gailmard2021}` alongside Jenkins & Rubin to provide the direct citation for *JHPE*. Do not add new prose.
  2. *Section 6.4 (`06_discussion_conclusion.tex:44`):*
     - Text is a direct, self-contained authorial disclaimer on macro time-series econometrics (Granger causality, PCMCI, TVAR) versus micro counterfactual identification.
     - Gailmard (2021) addresses formal game-theoretic models versus quantitative history in HPE, not time-series VAR econometrics. Adding Gailmard here would risk conceptual stretching and dilute authorial voice.
     - **Classification:** **`NO ACTION`** (`CITATION_ALREADY ADEQUATE`).
     - **Phase 11B Action:** Preserve §6.4 untouched. Do not add Gailmard citation or redundant prose.
