# 02 STYLE FINGERPRINT

*Phase B: Inferred dissertation shell from frozen chapters*
*Generated: 2026-09-30*

---

## COMMON STYLE

Formatting shared by all three chapters, verified against frozen source files:

| Property | Value |
|----------|-------|
| Base font size | 11pt |
| Font family | Latin Modern (`lmodern`) — standard LaTeX serif |
| Paper | letterpaper (Ch1, Ch2); Ch3 uses a4paper — dissertation shell uses **letterpaper** |
| Margins | 1 inch all sides |
| Line spacing | Near-single (~1.05 stretch, or equivalent parskip rhythm) |
| Math | `amsmath` + `amssymb` |
| Figures | `graphicx`, `float`, `caption` |
| Tables | `booktabs`, `longtable` |
| Bibliography | `natbib` authoryear + `apalike` style |
| Hyperlinks | `colorlinks=true`, blue/darkblue links |
| Captions | `caption` package, default or near-default style |
| Section headings | Standard LaTeX sectioning — no decorative elements, no color |
| Citation style | Author-year in-text: `\citet{}`, `\citep{}` |

**Governing visual character**: academic working paper. Restrained. No institutional branding, no oversized chapter numbers, no decorative rules.

---

## CHAPTER-SPECIFIC REQUIREMENTS

Packages or macros used in only one chapter that must be preserved:

### Chapter 1 only
- `pdflscape` (landscape table A.3 in appendix)
- `booktabs` loaded twice (harmless duplication, absorbed in unified config)

### Chapter 2 only
- `cleveref` — used for `\cref{}` and `\Cref{}` throughout
- `siunitx` — `S` columns for decimal-aligned tables
- `threeparttable` — table notes
- `subcaption` — sub-figure panels
- `placeins` + `\FloatBarrier` — section-level float barriers
- Notation macros: `\mut`, `\chit`, `\kapt`, `\knrc`, `\kme`, `\Ypot`, `\mech`, `\pkap`, `\impint`, `\deprec`, `\discard`, `\stepD`, `\stepDsys`, `\MPF`
- `\PLACEHOLDER` environment (draft utility — safe to preserve)

### Chapter 3 only
- `babel` (english) + `fontenc` (T1)
- `titlesec` — custom section heading formatting
- `fancyhdr` — loaded but immediately set to `\pagestyle{plain}`
- `appendix` package (with `titletoc,toc,title` options) — wraps appendices
- `amsthm` — Theorem and Corollary environments
- `xcolor` (dvipsnames) — named color palette for tikz
- `tikz` + libraries (`arrows.meta`, `positioning`, `calc`, `matrix`) — causal DAG
- `tabularx` — width-filling tables
- `makecell` — multi-line table cells
- `xfrac` — slanted fractions
- `ragged2e` — ragged-right text
- `enumitem` — custom list formatting
- `bm` — bold math
- `\parskip{0.55em}` + `\parindent{0pt}` — Ch3 paragraph rhythm
- Named colors: `navy`, `crimson`, `amber`, `darkgreen`, `slate`, `darkblue`, `ink`, etc.
- `\newcolumntype{L}[1]` and `\newcolumntype{C}[1]`
- Theorem/Corollary environments

---

## PRESENTATIONAL DIFFERENCES

Differences that are merely stylistic and may safely remain chapter-specific:

1. **Paragraph rhythm**: Ch1/Ch2 use `\setstretch{1.05}` (interline); Ch3 uses `\parskip{0.55em}` + no indent. Both produce restrained academic spacing. The dissertation shell sets a baseline; Ch3's local overrides persist within its scope.

2. **Hyperlink color**: Ch1/Ch2 use pure `blue`; Ch3 uses `darkblue` (HTML `#000080` equivalent). Visually indistinguishable in print; acceptable difference.

3. **Abstract placement**: Ch1/Ch2 use the standard `abstract` environment after `\maketitle`; Ch3 embeds the abstract inside a `titlepage` environment. Both are suppressed by integration wrappers and replaced by a uniform chapter opening.

4. **Section hierarchy depth**: Ch1 uses `\paragraph{}` numbered subsections (1.1, 1.2…); Ch2 and Ch3 use standard `\section`/`\subsection`. This is a content-level difference — not harmonized.

5. **Table complexity**: Ch2 has more elaborate tables (siunitx S-columns, threeparttable notes); Ch3 has many landscape tables. Both work with the unified package set.

6. **Appendix architecture**: Ch1 uses two `\appendix`-level inputs; Ch2 uses six; Ch3 uses the `appendix` package with five. All three are preserved as-is within their wrappers.

---

## TECHNICAL CONFLICTS

Actual incompatibilities requiring resolution:

### 1. Label collision: `sec:introduction`
**Status**: CRITICAL  
Ch1 (`section1.tex` line 2: `\label{sec:introduction}`) and Ch3 (`sections/01_introduction.tex` line 2: `\label{sec:introduction}`) both define the same label.  
**Resolution**: Integration wrappers use `\renewcommand{\theHchapter}` and chapter-prefixed label aliasing. Since no cross-chapter `\ref{sec:introduction}` exists (verified), the collision produces only a "multiply defined" LaTeX warning. The integration approach uses `\chaptermark` isolation — the duplicate labels will trigger a warning but not a compilation failure, and hyperref will resolve to whichever comes last. **Preferred solution**: document this in the ledger; address only if hyperref anchor misbehavior is observed.

### 2. `appendix` package (Ch3) vs. `\appendix` command (Ch1, Ch2)
**Status**: MANAGEABLE  
The `appendix` package, when loaded globally, redefines `\appendix`. Ch1 and Ch2 use `\appendix` as a command. Loading `appendix` in `config/packages.tex` would interfere.  
**Resolution**: Do NOT load the `appendix` package globally. Ch3's integration wrapper includes a local `\usepackage`-equivalent via `\RequirePackage` in the wrapper preamble — NOT possible inside `\begin{document}`. Preferred alternative: load `appendix` globally but verify that Ch1/Ch2's `\appendix` usage is unaffected. The `appendix` package is backward-compatible with `\appendix`; the `\begin{appendices}` environment is the new feature. **Test in build**.

### 3. `titlesec` (Ch3) — global heading impact
**Status**: LOW RISK  
`titlesec` is loaded in Ch3's preamble. In the integrated document, it will be loaded globally. Ch1 and Ch2 sections will inherit any `\titleformat` modifications Ch3's sections impose.  
**Resolution**: Ch3 does not define explicit `\titleformat` commands (verified by inspection — `titlesec` is loaded but heading formats use defaults). Risk is low. Load globally; monitor.

### 4. `\parskip` / `\parindent` global overrides (Ch3)
**Status**: MANAGEABLE  
Ch3's preamble sets `\setlength{\parskip}{0.55em}` and `\setlength{\parindent}{0pt}` globally. In an integrated document, these settings would apply from Chapter 3 onward (or throughout, if set in the preamble).  
**Resolution**: These Ch3 settings are moved into the Ch3 integration wrapper, scoped with `\begingroup...\endgroup`. The dissertation shell sets its own paragraph defaults (matching Ch1/Ch2's implicit defaults).

### 5. `\newcolumntype{L}` and `\newcolumntype{C}` redefinition
**Status**: WARNING ONLY  
Both Ch3 (verified) and potentially Ch2 define these column types. Duplicate `\newcolumntype` produces a LaTeX warning. Does not prevent compilation.  
**Resolution**: Define once in `config/packages.tex`; remove from Ch3 wrapper (the frozen source retains it, but the wrapper uses `\providecommand`-style protection or a conditional check).

### 6. `a4paper` vs. `letterpaper`
**Status**: RESOLVED AT SHELL LEVEL  
Ch3 uses a4paper. The `book`-class dissertation shell uses letterpaper. The `geometry` package at dissertation level overrides Ch3's standalone paper size declaration (which is suppressed along with `\documentclass`).

### 7. `natbib` + per-chapter bibliographies vs. `chapterbib`
**Status**: DESIGN DECISION  
Preferred architecture: per-chapter bibliographies using the `chapterbib` package (which enables `\bibliography{}` calls within chapters while using a single `natbib` instance). Alternative: manual `\bibliographystyle`/`\bibliography` calls with `refsection` emulation.  
**Resolution**: Use `chapterbib` — it is specifically designed for this use case. Each chapter's `\bibliography{references}` call will produce its own reference list under a chapter-level heading.

---

## PROPOSED DISSERTATION COMMON DENOMINATOR

The lightest shared configuration that reproduces existing chapter appearance:

```latex
\documentclass[11pt,oneside]{book}

% Core layout
\usepackage[letterpaper, margin=1in]{geometry}
\usepackage{lmodern}
\usepackage[T1]{fontenc}

% Spacing
\usepackage{setspace}
\setstretch{1.05}

% Math
\usepackage{amsmath,amssymb,bm}
\usepackage{amsthm}

% Microtypography
\usepackage{microtype}

% Figures and tables
\usepackage{graphicx,float}
\usepackage{array,caption,subcaption}
\usepackage{booktabs,longtable}
\usepackage{threeparttable,siunitx}
\usepackage{tabularx,makecell}
\usepackage{pdflscape,placeins}

% Lists
\usepackage{enumitem}

% Language
\usepackage[english]{babel}

% Colors
\usepackage[dvipsnames]{xcolor}

% Tikz (Ch3 figures)
\usepackage{tikz}

% Section heading restraint
\usepackage{titlesec}

% Appendix
\usepackage[titletoc,toc,title]{appendix}

% Bibliography — per-chapter
\usepackage{chapterbib}
\usepackage[authoryear,sectionbib]{natbib}

% Hyperref (near-last)
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref}

% Cleveref (after hyperref)
\usepackage{cleveref}
```

**Chapter heading restraint**: use `titlesec` to produce a plain, unnumbered-style chapter title that resembles a large `\section` rather than an ornate `\chapter`. This prevents the heavy default `book` chapter opening from clashing with the paper-like chapters.

**Governing rule**: → frozen chapter style → dissertation shell. Never the reverse.
