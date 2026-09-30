# 01 RECONNAISSANCE

*Phase A: Frozen chapter inspection*
*Generated: 2026-09-30*

---

## Repository State at Inspection

| Item | Value |
|------|-------|
| Branch | `main` |
| Remote `origin` | `https://github.com/dpolancon/phd-dissertation.git` |
| Remote `upstream` | `https://github.com/miikapaal/su-econ-dissertation-template.git` (old Stockholm template — not used) |
| Working-tree status | Old template files staged as deleted (`D`). Three frozen chapter folders present and modified. |
| Frozen chapters | `Chapter1/`, `Chapter2/`, `Chapter3/` — treated as immutable. |

---

## Chapter 1

### Primary entry point
`Chapter1/main.tex`

### Document class
`\documentclass[11pt]{article}`

### Preamble packages
| Package | Purpose |
|---------|---------|
| `lmodern` | Latin Modern fonts |
| `geometry` | letterpaper, 1in margins |
| `setspace` + `\setstretch{1.05}` | Near-single spacing |
| `amsmath`, `amssymb` | Math |
| `microtype` | Microtypography |
| `longtable` | Long tables |
| `booktabs` (loaded twice) | Table rules |
| `pdflscape` | Landscape pages (Appendix A Table A.3) |
| `graphicx` | Figures |
| `float` | Float control |
| `array` | Array/tabular extensions |
| `caption` | Caption formatting |
| `hyperref` | `colorlinks=true`, blue links |
| `natbib` with `authoryear` | Citations |

### Section structure
`\input{section1}` through `\input{section5}` (five main sections)

### Bibliography backend
`natbib` + `bibtex` with `\bibliographystyle{apalike}` and `\bibliography{references}`  
File: `Chapter1/references.bib`

### Figure directories
`Chapter1/figures/` (main figures)  
`Chapter1/appendixA/figures/` (appendix figures)

### Table assets
`Chapter1/tables/` (inline `.tex` tables)  
`Chapter1/appendixA/tables/` (appendix tables)

### Appendix structure
- `\appendix` after bibliography
- `\input{AppendixODE/AppendixODE}` — mathematical derivation appendix
- `\input{appendixA/appendixA}` — data construction appendix with figures and tables

### Local macros / custom commands
None defined in `main.tex` preamble (clean)

### Geometry
`letterpaper`, `margin=1in`

### Line spacing
`\setstretch{1.05}` (near-single)

### Font
Latin Modern (`lmodern`), 11pt

### Captions
`caption` package, default style

### Hyperlinks
`colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue`

### Citation configuration
`natbib` authoryear, `apalike` style

### Section headings
Standard `article` `\section` — no custom heading style

### Title/abstract/keywords/JEL structure
- `\title{...}` with `\thanks{AI editing disclosure}`
- `\author{...}` with `\thanks{Doctoral Candidate affiliation}`
- `\begin{abstract}...\end{abstract}`
- Keywords: `\noindent\textbf{Keywords:}`
- JEL Codes: `\noindent\textbf{JEL Codes:}`
- `\pagebreak` after keywords/JEL before sections

### Standalone machinery
`\begin{document}`, `\maketitle`, `\end{document}` — must be suppressed in integration

### Work-in-progress notice
`\textbf{WORK IN PROGRESS / PLEASE DO NOT CIRCULATE}` inside `\title{}`

### Label namespace (selected)
`sec:introduction`, `fig:main_*`, `fig:app_*`, `eq:app_*`, `eq:ardl_*`, `eq:vecm_*`, `eq:s2_*`, `eq:fbounds_*`

---

## Chapter 2

### Primary entry point
`Chapter2/main.tex`

### Document class
`\documentclass[11pt]{article}`

### Preamble packages
| Package | Purpose |
|---------|---------|
| `lmodern` | Latin Modern fonts |
| `geometry` | letterpaper, 1in margins |
| `setspace` + `\setstretch{1.05}` | Near-single spacing |
| `amsmath`, `amssymb` | Math |
| `microtype` | Microtypography |
| `graphicx` | Figures |
| `float` | Float control |
| `array` | Array extensions |
| `caption` | Captions |
| `subcaption` | Sub-figures |
| `placeins` + `\FloatBarrier` | Float barriers between sections |
| `longtable` | Long tables |
| `booktabs` | Table rules |
| `threeparttable` | Table notes |
| `siunitx` | Decimal-aligned `S` columns |
| `pdflscape` | Landscape pages |
| `natbib` with `authoryear` | Citations (loaded before hyperref) |
| `hyperref` | `colorlinks=true`, blue links |
| `cleveref` | `\cref` and `\Cref` (loaded after hyperref) |

### Section structure
`\input{section1}` through `\input{section6}` (six main sections)
Chapter 2 also includes `\tableofcontents` and `\pagebreak` before sections (standalone reading aid — suppressed in integration)

### Bibliography backend
`natbib` + `bibtex` with `\bibliographystyle{apalike}` and `\bibliography{references}`  
File: `Chapter2/references.bib`

### Figure directories
`Chapter2/figures/` (very large — ~80 figures)

### Table assets
`Chapter2/tables/` (`.tex` table files)

### Appendix structure
- `\appendix` after bibliography
- Six appendix files: `appendixA.tex` through `appendixF.tex`

### Local macros / custom commands
Extensive notation macros (Symbology Lock):
`\mut`, `\chit`, `\kapt`, `\knrc`, `\kme`, `\Ypot`, `\mech`, `\pkap`, `\impint`, `\deprec`, `\discard`, `\stepD`, `\stepDsys`, `\MPF`  
Also: `\PLACEHOLDER` command (debug/draft utility)  
Column types: `L[1]` and `C[1]` via `\newcolumntype`

### Geometry
`letterpaper`, `margin=1in`

### Line spacing
`\setstretch{1.05}` (near-single)

### Font
Latin Modern (`lmodern`), 11pt

### Captions
`caption` + `subcaption`

### Hyperlinks
`colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue`

### Citation configuration
`natbib` authoryear, `apalike` style; `cleveref` for cross-references

### Section headings
Standard `article` `\section` — no custom heading style

### Title/abstract/keywords/JEL structure
Same pattern as Chapter 1: `\title`, `\author`, `\begin{abstract}`, Keywords, JEL Codes

### Standalone machinery
`\begin{document}`, `\maketitle`, `\end{document}`, standalone `\tableofcontents`

### Work-in-progress notice
`\textbf{WORK IN PROGRESS / PLEASE DO NOT CIRCULATE}` inside `\title{}`

### Label namespace (selected)
`sec:intro`, `eq:31:*`, `eq:32:*`, `eq:33:*`, `app:A1:*`, `app:chile_*`, `app:specA_*`, `app:specB_*`

---

## Chapter 3

### Primary entry point
`Chapter3/Chapter3_Paper.tex`

### Document class
`\documentclass[11pt,a4paper]{article}` ← **a4paper** (differs from Ch1/Ch2 letterpaper)

### Preamble packages
| Package | Purpose |
|---------|---------|
| `babel` (english) | Language |
| `fontenc` (T1) | Font encoding |
| `lmodern` | Latin Modern fonts |
| `geometry` | a4paper, 1in margins |
| `graphicx` | Figures |
| `float` | Float control |
| `booktabs` | Table rules |
| `array` | Array extensions + custom column types `L[1]`, `C[1]` |
| `caption` | Captions |
| `subcaption` | Sub-figures |
| `tabularx` | Width-filling tables |
| `makecell` | Multi-line cells |
| `amsmath`, `amssymb`, `bm` | Math |
| `enumitem` | List formatting |
| `titlesec` | Custom section headings |
| `natbib` with `authoryear` | Citations |
| `hyperref` | Hyperlinks (not `colorlinks` — uses `\hypersetup` with `darkblue`) |
| `fancyhdr` + `\pagestyle{plain}` | Header/footer (set to plain) |
| `pdflscape` | Landscape pages |
| `xfrac` | Slanted fractions |
| `ragged2e` | Ragged-right text |
| `appendix` (titletoc, toc, title) | Appendix formatting |
| `amsthm` + theorems | Theorem/Corollary environments |
| `xcolor` (dvipsnames) | Named colors |
| `tikz` + libraries | Causal DAG figures |

### Section structure
`\input{sections/01_introduction}` through `\input{sections/06_discussion_conclusion}` (six sections)

### Bibliography backend
`natbib` + `bibtex` with `\bibliographystyle{apalike}` and `\bibliography{references}`  
File: `Chapter3/references.bib`  
`\setlength{\bibsep}{2.5pt}` inside `\begingroup...\endgroup`

### Figure directories
`Chapter3/figures/` (many IRF and TVAR figures, PDF and PNG)

### Table assets
`Chapter3/tables/` (many `.tex` table files)

### Appendix structure
- `\begin{appendices}...\end{appendices}` using `appendix` package
- Five appendices: `appendix_bop_levr`, `appendix_archival_codebook`, `appendix_causal_pcmci_ee1`, `appendix_tvar_girf_atlas`, `appendix_linear_var_diagnostics`

### Local macros / custom commands
- Custom `\newcolumntype{L}[1]` and `\newcolumntype{C}[1]`
- Named colors: `navy`, `crimson`, `amber`, `darkgreen`, `slate`, `darkblue`, etc.
- `tikz` color aliases: `ink`, `subink`, `lightink`, `guide`, `panel`, `panelb`, `panelc`, `stress`
- Theorem/Corollary environments
- `\setlength{\parskip}{0.55em}`, `\setlength{\parindent}{0pt}`

### Geometry
`a4paper`, `margin=1in`

### Line spacing
No explicit `setspace` — uses `\parskip{0.55em}`, `\parindent{0pt}` for paragraph separation

### Font
Latin Modern (`lmodern`), 11pt, T1 encoding

### Captions
`caption` + `subcaption`

### Hyperlinks
`hyperref` with `\hypersetup{bookmarksnumbered=true, colorlinks=true, citecolor=darkblue, linkcolor=darkblue, urlcolor=darkblue}` (dark blue, slightly different from Ch1/Ch2 pure blue)

### Citation configuration
`natbib` authoryear, `apalike` style

### Section headings
`titlesec` package (may override standard headings)

### Title/abstract/keywords/JEL structure
Uses full `\begin{titlepage}...\end{titlepage}` environment  
Title, author, affiliation, date inside titlepage  
`\begin{abstract}...\end{abstract}` inside titlepage  
Keywords and JEL Codes embedded in abstract block

### Standalone machinery
`\begin{document}`, `\begin{titlepage}`, `\tableofcontents` (with `\setlength{\parskip}{1.5pt}` locally), `\end{document}`

### Work-in-progress notice
**Not present** in Chapter 3 (unlike Ch1 and Ch2)

### AI disclosure
Present inside `\thanks{}` in both `\title` and inside the titlepage author block (duplicated)

### Label namespace (selected)
`sec:introduction`, `sec:literature_review`, `sec:macro_framework`, `sec:data_sources`, `sec:historical_empirical_results`, `sec:discussion_conclusion`, `app:bop_levr`, `app:archival_codebook`, `app:pcmci_ee1`, `app:tvar_girf_atlas`, `app:linear_var_diagnostics`, `eq:app_b_*`, `eq:app_c_*`, `eq:app_d_*`

---

## Cross-Chapter Comparison

### Shared conventions
| Aspect | Ch1 | Ch2 | Ch3 |
|--------|-----|-----|-----|
| Document class | article 11pt | article 11pt | article 11pt |
| Font | lmodern | lmodern | lmodern |
| Margins | 1in all sides | 1in all sides | 1in all sides |
| Paper | letterpaper | letterpaper | **a4paper** |
| natbib style | authoryear | authoryear | authoryear |
| Bib style | apalike | apalike | apalike |
| Line spacing | setstretch 1.05 | setstretch 1.05 | parskip 0.55em |
| Hyperref | colorlinks, blue | colorlinks, blue | colorlinks, darkblue |

### Chapter-specific requirements
- **Ch2 only**: `cleveref`, `siunitx`, `threeparttable`, `placeins`, `subcaption`, notation macros
- **Ch3 only**: `titlesec`, `fancyhdr`, `appendix` pkg, `xcolor`, `tikz`, `tabularx`, `makecell`, `xfrac`, `ragged2e`, `amsthm`, `babel`, `fontenc`, `bm`, `enumitem`, `\parskip`/`\parindent` global overrides

### Label collisions identified
| Label | Ch1 | Ch2 | Ch3 |
|-------|-----|-----|-----|
| `sec:introduction` | ✓ | — | ✓ **COLLISION** |
| `L[1]` newcolumntype | — | — | Ch3 (also in Ch2 if redefined) |

**Critical**: `sec:introduction` is defined in both Ch1 and Ch3. Must be namespaced.

### Genuine package conflicts
1. **`appendix` package** (Ch3) vs. `\appendix` command (Ch1, Ch2): the `appendix` package redefines `\appendix`. Needs careful isolation.
2. **`titlesec`** (Ch3): may alter global heading format if not scoped.
3. **`fancyhdr`** (Ch3) with `\pagestyle{plain}`: Ch3 loads fancyhdr but immediately sets plain style — low conflict risk.
4. **`\parskip`/`\parindent`** (Ch3): global overrides that affect subsequent chapters if not reset.
5. **`\newcolumntype{L}` and `\newcolumntype{C}`** (Ch3, possibly Ch2): redefinition warning if both define same column type.
6. **`a4paper`** (Ch3): conflicts with integration target of letterpaper — overridden at dissertation level.

### Elements relevant only because chapters are standalone
- `\documentclass`, `\begin{document}`, `\end{document}` — suppressed via wrappers
- `\maketitle` / `\begin{titlepage}` — replaced by integration chapter opening
- Standalone `\tableofcontents` in Ch2 — suppressed
- `\pagestyle{plain}` in Ch3 — preserved but harmless with `book` class handling
