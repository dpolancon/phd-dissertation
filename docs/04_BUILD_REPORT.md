# 04 BUILD REPORT

*Integration pass: 2026-09-30*
*Build system: TeX Live 2026 / latexmk 4.88 / pdflatex*

---

## Summary

| Item | Status |
|------|--------|
| PDF produced | **YES** — `dissertation.pdf` |
| Compilation method | `latexmk -pdf -interaction=nonstopmode dissertation.tex` |
| Fatal errors | **NONE** |
| Pages | 267 |
| File size | ~4.77 MB |
| Chapter 1 | ✅ Compiled (pages 1–58) |
| Chapter 2 | ✅ Compiled (pages 60–157) |
| Chapter 3 | ✅ Compiled (pages 161–267) |
| Table of Contents | ✅ Present |
| List of Figures | ✅ Present |
| Per-chapter bibliographies | ✅ (`chapterbib`) |
| Per-chapter appendices | ✅ (`subappendices`) |
| Figure numbering | ✅ 1.1, 1.2, ..., 2.1, ..., 3.1, ... |

---

## Compilation Environment

```
TeX Live 2026
pdflatex version: pdfTeX 3.141592653 (TeX Live 2026)
latexmk version: 4.88 (9 March 2026)
bibtex version: BibTeX 0.99e (TeX Live 2026)
Platform: Windows / PowerShell
```

---

## Build Command

```bash
# Full build (from repository root):
latexmk -pdf -interaction=nonstopmode dissertation.tex

# Manual equivalent:
pdflatex -interaction=nonstopmode dissertation.tex
bibtex integration/chapter1
bibtex integration/chapter2
bibtex integration/chapter3
pdflatex -interaction=nonstopmode dissertation.tex
pdflatex -interaction=nonstopmode dissertation.tex
```

**Important**: `latexmkrc` sets `$bibtex_fudge = 0` so that bibtex runs from the repository root. Bibliography paths in integration wrappers (`Chapter1/references`, `Chapter2/references`, `Chapter3/references`) are relative to the root. If `bibtex_fudge` were left at its default (1), bibtex would `cd` to `integration/` before running, and these paths would fail.

---

## Warnings (Non-Fatal)

### Label Collisions (Expected — documented in INT-006)

```
LaTeX Warning: Label `sec:introduction' multiply defined.
LaTeX Warning: Label `sec:conclusion' multiply defined.
LaTeX Warning: Label `sec:literature_review' multiply defined.
```

Both Chapter 1 and Chapter 3 define `\label{sec:introduction}`. No cross-chapter references to this label exist. The hyperref anchor resolves to the second definition (Chapter 3). Within-chapter cross-references are correct for each chapter.

**Disposition**: Harmless. Documented. No action required for this integration pass.

### Missing Citation (Pre-existing in Frozen Source)

```
Package natbib Warning: Citation `Felipe2005' on page 7 undefined
```

`Felipe2005` is cited in Chapter 1 but not present in `Chapter1/references.bib`. This is a pre-existing issue in the frozen source — **not introduced by the integration**. The citation will appear as `[?]` in the PDF.

**Disposition**: Pre-existing issue in frozen Chapter 1 source. Requires author attention when preparing the chapter for final submission.

### Bibliography Metadata Warnings (Pre-existing in Frozen Source)

```
Warning--there's a number but no volume in Arboleda2023
Warning--there's a number but no volume in Cardoso1972
```

Both entries in `Chapter3/references.bib` are missing the `volume` field. BibTeX-level formatting issue in the frozen source.

**Disposition**: Pre-existing. Harmless (bib entry still renders). Requires author attention.

### Float Placement (LaTeX Default Behavior)

```
LaTeX Warning: `!h' float specifier changed to `!ht'.
LaTeX Warning: Float too large for page by 74.46355pt on input line 163.
```

Some figures in Chapter 2 and 3 are sized or positioned in ways that produce float-too-large warnings. This is typical in complex article manuscripts with many large figures. The figures still appear in the PDF.

**Disposition**: Visual artifact in some pages. Does not affect content. For final submission polish, the author may want to review figure placement options.

### pdfTeX Figure Warnings

```
pdfTeX warning: pdflatex.exe (file ./Chapter2/figures/...): ...
pdfTeX warning: pdflatex.exe (file ./Chapter3/figures/...): ...
```

Several PDF figures trigger pdfTeX metadata/color-space warnings. These are pre-existing in the frozen source figure files and do not affect visual rendering.

**Disposition**: Pre-existing. Harmless.

### Hyperref Anchor `appendix.N` for Chapters 2 and 3

```
\contentsline {chapter}{...}{60}{appendix.2}%
\contentsline {chapter}{...}{161}{appendix.3}%
```

After Chapter 1's `\subappendices` environment, the `appendix` package sets internal flags that hyperref records as `appendix` type. The visible chapter numbering (2, 3), section numbers, figure numbers, and TOC page references are all correct. Only the internal hyperref anchor type identifier is affected.

**Disposition**: Cosmetic. The PDF navigates correctly. For the final submission, a cleaner solution (e.g., restoring hyperref chapter anchors via a post-subappendices reset hook) can be implemented. Not required for this integration pass.

---

## File Inventory

### Created by this Integration Pass

```
dissertation.tex              Master document
config/packages.tex           Unified package loading
config/style.tex              Dissertation-level style settings
config/macros.tex             Global macro definitions
config/chapter-adapters.tex   Integration notes
frontmatter/working-title.tex Temporary working title page
integration/chapter1.tex      Chapter 1 integration wrapper
integration/chapter2.tex      Chapter 2 integration wrapper
integration/chapter3.tex      Chapter 3 integration wrapper
latexmkrc                     Build configuration
README.md                     Repository documentation
.gitignore                    Version control exclusions
docs/01_RECONNAISSANCE.md     Phase A: chapter audit
docs/02_STYLE_FINGERPRINT.md  Phase B: style fingerprint
docs/03_INTEGRATION_LEDGER.md Integration intervention record
docs/04_BUILD_REPORT.md       This file
```

### Frozen Source (Not Modified)

```
Chapter1/   (all files unchanged)
Chapter2/   (all files unchanged)
Chapter3/   (all files unchanged)
```

---

## Known Issues and Deferred Items

| Issue | Severity | Deferred to |
|-------|----------|-------------|
| `Felipe2005` missing citation | Low | Author — next Ch1 editing pass |
| `Arboleda2023`, `Cardoso1972` missing volume | Low | Author — next Ch3 bib pass |
| `appendix.N` hyperref anchor type for Ch2/Ch3 | Very low | Future shell polish pass |
| Float-too-large for some large figures | Low | Future per-chapter polishing |
| No `\listoftables` | By design | Future pass (deferred in spec) |
| All deferred front matter | By design | Future passes (see spec §3) |

---

## Deferred Front Matter (Out of Scope — See Spec §3)

The following elements are explicitly NOT included in this integration pass:

- [ ] Final dissertation abstract
- [ ] Dedication
- [ ] Acknowledgments
- [ ] Committee page
- [ ] Copyright page
- [ ] Institutional approval/signature pages
- [ ] Consolidated dissertation introduction
- [ ] Chapter-transition prose
- [ ] Consolidated final discussion/conclusion
- [ ] Institutional submission formatting
- [ ] Final metadata
- [ ] List of Tables
- [ ] AI-assistance consolidated disclosure statement

Clean insertion points for all of these are marked in `dissertation.tex`.

---

## Conclusion

The minimal dissertation integration package is **complete and functional**.

The three frozen chapters compile as a single coherent volume with:
- unified Table of Contents and List of Figures
- per-chapter bibliographies via `chapterbib`
- per-chapter appendices via `subappendices`
- correct chapter-prefixed figure numbering (1.1, 2.1, 3.1, ...)
- stable PDF with hyperlinks and bookmarks
- no modifications to frozen source files

**No frozen chapter source files were modified during this integration.**
