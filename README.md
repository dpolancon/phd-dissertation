# phd-dissertation

## Purpose

This repository assembles frozen versions of Diego Polanco's three dissertation
chapters into a minimally integrated dissertation manuscript. The goal is to
produce a clean, coherent dissertation PDF that preserves the visual identity of
the frozen chapters while adding only the minimum structure required to read them
as a single volume.

This is an integration repository, not a formatting or editing repository.

---

## Frozen Source Rule

```
Chapter1/
Chapter2/
Chapter3/
```

These directories contain author-selected, frozen versions of each dissertation
chapter. They are the **authoritative source material** and should not be
casually edited during dissertation-shell work.

- Do not modify prose.
- Do not alter empirical results or citations.
- Do not redesign chapters for visual consistency.
- Do not recover deleted versions from Git history.
- Do not search external repositories for "newer" versions.

The author has already made the version-selection decision.

All integration work is performed through wrapper files in `integration/` and
configuration in `config/`. See `docs/03_INTEGRATION_LEDGER.md` for a record
of every technical intervention.

---

## Build

```bash
latexmk -pdf dissertation.tex
```

Output: `build/dissertation.pdf`

Requires: TeX Live 2020+ or equivalent with `pdflatex`, `bibtex`, and standard
CTAN packages including `natbib`, `chapterbib`, `cleveref`, `siunitx`,
`threeparttable`, `tikz`, `appendix`, `titlesec`.

**Alternative (manual multi-pass):**

```bash
pdflatex -interaction=nonstopmode dissertation.tex
bibtex build/chapter1
bibtex build/chapter2
bibtex build/chapter3
pdflatex -interaction=nonstopmode dissertation.tex
pdflatex -interaction=nonstopmode dissertation.tex
```

---

## Architecture

```
phd-dissertation/
│
├── dissertation.tex          # Master document
├── latexmkrc                 # Build configuration
├── README.md
│
├── Chapter1/                 # FROZEN — Chapter 1 source
├── Chapter2/                 # FROZEN — Chapter 2 source
├── Chapter3/                 # FROZEN — Chapter 3 source
│
├── config/
│   ├── packages.tex          # All packages loaded once (replaces per-chapter preambles)
│   ├── macros.tex            # Global macro definitions
│   ├── style.tex             # Dissertation-level presentation settings
│   └── chapter-adapters.tex  # Notes and utilities for chapter integration
│
├── frontmatter/
│   └── working-title.tex     # Temporary working title page (NOT final)
│
├── integration/
│   ├── chapter1.tex          # Wrapper: adapts Ch1 for dissertation context
│   ├── chapter2.tex          # Wrapper: adapts Ch2 for dissertation context
│   └── chapter3.tex          # Wrapper: adapts Ch3 for dissertation context
│
├── docs/
│   ├── 01_RECONNAISSANCE.md  # Phase A: frozen chapter inspection
│   ├── 02_STYLE_FINGERPRINT.md # Phase B: inferred dissertation style
│   ├── 03_INTEGRATION_LEDGER.md # Record of all technical interventions
│   └── 04_BUILD_REPORT.md    # Build validation report
│
└── build/                    # Compilation artifacts (generated, not versioned)
```

**Integration wrappers** (`integration/*.tex`) handle the translation from
standalone article format to dissertation chapter format:
- Suppress `\documentclass`, `\begin{document}`, `\end{document}`
- Suppress per-chapter `\maketitle` and `\tableofcontents`
- Reproduce chapter title, abstract, keywords, JEL codes
- Set per-chapter `\graphicspath`
- Invoke chapter-local `\bibliography{}` (per-chapter references via `chapterbib`)
- Handle `\subappendices` for per-chapter appendix sections

---

## Current Scope

This minimal integration package currently contains:

- ✅ Working title page (temporary)
- ✅ Table of Contents
- ✅ List of Figures
- ✅ Chapter 1 — *Critical Replication of Shaikh's Capacity Utilization Measure*
- ✅ Chapter 2 — *The Transformation of Accumulation into Productive Capacities*
- ✅ Chapter 3 — *Re-visiting the Political Economy of the Unidad Popular*
- ✅ Chapter-specific bibliographies (per-chapter, not merged)
- ✅ Chapter-specific appendices

---

## Deferred Work

The following elements are explicitly **out of scope** for this pass and will be
constructed in later stages:

- [ ] Final front matter (abstract, dedication, acknowledgments)
- [ ] Committee page, copyright page, institutional approval pages
- [ ] Consolidated dissertation introduction
- [ ] Consolidated discussion / conclusion
- [ ] Institutional submission formatting (margins, font requirements, etc.)
- [ ] Final dissertation metadata
- [ ] List of Tables (deferred — see `docs/04_BUILD_REPORT.md`)
- [ ] AI-assistance consolidated disclosure statement
- [ ] Final submission compliance review

---

## Chapter Titles

| Chapter | Title |
|---------|-------|
| 1 | Critical Replication of Shaikh's Capacity Utilization Measure |
| 2 | The Transformation of Accumulation into Productive Capacities: Capacity Utilization in the Center and Periphery |
| 3 | Re-visiting the Political Economy of the Rise and Fall of the Unidad Popular: Towards a Global Political Economy Approach |

---

## Documentation

See `docs/` for:
- `01_RECONNAISSANCE.md` — detailed audit of each frozen chapter's LaTeX structure
- `02_STYLE_FINGERPRINT.md` — inferred dissertation style and conflict analysis
- `03_INTEGRATION_LEDGER.md` — record of every technical intervention
- `04_BUILD_REPORT.md` — compilation results and validation
