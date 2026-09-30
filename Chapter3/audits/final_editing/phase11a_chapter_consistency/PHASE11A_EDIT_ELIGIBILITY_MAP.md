# PHASE 11A — EDIT ELIGIBILITY MAP
## Paragraph-Level Bounded Eligibility and Empirical Lock Boundaries (Post-Reconciliation)

**Document:** `paper/Version7/audits/final_editing/phase11a_chapter_consistency/PHASE11A_EDIT_ELIGIBILITY_MAP.md`  
**Phase:** 11A (Diagnostic Audit Only — Post-Reconciliation Baseline)  
**Date:** September 29, 2026  
**Audited Baseline:** Master Manuscript `paper/Version7/Chapter3_Paper.tex` (Version 7)  
**Rule:** Strict adherence to Phase 10D empirical and causal-language locks.

---

### Classification Taxonomy

- **`GREEN` (Safe Prose Edit / Authorized Correction):** Free for stylistic polish, syntax refinement, de-roboting, transition smoothing, and authorized bibliographic/factual corrections.
- **`AMBER` (Constrained Edit):** Editable only with surgical precision; specific empirical test statistics, historical dates, or theoretical formulations must be strictly preserved.
- **`RED` (Locked Boundary):** Strictly locked against modification. Text is tightly coupled to econometric estimates, mathematical identities, identification proofs, or binding causal contract clauses.
- **`SAFE_NO_EDIT` (Preserve Untouched):** Text is already calibrated, accurate, and self-contained; editing risks diluting authorial ownership or empirical exactness.

---

### Detailed Section-by-Section Mapping

#### 1. Title, Abstract, and Frontmatter (`Chapter3_Paper.tex`)
- **Title and Dedication (lines 66–84):** `GREEN`. Standard metadata.
- **Abstract (lines 85–93):** `RED` / `SAFE_NO_EDIT`. Strictly locked to accepted Phase 10D empirical values (Solvency Growth Gap transition variable, 9m/3.55 pp forward transmission, 10m/6.54 pp reverse accommodation, $h=2\dots10$ multiplier difference significance). **Preserve untouched.**

---

#### 2. Section 1: Introduction (`sections/01_introduction.tex`)
- **§1.1 (lines 4–5):** `GREEN`. Epistemological framing (Roncaglia, competing paradigms, peripheral capitalism). Safe for prose cadence polish.
- **§1.2 (lines 6–7):** `RED` / `SAFE_NO_EDIT`. Contains locked empirical values: capacity utilization 98.4%, \$400M reserves, Solvency Ratio definition ($S_t \equiv F_t / H_t$), threshold $\hat\gamma = -4.615\%$, 9m/3.55 pp, 10m/6.54 pp, $h=2\dots10$. **Preserve untouched.**
- **§1.3 (lines 8–9):** `GREEN`. Historical framing (Zoeller Nixon shock, Bretton Woods, BCCh agency). Safe for minor stylistic polish.
- **§1.4 (lines 10–11):** `AMBER`. Critique of macroeconomic populism, Dornbusch-Edwards, Blanco-Matute illusion of causality, external blockade citations. Wording can be polished, but citations and analytical categories must be preserved.
- **§1.5 (lines 12–15):** `RED` / `SAFE_NO_EDIT`. Lakatosian research programme formalization, monetarist hard core, Austrian business cycle critique, TVAR empirical tournament results. **Preserve untouched.**
- **§1.6 (lines 16–21):** `GREEN`. Data architecture overview, Austrian malinvestment refutation ($-2.3\%$ capital contraction, $\mu = 98.44\%$), Prebisch import capacity, Diaz-Bahamonde series. Line 20 has minor pronoun slip ("our" $\to$ "the"). Authorized for single-author voice correction.
- **§1.7 (lines 22–23):** `GREEN`. Chapter roadmap. Authorized to update "Four... appendices" to "Five... appendices" (incorporating Appendix E).

---

#### 3. Section 2: Literature Review (`sections/02_literature_review.tex`)
- **§2.1–§2.2 (lines 4–14):** `GREEN`. Survey of rival traditions. Safe for cadence polish.
- **§2.3–§2.6 (lines 19–60):** `AMBER`. Classical dependency school, CESO, Dos Santos, Bambirra, Cárdenas & Lana Seabra. Authorized for citekey migration: `CardenasLanaSeabra2022` $\to$ `CardenasSeabra2022`.
- **§2.7–§2.12 (lines 65–130):** `AMBER`. Popular Unity political economy, Stallings & Zimbalist, Zavaleta Mercado, Espinosa & Zimbalist. Authorized for citekey migration: `Zavaleta1974` $\to$ `ZavaletaMercado1974`.
- **§2.13–§2.19 (lines 135–210):** `AMBER`. Neoliberal school, Chicago Boys, Bockman, Espinosa 2021, Ramos Sergio and Joseph. Authorized for citekey migration: `Ramos1979/1980` $\to$ `RamosSergio1979`, `RamosJoseph1980` and metadata restoration. Line 283 ("refutes caricature") is `SAFE_NO_EDIT`.
- **§2.20–§2.26 (lines 215–275):** `AMBER`. Historical Political Economy (HPE), credibility revolution, Rodríguez Weber wage share. Authorized to add citation `\citep{Gailmard2021}` to line 218/220 (*JHPE* sentence) and execute citekey migrations (`AldunateGonzalezPrem2024`, `GonzalezPrem2026Nat`, `BautistaEtAl2023`, `Gonzalez2013` metadata).
- **§2.27–§2.34 (lines 280–322):** `AMBER`. Contemporary dependency renewal, Kvangraven, Ahumada & Chang, Arboleda, Sossdorf 2024, Austrian critique. Authorized to repoint `Sossdorf2024Trade` $\to$ `Sossdorf2024`.

---

#### 4. Section 3: Macroeconomic Balance-Sheet Framework (`sections/03_macro_framework.tex`)
- **§3.1–§3.6 (lines 7–21):** `GREEN` / `AMBER`. Marxian MEV, world money, Bretton Woods, international currency hierarchy. Safe for minor stylistic cadence polish; preserve analytical categories.
- **§3.7–§3.9 (lines 25–40):** `RED` / `SAFE_NO_EDIT`. Formal balance-sheet derivation: Solvency Ratio definition (Eq.~\ref{eq:solvency_ratio}), law of motion (Eq.~\ref{eq:solvency_law_motion}), and dimensional scaling. **Preserve untouched.**
- **§3.10–§3.11 (lines 45–53):** `RED` / `SAFE_NO_EDIT`. Endogenous money sequence (Eq.~\ref{eq:endogenous_money_sequence}), Fractional Reserve Theory critique, Peripheral Paradox, CORFO credit accommodation. **Preserve untouched.**
- **§3.12–§3.14 (lines 57–61):** `AMBER`. Minskyan Financial Instability Hypothesis reinterpreted for peripheral central bank, Foley, Chamorro, state-dependent hypothesis. Safe for minor prose polish; preserve conceptual boundary.

---

#### 5. Section 4: Data Architecture (`sections/04_data_architecture.tex`)
- **§4.1 (lines 7–13):** `AMBER`. Monthly panel documentation, BCCh REST API, Diaz-Bahamonde series, $N=250$, $M1$ window $N=180$. Preserve data provenance.
- **§4.2 (lines 18–41):** `GREEN`. Variable construction equations (Eq.~\ref{eq:solvr_h}, Eq.~\ref{eq:mcap}, Eq.~\ref{eq:theta}). Line 23 contains a confirmed manuscript error; authorized to calibrate text to specify that the predetermined Solvency Growth Gap $\Delta s_{t-1}$ is the stationary transition variable satisfying Hansen's consistency conditions.
- **§4.3 (lines 46):** `RED` / `SAFE_NO_EDIT`. April 1973 customs registration adjustment documentation (linear midpoint $2.76$). **Preserve untouched.**
- **§4.4 (lines 48–52):** `GREEN`. Integration order table introduction. Authorized to fix spelling typo in subsection heading ("Excercises" $\to$ "Exercises").

---

#### 6. Section 5.1: Historical Background (`sections/05_1_historical_background.tex`)
- **Waves I, II, III (lines 5–77):** `AMBER`. Historical mobilization waves, Loveman, Clio-Lab, Klein-Saks. Line 66 citation `\citep{Garces2002,Murphy2015}` is **human-verified and retained**.
- **Wave IV & Profit Squeeze (lines 81–95):** `RED` / `SAFE_NO_EDIT`. Growth-accounting decompositions, profit squeeze percentages, net accumulation rates. **Preserve untouched.**
- **LaTeX Comments (scattered):** `GREEN`. Authorized to clean out internal `% SEC51-VERIFY` scaffolding comments in Phase 11B.

---

#### 7. Section 5.2: Stylized Facts (`sections/05_2_stylized_facts.tex`)
- **§5.2.1–§5.2.3 (lines 8–180):** `RED` / `SAFE_NO_EDIT`. Table 00 annual BoP ledger, 1971 capital account reversal ($-\$294\text{M}$), copper/gold trajectories, capacity to import figures. **Preserve untouched.**

---

#### 8. Section 5.3: Linear Granger Battery (`sections/05_historical_empirical_results.tex`)
- **§5.3.1 (lines 20–54):** `RED`. Econometric specification (Eqs.~\ref{eq:null_exogeneity}--\ref{eq:granger_spec2}), $F$-test formula, diagnostic admissibility gates, Table 0. Line 51 AI transition ("Furthermore") authorized for removal (`GREEN`).
- **§5.3.2 (lines 56–64):** `AMBER`. Nominal core System 1 ($k=4$, $\pi \to g_H: F=15.004, p<0.0001$; $g_H \to \pi: F=2.718, p=0.0305$). Line 63 contains absolute falsification verb "refutes"; authorized to calibrate to "is difficult to reconcile with" (`GREEN`).
- **§5.3.3 (lines 65–74):** `RED` / `SAFE_NO_EDIT`. System 2 conditional VAR(3) estimates ($F=3.654, 3.239, 6.842, 1.004$), non-rejection of $g_{M1} \to \pi$. System 3 sensitivity note ($\Delta \ln m \equiv g_{M1} - g_H$). Line 73 AI transition ("Consequently") authorized for removal (`GREEN`). **Preserve all estimates and text structure.**
- **§5.3.4 (lines 75–85):** `RED` / `SAFE_NO_EDIT`. System 6 pre-October 1973 conditional VAR(3) estimates ($F=6.983, 2.951, 3.073, 0.686$), denominator mechanics. **Preserve untouched.**
- **§5.3.5–§5.3.6 (lines 88–103):** `AMBER`. Limits of linear exercise, stopping rule, motivation of TVAR. Safe for minor stylistic polish.

---

#### 9. Section 5.4: Threshold Vector Autoregression (`sections/05_4_threshold_var.tex`)
- **§5.4.1–§5.4.2 (lines 7–168):** `RED` / `SAFE_NO_EDIT`. 5-variable TVAR specification, structural exclusion restrictions, threshold estimation ($\hat\gamma = -4.615\%$, Hansen test $p=0.048$). **Preserve untouched.**
- **§5.4.3 (lines 170–183):** `GREEN`. CLS parameter estimates, Table 4. Occurrences of "low solvency" in lines 174, 176, 178 are Category A/B shorthand; authorized for light stylistic harmonization with canonical terminology. Parameter estimates and $t$-statistics remain strictly locked.
- **§5.4.4–§5.4.6 (lines 185–285):** `RED` / `SAFE_NO_EDIT`. GIRF multiplier tournament, 9m/3.55 pp, 10m/6.54 pp, point-wise multiplier differences $h=2\dots10$, gold shield pass-through. **Preserve untouched.**

---

#### 10. Section 6: Discussion and Conclusion (`06_discussion_conclusion.tex`)
- **§6.1 (lines 7–15):** `GREEN`. Roncaglia, Lakatosian progressive research programme, monetarist anomalies. Safe for stylistic polish.
- **§6.2 (lines 19–27):** `AMBER`. Empirical causality and TVAR tournament. Authorized to correct line 20: replace "quarterly" with "monthly", and calibrate "ruling out" to "providing no empirical support for" (`GREEN`). Multiplier numbers strictly locked.
- **§6.3 (lines 31–39):** `GREEN`. International currency hierarchy, hegemonic contingency, Zoeller, BCCh institutional agency, MMT critique. Safe for cadence polish.
- **§6.4 (lines 43–51):** `SAFE_NO_EDIT`. Methodological boundaries of macro time-series econometrics and policy resilience. Self-contained authorial disclaimer; no Gailmard addition needed.

---

#### 11. Appendices (A through E)
- **Appendix A (`appendix_bop_levr.tex`):** `AMBER`. Mathematical derivations of BoP accounting, convex solvency boundaries. Line 140 absolute verb "refuting" authorized for calibration (`GREEN`).
- **Appendix B (`appendix_archival_codebook.tex`):** `RED` / `SAFE_NO_EDIT`. Archival database codes and variable definitions. **Preserve untouched.**
- **Appendix C (`appendix_causal_pcmci_ee1.tex`):** `RED` / `SAFE_NO_EDIT`. PCMCI causal discovery methodology, MCI test statistics, DAG visualization. **Preserve untouched.**
- **Appendix D (`appendix_tvar_girf_atlas.tex`):** `RED` / `SAFE_NO_EDIT`. 25-pathway GIRF atlas, multiplier differences, regime-switching probabilities. **Preserve untouched.**
- **Appendix E (`appendix_linear_var_diagnostics.tex`):** `AMBER`. Diagnostics for Systems 4 & 5. Remove 2 transitional fillers in table notes (lines 47, 79, `GREEN`). Test statistics strictly locked.

---

#### 12. Active Tables (`paper/Version7/tables/`)
- **Table 0, Table 1, Table 2, Table 3, Table 5 (Appendices):** `RED` / `SAFE_NO_EDIT`. Strictly locked.
- **Table 4 (`tab04_tvar_estimates.tex`):** `GREEN`. Panel A header is Category A shorthand label; authorized to harmonize to "Conditions of Central Bank Insolvency". Parameter estimates strictly locked.
