# PHASE 10B: DIFF SUMMARY AND MODIFICATION RECORD

## 1. Executive Summary of Changes
Phase 10B implemented exact claim calibration and cross-reference reconciliation across the manuscript files without altering the empirical architecture established in Phase 10A:
1. **Section 5.3 (`05_historical_empirical_results.tex`):**
   - Reconciled System 1 to single inferential lag $k=4$, reporting exact canonical numbers ($F = 15.004, p < 0.0001, \sum\hat{\beta} = +0.680$ and $F = 2.718, p = 0.0305, \sum\hat{\beta} = +0.380$), while noting SBIC selected $k^*=3$.
   - Reconciled System 2 to single inferential lag $k=3$, reporting exact canonical numbers ($g_{M1} \to g_H: F = 6.170, p = 0.0005, \sum\hat{\beta} = +0.782$; $g_H \to g_{M1}: F = 5.166, p = 0.0019, \sum\hat{\beta} = +0.468$; $\pi \to g_{M1}: F = 8.948, p < 0.0001, \sum\hat{\beta} = +0.323$; $g_{M1} \to \pi: F = 5.610, p = 0.0011, \sum\hat{\beta} = +0.671$).
   - Calibrated System 3 language to eliminate "artifact", "spurious", and "mechanically generated", framing it objectively as a conditioning sensitivity check on the commercial banking representation.
   - Calibrated System 6 to express results in literal variable terms ($g_{\text{SolvR\_H},t}$), accounting for $H_t$ in the denominator of $\text{SolvR}^H$, and neutral transition to §5.4 ("The linear specification does not determine whether these predictive relationships vary with the inherited solvency state. Section 5.4 examines that possibility directly.").
2. **Main Table A (`tab02_core_granger_evidence.tex`):**
   - Reported exactly one unambiguous inferential lag per system ($k=4$ for System 1; $k=3$ for System 2; pre-October 1973 $k=3$ for System 6).
   - Reconciled all statistics and coefficient sums to match `FINAL_CORE_RESULT_PROVENANCE.csv` and production ledger `output/tables_data/granger_sequential_results.csv`.
   - Explicitly clarified information sets for pairwise vs. conditional systems.
3. **Section 5.4 (`05_4_threshold_var.tex`):**
   - Corrected domain attribution in line 171 for $p = 0.406$ from "supplementary real-sector estimations" to "supplementary external-sector estimations" (originating from System 5 at $k=1$, $\Delta \ln \Theta \to g_H$: $F = 0.692, p = 0.4063$).
   - Removed rhetorical use of "artifact" in lines 181 and 277 ("sample sensitivity" and "endogenous consequence").
   - Verified that gold price block exogeneity and Cholesky recursive ordering are self-contained and anchored in TVAR unrestricted equations and institutional timing.

---

## 2. File-by-File Diff Records

### A. `paper/Version7/tables/tab02_core_granger_evidence.tex`
```diff
<<<< OLD
$\pi_t \longrightarrow g_{H,t}$ & $\{\pi_t, g_{H,t}\}$ & 4 & 15.001$^{***}$ & $< 0.0001$ & $+0.643$ & Pass (Sys BG $p=0.548$; Eq $p=0.467$) & \textsc{Robust Linear Result} \\
$g_{H,t} \longrightarrow \pi_t$ & $\{\pi_t, g_{H,t}\}$ & 4 & 2.718$^{**}$ & 0.0305 & $+0.407$ & Pass (Sys BG $p=0.548$; Eq $p=0.467$) & \textsc{Robust Linear Result} \\
...
$g_{M1,t} \longrightarrow g_{H,t}$ & $\{\pi_t, g_{M1,t}, g_{H,t}\}$ & 3 & 8.163$^{***}$ & $< 0.0001$ & $+0.418$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
$g_{H,t} \longrightarrow g_{M1,t}$ & $\{\pi_t, g_{M1,t}, g_{H,t}\}$ & 3 & 5.228$^{***}$ & 0.0018 & $+0.334$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
$\pi_t \longrightarrow g_{M1,t}$ & $\{\pi_t, g_{M1,t}, g_{H,t}\}$ & 3 & 8.948$^{***}$ & $< 0.0001$ & $+0.198$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
$g_{M1,t} \longrightarrow \pi_t$ & $\{\pi_t, g_{M1,t}, g_{H,t}\}$ & 3 & 5.612$^{***}$ & 0.0011 & $+0.328$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
====
>>>> NEW
$\pi_t \longrightarrow g_{H,t}$ & $\{\pi_t, g_{H,t}\}$ & 4 & 15.004$^{***}$ & $< 0.0001$ & $+0.680$ & Pass (Sys BG $p=0.548$; Eq $p=0.467$) & \textsc{Robust Linear Result} \\
$g_{H,t} \longrightarrow \pi_t$ & $\{\pi_t, g_{H,t}\}$ & 4 & 2.718$^{**}$ & 0.0305 & $+0.380$ & Pass (Sys BG $p=0.548$; Eq $p=0.467$) & \textsc{Robust Linear Result} \\
...
$g_{M1,t} \longrightarrow g_{H,t}$ & $\{g_{M1,t}, g_{H,t}\}$ & 3 & 6.170$^{***}$ & 0.0005 & $+0.782$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
$g_{H,t} \longrightarrow g_{M1,t}$ & $\{g_{M1,t}, g_{H,t}\}$ & 3 & 5.166$^{***}$ & 0.0019 & $+0.468$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
$\pi_t \longrightarrow g_{M1,t}$ & $\{\pi_t, g_{M1,t}\}$ & 3 & 8.948$^{***}$ & $< 0.0001$ & $+0.323$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
$g_{M1,t} \longrightarrow \pi_t$ & $\{\pi_t, g_{M1,t}\}$ & 3 & 5.610$^{***}$ & 0.0011 & $+0.671$ & Pass (Sys BG $p=0.428$; Eq $p=0.289$) & \textsc{Qualified Linear Result} \\
>>>>
```

### B. `paper/Version7/sections/05_historical_empirical_results.tex`
```diff
<<<< OLD
However, this shift is an artifact of the exact accounting identity $\Delta \ln m_t \equiv g_{M1,t} - g_{H,t}$: conditioning on base money growth mathematically isolates narrow money growth ($g_{M1,t}$), reproducing the commercial credit relationship already documented in System 2. Because System 3 does not capture an independent behavioral mechanism and its statistical significance depends entirely on multivariate conditioning, it is classified as \textsc{Specification-Sensitive} and is not treated as an independent empirical result.
====
>>>> NEW
The multiplier result is sensitive to the conditioning set. Because multiplier growth is algebraically related to narrow-money and base-money growth ($\Delta \ln m_t \equiv g_{M1,t} - g_{H,t}$), conditioning on base money growth mathematically incorporates narrow money dynamics, closely reflecting the commercial credit interaction documented in System~2. Consequently, this specification is treated as a sensitivity check on the banking representation rather than as an independent empirical result, and is classified as \textsc{Specification-Sensitive}.
>>>>
```

```diff
<<<< OLD
In the reverse direction, base money growth predictively Granger-causes solvency ratio growth ($F = 2.951, p = 0.0347$), with a large negative coefficient concentrated at lag 2 ($\hat{\beta}_2 = -0.9775, p = 0.0074$; sum $\sum \hat{\beta}_i = -0.8365$). Domestic base money expansion thus preceded subsequent reductions in foreign reserve backing.
====
>>>> NEW
In the reverse direction, base money growth predictively Granger-causes solvency ratio growth ($F = 2.951, p = 0.0347$), with a large negative coefficient concentrated at lag 2 ($\hat{\beta}_2 = -0.9775, p = 0.0074$; sum $\sum \hat{\beta}_i = -0.8365$). Because high-powered money enters directly into the denominator of $\text{SolvR}^H_t$, this negative predictive lag confirms that domestic monetary emission preceded subsequent deteriorations in external backing rather than being matched by offsetting reserve accumulation.
...
The linear specification does not determine whether these predictive relationships vary with the inherited solvency state. Section~\ref{sec:tvar_solvency_regimes} examines that possibility directly.
>>>>
```

### C. `paper/Version7/sections/05_4_threshold_var.tex`
```diff
<<<< OLD
Third, lagged structural imbalance ($\Delta \ln \Theta_{t-1}$) is excluded from the foreign reserve flow ($g^F_t$) and base money creation ($g^H_t$) equations. This restriction reflects the empirical non-causality evidence documented in the supplementary real-sector estimations ($p = 0.406$ for $g^H$, Appendix~\ref{app:linear_var_diagnostics}).
====
>>>> NEW
Third, lagged structural imbalance ($\Delta \ln \Theta_{t-1}$) is excluded from the foreign reserve flow ($g^F_t$) and base money creation ($g^H_t$) equations. This restriction reflects the empirical non-causality evidence documented in the supplementary external-sector estimations ($p = 0.406$ for $g^H$, Appendix~\ref{app:linear_var_diagnostics}).
>>>>
```
