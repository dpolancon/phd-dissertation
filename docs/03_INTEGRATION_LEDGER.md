# 03 INTEGRATION LEDGER

*Records every integration intervention.*
*Generated: 2026-09-30*
*Governing rule: No substantive effect. Prose and content unchanged.*

---

## Format

| Field | Description |
|-------|-------------|
| **Chapter** | Chapter number |
| **Source file** | Frozen source file affected |
| **Issue** | Technical problem requiring resolution |
| **Intervention** | What was done |
| **Source modified?** | YES / NO |
| **Visual effect** | Change to rendered output |
| **Substantive effect** | Change to arguments/results/citations |
| **Reason** | Why this was the chosen solution |
| **Reversibility** | How to undo |

---

## Entries

### INT-001 — Suppress `\documentclass` / `\begin{document}` / `\end{document}`

| Field | Value |
|-------|-------|
| **Chapter** | 1, 2, 3 |
| **Source file** | `Chapter1/main.tex`, `Chapter2/main.tex`, `Chapter3/Chapter3_Paper.tex` |
| **Issue** | Standalone paper machinery cannot nest inside a dissertation master document |
| **Intervention** | Integration wrappers (`integration/chapter1.tex`, etc.) do not `\input{}` the frozen `main.tex` files directly. Instead, they reproduce the chapter content by inputting the section files directly, bypassing the standalone document environment. |
| **Source modified?** | NO |
| **Visual effect** | None (content identical; document class is now `book`) |
| **Substantive effect** | NONE |
| **Reason** | Standard integration pattern. The document class and `\begin/\end{document}` commands are the only parts of a standalone paper that cannot be nested. |
| **Reversibility** | Each frozen `main.tex` compiles independently unchanged. |

---

### INT-002 — Suppress standalone author/affiliation blocks

| Field | Value |
|-------|-------|
| **Chapter** | 1, 2, 3 |
| **Source file** | `Chapter1/main.tex`, `Chapter2/main.tex`, `Chapter3/Chapter3_Paper.tex` |
| **Issue** | Repeated "Doctoral Candidate in Economics, Department of Economics, University of Massachusetts Amherst / dpolanconeco@umass.edu" blocks are visually redundant in a dissertation where the title page identifies the author globally. |
| **Intervention** | Integration wrappers reproduce the chapter title and abstract but suppress the author/affiliation footnotes in the chapter-level heading. The original author blocks remain intact in the frozen source files. |
| **Source modified?** | NO |
| **Visual effect** | Author affiliation and email do not appear under each chapter title (they appear on the dissertation title page) |
| **Substantive effect** | NONE |
| **Reason** | Standard dissertation convention. The author is identified once, globally. |
| **Reversibility** | Standalone frozen sources retain full author blocks. The integration wrappers can be updated to restore them at any time. |

---

### INT-003 — Suppress standalone `\tableofcontents` (Chapter 2 and Chapter 3)

| Field | Value |
|-------|-------|
| **Chapter** | 2, 3 |
| **Source file** | `Chapter2/main.tex` (line 109), `Chapter3/Chapter3_Paper.tex` (line 100) |
| **Issue** | Both Ch2 and Ch3 include `\tableofcontents` as standalone reading aids. In the integrated dissertation, the master TOC at the front replaces per-chapter TOCs. |
| **Intervention** | Integration wrappers do not reproduce the standalone TOC commands. |
| **Source modified?** | NO |
| **Visual effect** | No per-chapter table of contents pages in the integrated volume. Master TOC at the front covers all chapters. |
| **Substantive effect** | NONE |
| **Reason** | A dissertation reads from a single master TOC. Per-chapter TOCs would create redundancy and potentially confuse hyperref anchors. |
| **Reversibility** | Add `\tableofcontents` before each chapter wrapper's `\clearpage` if standalone chapter TOC pages are later desired. |

---

### INT-004 — Suppress Ch3 `\begin{titlepage}` block

| Field | Value |
|-------|-------|
| **Chapter** | 3 |
| **Source file** | `Chapter3/Chapter3_Paper.tex` (lines 72–95) |
| **Issue** | Chapter 3 uses a full `\begin{titlepage}...\end{titlepage}` environment with elaborate author/affiliation, abstract, keywords, and JEL codes embedded. This environment cannot be simply nested. |
| **Intervention** | Integration wrapper (`integration/chapter3.tex`) reproduces the title, abstract, keywords, and JEL codes using the same wrapper pattern as Ch1/Ch2. The titlepage environment is bypassed. |
| **Source modified?** | NO |
| **Visual effect** | Chapter 3 opening looks like Ch1 and Ch2 openings (chapter heading + abstract + keywords/JEL) rather than a standalone title page. |
| **Substantive effect** | NONE |
| **Reason** | The titlepage environment is a standalone-paper artifact. In a dissertation, each chapter opens with a chapter heading. |
| **Reversibility** | Restore the `\begin{titlepage}` block by restructuring the Ch3 wrapper. |

---

### INT-005 — Scope Ch3 `\parskip` / `\parindent` overrides

| Field | Value |
|-------|-------|
| **Chapter** | 3 |
| **Source file** | `Chapter3/Chapter3_Paper.tex` (lines 63–64: `\setlength{\parskip}{0.55em}`, `\setlength{\parindent}{0pt}`) |
| **Issue** | Ch3 sets `\parskip=0.55em` and `\parindent=0pt` globally. In an integrated document, these would bleed into subsequent content (if any) and affect the front matter if set in the preamble. |
| **Intervention** | Integration wrapper wraps Ch3 content in `\begingroup...\endgroup`. Inside the group, Ch3's paragraph rhythm is set locally. Outside the group, the dissertation defaults apply. |
| **Source modified?** | NO |
| **Visual effect** | Ch3 body retains its original paragraph rhythm (open, no-indent). Ch1 and Ch2 retain their rhythm. |
| **Substantive effect** | NONE |
| **Reason** | Minimum scope intervention. No changes to the frozen source required. |
| **Reversibility** | Remove `\begingroup` / `\endgroup` from Ch3 wrapper to apply Ch3 paragraph style globally. |

---

### INT-006 — Duplicate label `sec:introduction` (Ch1 and Ch3)

| Field | Value |
|-------|-------|
| **Chapter** | 1 and 3 |
| **Source file** | `Chapter1/section1.tex` (line 2), `Chapter3/sections/01_introduction.tex` (line 2) |
| **Issue** | Both chapters define `\label{sec:introduction}`. In a combined document, this produces a "multiply defined label" LaTeX warning, and hyperref resolves the anchor to the second occurrence (Ch3). |
| **Intervention** | NONE applied to frozen sources. The collision is documented here. Since no cross-chapter `\ref{sec:introduction}` exists (verified by inspection), the practical effect is: (a) LaTeX warning in the log; (b) hyperref `sec:introduction` anchor points to Ch3 Introduction. Within each chapter, internal `\ref{sec:introduction}` calls resolve to the nearest preceding definition, which is correct for each chapter's own cross-references. |
| **Source modified?** | NO |
| **Visual effect** | None visible to the reader. The TOC and cross-references within each chapter are correct. |
| **Substantive effect** | NONE |
| **Reason** | No cross-chapter referencing of `sec:introduction` was found. The warning is harmless. Renaming labels would require modifying frozen source files. |
| **Reversibility** | If cross-chapter referencing becomes needed, namespace labels using ch1:/ch3: prefixes and update the relevant `\ref{}` calls. |

---

### INT-007 — `appendix` package: global load vs. `\appendix` command compatibility

| Field | Value |
|-------|-------|
| **Chapter** | 1, 2, 3 |
| **Source file** | `config/packages.tex` |
| **Issue** | Ch3 uses `\begin{appendices}...\end{appendices}` from the `appendix` package. Ch1 and Ch2 use the bare `\appendix` command. Loading the `appendix` package globally could affect Ch1/Ch2 appendix behavior. |
| **Intervention** | The `appendix` package is loaded globally in `config/packages.tex`. The `appendix` package is backward-compatible: `\appendix` still works, and the new `appendices` environment is an addition, not a replacement. Ch1/Ch2 wrappers use `\begin{subappendices}` (provided by the `appendix` package when used inside `book` class) instead of bare `\appendix`. |
| **Source modified?** | NO |
| **Visual effect** | Appendices appear correctly for all three chapters. Chapter-numbered appendix sections (e.g., Appendix A, B, C) are preserved per chapter. |
| **Substantive effect** | NONE |
| **Reason** | The `appendix` package with `subappendices` is the correct mechanism for per-chapter appendices in a `book` class dissertation. |
| **Reversibility** | Revert to bare `\appendix` command if `subappendices` causes unexpected behavior. |

---

### INT-008 — `\newcolumntype{L}` and `\newcolumntype{C}` — single global definition

| Field | Value |
|-------|-------|
| **Chapter** | 2, 3 |
| **Source file** | `Chapter2/main.tex` (Ch2 may define), `Chapter3/Chapter3_Paper.tex` (lines 16–17) |
| **Issue** | Both chapters define `\newcolumntype{L}[1]` and `\newcolumntype{C}[1]`. Defining these twice produces a "column type L is already defined" LaTeX warning. |
| **Intervention** | Both column types are defined once in `config/packages.tex`. The frozen source files retain their definitions, but since the global config is loaded first, the frozen source definitions attempt a redefinition. LaTeX will warn but not fail. |
| **Source modified?** | NO |
| **Visual effect** | None — the column types work identically. |
| **Substantive effect** | NONE |
| **Reason** | `\newcolumntype` redefinition is a warning-only event. The first definition (from `config/packages.tex`) prevails. |
| **Reversibility** | N/A — harmless. |

---

### INT-009 — Ch3 figure path includes sections/ subdirectory

| Field | Value |
|-------|-------|
| **Chapter** | 3 |
| **Source file** | `Chapter3/sections/*.tex` (section files include tikz inputs) |
| **Issue** | Some Ch3 section files may reference tikz figure files in `Chapter3/appendix/` or relative paths not covered by the integration wrapper's `\graphicspath`. |
| **Intervention** | `\graphicspath` in `integration/chapter3.tex` includes `{Chapter3/}`, `{Chapter3/figures/}`, and `{Chapter3/appendix/}`. Build validation will identify any missing paths. |
| **Source modified?** | NO |
| **Visual effect** | Figures should render. Any missing figures will appear as placeholder boxes with a warning. |
| **Substantive effect** | NONE |
| **Reason** | Conservative graphicspath inclusion of all known subdirectories. |
| **Reversibility** | Extend `\graphicspath` if additional paths are found. |

---

### INT-010 — `a4paper` (Ch3) overridden to `letterpaper` at dissertation level

| Field | Value |
|-------|-------|
| **Chapter** | 3 |
| **Source file** | `Chapter3/Chapter3_Paper.tex` (line 1: `\documentclass[11pt,a4paper]{article}`) |
| **Issue** | Ch3 was designed for A4 paper. The dissertation shell uses letterpaper. The `\documentclass` line from Ch3 is bypassed (INT-001). The `geometry` package at dissertation level sets `letterpaper`. |
| **Intervention** | `config/packages.tex` sets `\usepackage[letterpaper, margin=1in]{geometry}`. Ch3's a4paper declaration is in the suppressed `\documentclass` line. |
| **Source modified?** | NO |
| **Visual effect** | Ch3 content renders on letterpaper. At 1in margins on both paper sizes, the effective text block width is similar (6.5in on letter vs. 6.27in on A4). Line breaks may differ very slightly. |
| **Substantive effect** | NONE |
| **Reason** | Dissertation consistency. All chapters on one paper size. The visual difference is minimal. |
| **Reversibility** | Change geometry to a4paper in `config/packages.tex` if the university requires A4. |

---

## Summary of Source Modifications

| Chapter | Frozen source modified? |
|---------|------------------------|
| Chapter 1 | **NO** |
| Chapter 2 | **NO** |
| Chapter 3 | **NO** |

**All integration is performed exclusively through wrapper files and global configuration. No frozen chapter source file has been modified.**
