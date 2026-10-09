# 06 — Figure 21 Reproducibility and Upstream Risk Note

**Pass:** Final Consolidated Pass 05 — Cumulative `final_pass.py` v1.1 + Reader-Guard Extension  
**Target Asset:** `workingpapers/chapter1/appendixA/figures/fig_A5_dummies_residuals.pdf` (Rendered as Figure 21 in Appendix A)  
**Date:** October 2026  

---

## Objective

This note documents the provenance, pipeline durability, and regeneration risk of the legend correction applied to Figure 21 (replacing legacy deterministic dummy labels $D_{56}, D_{74}, D_{80}$ with verified pulse dummy labels $P_{56}, P_{74}, P_{80}$, conforming to the notation established in the text).

---

## Forensic Audit of Figure Generation Pipeline

### 1. Repository-Wide Code Search
A recursive search was conducted across all executable script formats (`*.R`, `*.py`, `*.do`, `*.sh`) in both active repositories:
- `C:\ReposGitHub\phd-dissertation`
- `C:\ReposGitHub\Critical-Replication-Shaikh`

**Search Query Patterns:**
- `fig_A5`
- `dummies_residuals`
- `D_56` / `P_56`

### 2. Findings
1. **Working Paper Repository (`phd-dissertation`):**
   - No figure-generating script in `scripts/` or `workingpapers/chapter1/` creates `fig_A5_dummies_residuals.pdf`.
   - The only references to `fig_A5_dummies_residuals.pdf` occur in:
     - `workingpapers/chapter1/appendices/appendix_A_ODE.tex` (LaTeX `\includegraphics` call)
     - `workingpapers/chapter1/tools/final_pass.py` (Double-layer verification check `F6`)
2. **Empirical Repository (`Critical-Replication-Shaikh`):**
   - Historical static copies of `fig_A5_dummies_residuals.pdf` exist in archived version snapshots:
     - `output/appendix_A/figures/fig_A5_dummies_residuals.pdf` (dated May 14, 2026)
     - `chapter1_edit/02_Versions/.../fig_A5_dummies_residuals.pdf` (dated June 16, 2026)
   - No active script in `codes/` (such as `20_S0_figureGPIM.R`, `80_pack_ch1_replication.R`, or `99_figure_protocol.R`) contains code generating `fig_A5_dummies_residuals.pdf`.
   - The figure was historically created as a standalone diagnostic output prior to the consolidation of the active R pipeline.

---

## Risk Assessment

- **UPSTREAM_REGENERATION_RISK:** **NO**
- **Canonical Asset Status:** The corrected vector PDF file located at:
  `workingpapers/chapter1/appendixA/figures/fig_A5_dummies_residuals.pdf` (68,525 bytes)
  is the **canonical frozen asset** for the standalone working paper.
- **Durability Guarantee:** Because no automated build tool, Makefile, or R runner in the working paper compilation workflow invokes an upstream generator to overwrite this figure, the $P_{56}, P_{74}, P_{80}$ correction is completely durable across all standard LaTeX builds (`latexmk`, `pdflatex`).

---

## Verification State
- Vector source text: Verified containing `P_56`, `P_74`, `P_80` (Check `F6` Source: `PASS`).
- Compiled PDF page 56: Verified displaying `P_56`, `P_74`, `P_80` via PyMuPDF text and WinRT OCR extraction (Check `F6` Rendered: `PASS`).
- Check `F6` Overall Status: **`PASS`**.
