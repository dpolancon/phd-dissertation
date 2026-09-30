# SECTION 5.1 — ACTIVE INTEGRATION REPORT
## Formal Integration of the Four-Wave Historical Architecture and Binding References

**Document:** `paper/Version7/audits/final_editing/phase11_section51_redraft/SECTION51_ACTIVE_INTEGRATION_REPORT.md`  
**Phase:** 11 — Section 5.1 Active Integration  
**Date:** September 29, 2026  
**Repository:** `C:\ReposGitHub\Chapter3_RPEUP`  
**Master Manuscript:** `paper/Version7/Chapter3_Paper.tex`  
**Compiled Output:** `paper/Version7/Chapter3_Paper.pdf` (88 pages, 1,653,574 bytes)  
**Git Status:** Preserved in working tree; **zero commits, zero pushes**.

---

### Mandatory Governance Declaration

```
REFERENCE DISCOVERY: NOT PERFORMED. ALL NEW SECTION 5.1 SOURCE MAPPINGS WERE TAKEN FROM SECTION_5_1_REFERENCE_INJECTION_BINDING.md.
```

---

### 1. Files Modified

1. **`paper/Version7/sections/05_1_historical_background.tex`**
   - Active section replaced with the approved, humanized four-wave historical narrative architecture.
2. **`paper/Version7/references.bib`**
   - Appended the 6 authorized reference records from `SECTION_5_1_REFERENCE_INJECTION_BINDING.md`.

---

### 2. Binding Bibliography Records Inserted

The following 7 exact BibTeX records were injected into `paper/Version7/references.bib` (6 from initial binding packet plus 1 researcher-confirmed English edition for Bértola & Ocampo):

```bibtex
@inproceedings{PerezEyzaguirre2017,
  author       = {P{\'e}rez Eyzaguirre, Juan Ignacio},
  title        = {El despertar del Chile urbano: urbanizaci{\'o}n temprana y formaci{\'o}n del sistema de ciudades, 1850--1930},
  booktitle    = {XIV Jornadas Argentinas de Estudios de Poblaci{\'o}n},
  organization = {Asociaci{\'o}n de Estudios de Poblaci{\'o}n de la Argentina},
  address      = {Santa Fe},
  year         = {2017}
}

@phdthesis{PerezEyzaguirre2019,
  author = {P{\'e}rez Eyzaguirre, Juan Ignacio},
  title  = {Urbanizaci{\'o}n, crecimiento y cambio estructural en una econom{\'i}a exportadora: el caso de Chile, 1860--1940},
  school = {Universidad de Chile},
  year   = {2019}
}

@article{PerezEyzaguirre2025,
  author  = {P{\'e}rez Eyzaguirre, Juan Ignacio},
  title   = {Producci{\'o}n industrial en Chile durante la primera globalizaci{\'o}n (1860--1924): una reevaluaci{\'o}n},
  journal = {Revista de Historia Industrial--Industrial History Review},
  year    = {2025},
  volume  = {34},
  number  = {93},
  pages   = {11--38},
  doi     = {10.1344/rhiihr.43576}
}

@article{PalmaMarcel1989,
  author  = {Palma, J. Gabriel and Marcel, Mario},
  title   = {Kaldor on the ``discreet charm'' of the Chilean bourgeoisie},
  journal = {Cambridge Journal of Economics},
  year    = {1989},
  volume  = {13},
  number  = {1},
  pages   = {245--272}
}

@article{Kaldor1959,
  author  = {Kaldor, Nicholas},
  title   = {Problemas econ{\'o}micos de Chile},
  journal = {El Trimestre Econ{\'o}mico},
  year    = {1959},
  volume  = {26},
  number  = {102(2)},
  pages   = {170--221}
}

@book{BulmerThomas2003,
  author    = {Bulmer-Thomas, Victor},
  title     = {The Economic History of Latin America since Independence},
  edition   = {2},
  publisher = {Cambridge University Press},
  address   = {Cambridge},
  year      = {2003}
}

@book{BertolaOcampo2012,
  author    = {B{\'e}rtola, Luis and Ocampo, Jos{\'e} Antonio},
  title     = {The Economic Development of {Latin America} since Independence},
  publisher = {Oxford University Press},
  address   = {Oxford},
  year      = {2012}
}
```

---

### 3. Citation-Key Remappings Performed

All citations in Section 5.1 were remapped according to the binding reference packet:

| Drafting Key in Staged Text | Canonical Key Applied | Instances Remapped | Context & Permitted Role |
| :--- | :--- | :---: | :--- |
| `BulmerThomas2010` | `BulmerThomas2003` | 4 | Remapped to 2003 2nd English edition (¶2 light industry, ¶5 Depression output, ¶7 1930s manufacturing growth, ¶8 WWII expansion). |
| `BertolaOcampo2021` | `BertolaOcampo2012` | 3 | Remapped to 2012 English edition confirmed by researcher (Oxford University Press) (¶5 purchasing power, ¶7 sources of growth, ¶8 postwar industrial share). |
| `RepublicaChile1947` | `Chile1947` | 1 | Agricultural unionization statute (Law 8,811). |
| `RepublicaChile1948` | `Chile1948` | 1 | Law of Permanent Defense of Democracy (Law 8,987). |
| `RepublicaChile1967` | `Chile1967` | 1 | Agrarian reform & rural unionization statutes (Laws 16,640 and 16,625). |

---

### 4. BibTeX Collisions

- **Collisions Detected:** **0 (Zero)**.
- All injected keys were verified absent from `paper/Version7/references.bib` prior to insertion.
- `Kaldor1959` does not collide with `Kaldor1982` (*The Scourge of Monetarism*), which remains untouched for downstream monetarist critiques.

---

### 5. Binding References Still Unresolved

- **Unresolved References:** **0 (Zero)**.
- **Resolution:** The single pending reference `BertolaOcampo_PENDING` was resolved via explicit researcher instruction confirming the physical English edition: Luis Bértola and José Antonio Ocampo, *The Economic Development of Latin America since Independence*, Oxford University Press, 2012. Key `BertolaOcampo2012` was injected into `references.bib`, activated in `05_1_historical_background.tex`, and resolved cleanly.

---

### 6. Figure 1 Provenance Correction

In compliance with Section 3 of the launcher:
- **`figures/sec51/fig06_urbanization_labor_sectors.pdf` (Figure~\ref{fig:sec51_urban_labor}):**  
  The source minipage note was corrected to remove the staged attribution to *Pérez-Eyzaguirre (2019)*, reflecting strictly the data series plotted on canvas:
  ```latex
  \textit{Source:} Author's elaboration from Clio-Lab PUC historical statistics \citep{DiazLudersWagner2016}. Sectoral series refer to the labor force; urbanization refers to population. These measures have different denominators. Census urbanization observations are plotted as points.
  ```
- **Labor Petitions Figure (Figure~\ref{fig:sec51_petitions}):** Preserved in place with its archival Loveman (1976) provenance.

---

### 7. Deviations from Staged Section 5.1 & Exact Justification

All edits relative to `05_1_historical_background_STAGED.tex` were strictly mechanical:
1. `BulmerThomas2010` $\to$ `BulmerThomas2003` (enforcing Section 6 of `SECTION_5_1_REFERENCE_INJECTION_BINDING.md`).
2. `BertolaOcampo2021` $\to$ `BertolaOcampo2012` (resolved to researcher-confirmed 2012 English edition, Oxford University Press).
3. Removed `and P\'erez-Eyzaguirre (2019)` from Figure 1 caption (enforcing Section 3 of `SECTION_5_1_ACTIVE_INTEGRATION_LAUNCHER.md`).
4. **Prose & Empirical Content:** Zero substantive deviations. All 20 humanization adjustments from `SECTION_5_1_AI_TRACE_AUDIT.md` and all 36 paragraphs of the four-wave architecture are active.

---

### 8. Build Results

- **Compiler Sequence:** Clean 4-pass compilation (`pdflatex` $\to$ `bibtex` $\to$ `pdflatex` $\to$ `pdflatex`).
- **LaTeX Engine:** pdfTeX 3.141592653-2.6-1.40.29 / BibTeX 0.99e (TeX Live 2026 / Windows).
- **Fatal Errors:** **0**.
- **Undefined Cross-References:** **0**.
- **Multiply Defined Labels:** **0**.
- **Undefined Citations:** **0 (Zero)**. All 131 bibliographic entries and citation keys across Section 5.1 and the full manuscript resolved cleanly.

---

### 9. Resulting PDF Page Count

- **Total Manuscript Pages:** **88 pages** (1,653,574 bytes).
- The document expanded cleanly from 86 to 88 pages, accommodating the comprehensive four-wave historical background without disrupting downstream floats, tables, or appendices.

---

### 10. Confirmation of Active Section 5.1 in PDF

The compiled artifact [`paper/Version7/Chapter3_Paper.pdf`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/Chapter3_Paper.pdf) contains the fully activated Section 5.1 across pages 21–25:
- **Opening:** Multi-class convergence of workers, inquilinos, pobladores, students, and middle classes; pre-1914 light manufacturing; qualification of Palma (1984) via Pérez-Eyzaguirre (2025); early urbanization (46.7% by 1930) via Pérez-Eyzaguirre (2017); 1929 Great Depression collapse; Alessandri crisis management; 1930s growth accounting; Popular Front & CORFO; peripheral capital-goods constraint and Kaldor's (1959) diagnosis; agrarian bottleneck and Palma & Marcel's (1989) critique; tertiary labor absorption and De Vylder's (1976) data; potable water deficit; critique of dualism.
- **Wave I (1932–1947):** Labor Code, Ranquil, Plaza Bulnes 1946, 1947 petition peak, 1943–1947 profit share squeeze ($-5.53\%$), Laws 8,811 and 8,987.
- **Wave II (1948–1958):** Klein-Saks mission, profit share recovery ($+3.11\%$), April 1957 revolt, October 1957 La Victoria occupation (Garcés 2002; Murphy 2015).
- **Wave III (1959–1970):** Shopfloor control, 1966 El Salvador killings, 1967 rural union laws, union density doubling (11.2% to 22.9%), pobladores and Concepción networks, 1959–1970 profit rate rise (8.16% to 12.23%), Kaleckian political mechanism.
- **Wave IV (1970–1973):** Allende structural programme vs. autonomous mobilization, 1971 wage expansion (+54.9% remuneration, wage share 69.0%), profit rate collapse (12.23% to 6.57%), full terminal window relative prices/utilization, 1973 annual rebound (9.12%) with investment slowdown (1.71%), September 11, 1973 coup.
- **Tables 1 & 2:** Both profitability decomposition tables remain cleanly called at the base of Section 5.1.
