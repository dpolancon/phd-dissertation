# PHASE 9D SAMPLE DESCRIPTION & RHETORICAL REGISTER CORRECTION

**Author / Role:** Empirical Macroeconometrician & Integration Editor  
**Repository:** `c:\ReposGitHub\Chapter3_RPEUP`  
**Location:** `paper/Version7/audits/granger_canonicalization/phase9e_conditional_partition/PHASE9D_SAMPLE_DESCRIPTION_CORRECTION.md`  
**Reference Document:** `paper/Version7/audits/granger_canonicalization/phase9d_ic_lag_space/PHASE9D_IC_LAG_SPACE_REPORT.md`  
**Date:** September 28, 2026  
**Status:** BINDING AUDIT REPAIR & CALIBRATION  

---

### 1. RECORD OF SAMPLE DESCRIPTION CORRECTION

In the Phase 9D report (`PHASE9D_IC_LAG_SPACE_REPORT.md`), the historical sample dates were incorrectly described in several prose passages as spanning **1953–1973** (with a banking window of **1958–1973**).

This correction formally registers the true historical coverage:

```
========================================================================================
INCORRECT AUDIT DESCRIPTION IN PROSE:
  Full Sample:    1953:01 – 1973:11
  Banking Sample: 1958:12 – 1973:11

ACTUAL PRODUCTION SAMPLE EXECUTED IN CODE:
  Full Systems:    1960:01 – 1980:12  (Raw N = 252; Usable N = 251 after first-differencing)
  Banking Systems: 1966:01 – 1980:12  (N = 180, determined by official un-spliced M1 availability)
========================================================================================
```

#### Nature of the Correction:
- **Numerical Integrity:** The numerical computations in `phase9d_ic_lag_grid.R` ingested the exact production data objects (`df_full` with 252 observations, and `raw66_df` with 180 observations). The actual matrix dimensions ($N=251$ usable, $N_{\text{common}}=239$ at $k_{\max}=12$; and $N=180$, $N_{\text{common}}=168$) were mathematically and numerically correct.
- **Audit-Prose Rectification:** The error was strictly one of historical date labeling in the audit report prose (a legacy artifact from earlier drafts). The 1960–1980 monthly historical window is intentional, governed by the archival availability of IMF international reserves and Central Bank historical ledgers. No numerical rerun of the Phase 9D grid is required.

---

### 2. AUDIT OF RHETORICAL REGISTER & CAUSAL-LANGUAGE INTEGRITY

In accordance with the Chapter 3 binding Causal-Language Contract (`chapter3_vault/25_FinalEditing/CAUSAL-LANGUAGE CONTRACT.md`) and the UMass Applied Econometrics standard, several rhetorical assertions in the Phase 9D report are hereby flagged and formally retracted or moderated:

1. **Retraction of "Proof of Structural Regime Shifts / Non-Linearity":**
   - *Phase 9D Claim:* The failure of lag expansion up to $k=12$ "proves that residual autocorrelation... reflects structural regime non-linearities."
   - *Correction / Moderation:* Persistent residual autocorrelation in linear VARs does **not** prove non-linearity or structural breaks. Econometrically, residual autocorrelation can stem from omitted variables, moving-average errors, unmodeled seasonality, measurement error, or parameter instability. It provides **diagnostic motivation** for exploring regime-dependent specifications, but does not constitute deductive proof of them.

2. **Retraction of "TVAR is Strictly Necessary":**
   - *Phase 9D Claim:* The linear VAR diagnostic failure makes the Threshold VAR (TVAR) in Section 5.4 "strictly necessary" and "fully validated."
   - *Correction / Moderation:* The Threshold VAR is an alternative non-linear structural specification whose validity rests on its own econometric grounds (e.g., Hansen Sup-LR tests, stability, and regime-dependent impulse responses). Diagnostic failure in a linear VAR motivates examining parameter non-constancy, but does not ex ante validate any specific threshold model.

3. **Restoration of Forensic Register:**
   - All references to linear estimation as "bourgeois macroeconometrics" or dramatic characterizations of econometric failure are demoted to precise econometric reporting: linear time-invariant VARs on the full 1960–1980 sample display persistent residual serial correlation that cannot be whitened by expanding linear lag length up to 12 months.

---

### 3. GLOBAL STATUS

This document forms an integral appendix to the Phase 9 audit sequence. The original Phase 9D report remains preserved for repository version fidelity, while this document serves as the authoritative, binding correction of record.
