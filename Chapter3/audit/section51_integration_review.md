# Section 5.1 — integration and bounded source review

Integrated 20 September 2026 following Diego's instruction to proceed toward submission. This is a working integrated draft, not a declaration that all historical sources or the rest of the chapter are submission-ready.

## Current files and preservation

- Main prose: `sections/05_1_historical_background.tex`, included by `sections/05_historical_empirical_results.tex`.
- Build: `_build_sec51_integration/Chapter3_Paper.pdf`. The prior root PDF was not overwritten.
- Pre-integration snapshots: `reports/stage_historical_background/_backups/20260920_044151_main_integration/` relative to repository root. Includes master source, Section 5, bibliography, both original stage tables, and the historical appendix before its small legislative correction.
- Stage manuscript and stage table originals remain unchanged. Main copies of the tables retain every numerical cell; headers, descriptive period labels, spacing, and the accumulation note were corrected. The non-included appendix cross-reference was removed from the main copy rather than pointing at a nonexistent exhibit.
- Both accounting exhibits remain with 5.1 for now. Their later relocation to 5.2 is optional, not a source-verification blocker. The additional labor-force/phase-space/macro charts remain in stage; this integration uses the structural and petitions figures only.
- The figure protocol led to reuse of the existing PDF assets without redrawing or altering observations. Their provenance checks remain below.
- `econ-write` guided compression and removal of repeated methodological disclaimers; the UMass skill guided the distinction between institutional mechanisms and accounting, and between profit-rate levels, log changes, and accumulation rates.
- The manuscript/build directory and stage workspace are locally ignored, as required by the LaTeX skill. Nothing was committed or published.

## Deferred checks, mapped to source comments

An external reader should work on one ID at a time, returning a source passage and locator, a verdict, and the smallest proposed edit. Do not rewrite the whole section or change numerical tables. Repository ledgers are finding aids, not evidence. Accepted Loveman archival provenance does not need to be rediscovered.

| ID | Target / source needed | Exact question and current treatment |
|---|---|---|
| 01 | Opening; Pinto1958, Palma1984, Silva2007 | Check passages for pre-1929 manufacturing and interwar transition. Credit institutions, precise nitrate inflection, and foreign-debt detail remain omitted pending locators. |
| 02 | Core/periphery; DeVylder1976, Vidal2019, intended Cardoso/Amin works | Verify the short retained characterization and indirect attribution before expanding it. No new Cardoso/Amin attribution was invented. |
| 03 | Structural figure and Clio-Lab workbook | Identify observed versus constructed annual values and confirm dates. Distinguish population from labor-force denominators. Relative absorption retained; no Lewis verdict. |
| 04 | Popular Front; Milos2008 | Locate coalition-formation passage. Do not use this book to support all later labor policy. |
| 05 | Petitions figure | Harmonize “Urban & Industrial” with underlying non-agricultural classification. Loveman provenance accepted; no claim that petitions exhaust conflict. |
| 06 | Wave II; RodriguezWeberThielemann2022 | Read article directly and assess whether it adds to the already-read Thielemann2023 pp. 45–53. World-first monetarism claim excluded. |
| 07 | Accounts and choice of technique | Confirm Chapter 2 definitions. Keep aggregate capital deepening distinct from induced technical change and workplace rationalization. |
| 08 | Pobladores; Garces2002, Murphy2015 | Add exact passages for housing/property/citizenship. Identify any intended alternative Murphy edition; verified 2015 English work retained. |
| 09 | Political articulation; DeVylder1976, Schlotterbeck2018 | Highest substantive priority: Frei promises/disaffection, party mediation, and a dated pre-1970 agrarian link. The unverified III4a paragraph is NOT printed; bounded Concepción relationships are retained. |
| 10 | Regional frame; Harmer2011 | Add a precise Cuba/inter-American connection after 1959. Italy/PCI and containment-motive extension remain omitted, not asserted behind a comment. |
| 11 | Astorga2023 | Highest bibliographic priority: exact work, year, dataset version, and series definitions. Existing placeholder persists elsewhere in the chapter; must be settled before final submission. Do not substitute Rodríguez Weber as the direct data source. |
| 12 | Arboleda2023, Winn2016 | Replace/rename the misfiled local Arboleda PDF only after identifying the correct file. Journal article was consulted. Add Winn passage locator; do not label the digital edition “second edition” without evidence. |
| 13 | Chapter 2 accounts | Reconcile gross versus net propensity definitions. Annual 1973 cannot identify within-year coup effects; positive net accumulation means capital still grew. No new estimation was performed. |
| 14 | Historical appendix | Verify inherited event annotations, “all-time”/national-dispute wording, and exact source-to-series links. Corrected the 1947/1948 law conflation and section reference only; numerical observations preserved. |

## Request template for a separate source reader

> Read the supplied paper/book for SEC51-VERIFY-[ID]. Compare the identified paragraph in `sections/05_1_historical_background.tex` with actual source passages. Return: bibliographic identity; printed page and PDF page; a short supporting passage or faithful paraphrase; verdict (supported / needs qualification / contradicted / not located); and a minimal proposed sentence. Distinguish the source author's interpretation from observed evidence. Do not infer verification from a ledger or another AI's summary. Do not edit the main manuscript or tables.

## Compilation follow-up outside 5.1

Validation completed: full chapter compiled successfully (62 pages); 21 distinct citation keys in the new 5.1 module all exist in the master bibliography, with no unresolved citations reported. The section occupies printed pp. 21–27 (PDF pp. 22–28). Rendered prose, figure, and table pages were inspected for layout. Numerical table-cell comparisons pass for both main copies, and file hashes confirm both stage originals are unchanged. A sub-point table-header overfull warning remains visually harmless; no numerical data were adjusted to address layout.

The full chapter build exposes pre-existing unresolved labels: `sec:empirical_results`, `sec:granger`, `app:codebook`, and `sec:money_endogeneity_paradox`, plus a title-footnote destination warning. They are not Section 5.1 citation failures. Arboleda's issue-only journal metadata prompts an apalike “number but no volume” warning; do not invent a volume to silence it. The chapter also retains unfinished material outside this task, including its abstract and empirical subsections.
