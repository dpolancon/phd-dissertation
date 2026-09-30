# PHASE 11B — REFERENCE MODIFICATION DIFF
## Synchronization of Human-Approved Bibliographic Objects

**Document:** `paper/Version7/audits/final_editing/phase11b_bounded_edits/PHASE11B_REFERENCE_DIFF.md`  
**Phase:** 11B (Bounded Final Reference Edits)  
**Date:** September 29, 2026  
**Audited Target:** `paper/Version7/references.bib`  
**Authorization Authority:**  
- `chapter3_vault/25_FinalEditing/Reference_Consolidation_Phase11_Bridge.md`
- `chapter3_vault/25_FinalEditing/Reference_Consolidation_QwenHandoff.md`
- `paper/Version7/audits/final_editing/phase11a_chapter_consistency/PHASE11A_MASTER_REPAIR_LEDGER.md`
- `paper/Version7/audits/final_editing/phase11a_chapter_consistency/PHASE11A_PRE11B_RECONCILIATION.md`

---

### 1. Governance Verification

1. **Zero New Unapproved References:** Every modified or added record originates strictly from the human-verified ledger in `Reference_Consolidation_QwenHandoff.md`.
2. **Zero Inventions of Metadata:** All journal volumes, issue numbers, page numbers, and publishers are exact primary-source records approved by the author.
3. **Preservation of Distinct 2026 Objects:** The distinction between `GonzalezPrem2026Nat` (*Journal of Economic History*) and `GonzalezPrem2026Trans` (Working Paper) is strictly preserved.
4. **Preservation of Legacy Removal Queue:** Uncited records (`Prashad2023`, `Quijano1974`, `Rozenas2021`, `RosensteinRodan1973`, `Sossdorf2024Trade`) were **not deleted**, in accordance with the explicit scope override.
5. **Preservation of Methods Queue:** Unresolved secondary methodological citations (`DoladoLutkepohl1996`, `AmiriVentelou2012`, `MacKinnon1996`, `Hansen1997`) were left untouched.

---

### 2. Itemized BibTeX Diffs

#### Diff 1: `Sossdorf2024` (REP-17)
- **Authorization:** Phase 11 Bridge Item 9; Qwen Handoff line 148.
- **Before (`references.bib:48`):**
```bibtex
@article{Sossdorf2024,
	title={La relaci{\'o}n a largo plazo entre la productividad y los salarios reales: evidencia para Am{\'e}rica Latina en el per{\'\i}odo 1975-2018},
	author={Sossdorf Gonzalez, Fernando},
	journal={Estudios internacionales (Santiago)},
	volume={56},
	number={208},
	pages={77--110},
	year={2024},
	publisher={SciELO Chile}
}
```
- **After (`references.bib:48`):**
```bibtex
@article{Sossdorf2024,
  author  = {Sossdorf, Fernando},
  title   = {The rise and stagnation of {Chile}'s export cycle},
  journal = {Latin American Journal of Trade Policy},
  year    = {2024},
  volume  = {7},
  number  = {18},
  pages   = {4}
}
```

#### Diff 2: `AldunateGonzalezPrem2024` (REP-14)
- **Authorization:** Phase 11 Bridge Item 19; Qwen Handoff line 246.
- **Before (`references.bib:68`):**
```bibtex
@article{AldunateGonzalezPrem2022,
	author    = {Aldunate, Felipe and Gonz{\'a}lez, Felipe and Prem, Mounu},
	title     = {The effects of {U.S.} banking covert action during {Allende's} {Chile}},
	journal   = {Journal of Financial Economics},
	year      = {2022},
	note      = {GAP FLAG: confirm journal, volume, pages}
}
```
- **After (`references.bib:68`):**
```bibtex
@article{AldunateGonzalezPrem2024,
  author  = {Aldunate, Felipe and Gonz{\'a}lez, Felipe and Prem, Mounu},
  title   = {The limits of hegemony: {U.S.} banks and {Chilean} firms in the {Cold War}},
  journal = {Journal of Development Economics},
  year    = {2024},
  volume  = {166},
  pages   = {103212}
}
```

#### Diff 3: `CardenasSeabra2022` (REP-18)
- **Authorization:** Phase 11 Bridge Item 20; Qwen Handoff line 254.
- **Before (`references.bib:168`):**
```bibtex
@book{CardenasLanaSeabra2022,
	author    = {C{\'a}rdenas, Enrique and Lana, Ligia and Seabra, Raphael},
	title     = {El {CESO} y la dependencia: or{\'\i}genes, debates y legado},
	publisher = {CLACSO},
	year      = {2022},
	note      = {GAP FLAG: confirm publisher and editors}
}
```
- **After (`references.bib:168`):**
```bibtex
@book{CardenasSeabra2022,
  author    = {C{\'a}rdenas Castro, J. Crist{\'o}bal and Seabra, R. Lana},
  title     = {El giro dependentista latinoamericano: los or{\'i}genes de la teor{\'i}a marxista de la dependencia},
  year      = {2022},
  publisher = {Ariadna Ediciones}
}
```

#### Diff 4: `CharnyshFinkelGehlbach2023` (REP-21)
- **Authorization:** Phase 11 Bridge Item 24; Qwen Handoff line 287.
- **Before (`references.bib:196`):**
```bibtex
@incollection{CharnyshFinkelGehlbach2023,
	author    = {Charnysh, Volha and Finkel, Evgeny and Gehlbach, Scott},
	title     = {Historical political economy: core concepts and new directions},
	booktitle = {The {Oxford} Handbook of Historical Political Economy},
	editor    = {Jenkins, Jeffery A. and Rubin, Jared},
	publisher = {Oxford University Press},
	year      = {2023},
	note      = {GAP FLAG: confirm if this is a standalone chapter or part of handbook introduction; verify year 2023 vs 2024}
}
```
- **After (`references.bib:196`):**
```bibtex
@incollection{CharnyshFinkelGehlbach2023,
  author    = {Charnysh, Volha and Finkel, Evgeny and Gehlbach, Scott},
  title     = {Historical political economy: core concepts and new directions},
  booktitle = {The Oxford Handbook of Historical Political Economy},
  editor    = {Jenkins, Jeffrey A. and Rubin, Jared},
  year      = {2023},
  publisher = {Oxford University Press},
  pages     = {1--24}
}
```

#### Diff 5: `Espinosa2021` (REP-21)
- **Authorization:** Phase 11 Bridge Item 1; Qwen Handoff line 75.
- **Before (`references.bib:285`):**
```bibtex
@book{Espinosa2021,
	author    = {Espinosa, Axel},
	title     = {The economic impossibility of socialism: an {Austrian} analysis of {Allende}'s {Chile}},
	publisher = {Routledge},
	year      = {2021},
	note      = {GAP FLAG: confirm publisher}
}
```
- **After (`references.bib:285`):**
```bibtex
@article{Espinosa2021,
  author  = {Espinosa, V. I.},
  title   = {Salvador {Allende}'s development policy: Lessons after 50 years},
  journal = {Economic Affairs},
  year    = {2021},
  volume  = {41},
  number  = {1},
  pages   = {96--110}
}
```

#### Diff 6: `Gailmard2021` (REP-13a, REP-21)
- **Authorization:** Phase 11 Bridge Item 16; Qwen Handoff line 214.
- **Before (`references.bib:327`):**
```bibtex
@article{Gailmard2021,
	author    = {Gailmard, Sean},
	title     = {Theory, history, and political economy},
	journal   = {Journal of Historical Political Economy},
	volume    = {1},
	number    = {1},
	pages     = {1--22},
	year      = {2021},
	note      = {GAP FLAG: confirm volume, pages}
}
```
- **After (`references.bib:327`):**
```bibtex
@article{Gailmard2021,
  author  = {Gailmard, Sean},
  title   = {Theory, history, and political economy},
  journal = {Journal of Historical Political Economy},
  year    = {2021},
  volume  = {1},
  number  = {1},
  pages   = {69--104}
}
```

#### Diff 7: `GonzalezPrem2026Nat` and `GonzalezPrem2026Trans` (REP-15)
- **Authorization:** Phase 11 Bridge Items 5 & 6; Qwen Handoff lines 113, 121, 337.
- **Before (`references.bib:354`):**
```bibtex
@unpublished{GonzalezPrem2026,
	author    = {Gonz{\'a}lez, Felipe and Prem, Mounu},
	title     = {[Title to be confirmed]},
	year      = {2026},
	note      = {GAP FLAG: title, venue, and year unconfirmed --- researcher must verify before submission}
}
```
- **After (`references.bib:354`):**
```bibtex
@article{GonzalezPrem2026Nat,
  author  = {Gonz{\'a}lez, Felipe and Prem, Mounu},
  title   = {When the State Takes Over: Nationalization and Firm Performance},
  journal = {Journal of Economic History},
  year    = {2026},
  note    = {Revision requested}
}

@unpublished{GonzalezPrem2026Trans,
  author  = {Gonz{\'a}lez, Felipe and Prem, Mounu},
  title   = {Transfers and Political Support in Times of Economic Crisis},
  year    = {2026},
  note    = {Working Paper, February 2026}
}
```

#### Diff 8: `ZavaletaMercado1974` (REP-19)
- **Authorization:** Phase 11 Bridge Item 11; Qwen Handoff line 167.
- **Before (`references.bib:842`):**
```bibtex
@article{Zavaleta1974,
	author  = {Zavaleta Mercado, Ren{\'e}},
	title   = {El poder dual en {Am{\'e}rica Latina}: estudio de los casos de {Bolivia} y {Chile}},
	journal = {Cuadernos Pol{\'\i}ticos},
	year    = {1974}
}
```
- **After (`references.bib:842`):**
```bibtex
@book{ZavaletaMercado1974,
  author    = {Zavaleta Mercado, Ren{\'e}},
  title     = {El poder dual en {Am{\'e}rica Latina}},
  year      = {1974},
  publisher = {Siglo XXI},
  address   = {M{\'e}xico}
}
```

#### Diff 9: `GonzalezVial2021` (REP-21)
- **Authorization:** Phase 11 Bridge Item 26; Qwen Handoff line 306.
- **Before (`references.bib:1036`):**
```bibtex
@misc{GonzalezVial2021,
	author = {Gonz{\'a}lez, Felipe and Vial, Joaqu{\'\i}n},
	title  = {[Title to verify]},
	year   = {2021},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1036`):**
```bibtex
@article{GonzalezVial2021,
  author  = {Gonz{\'a}lez, Felipe and Vial, Felipe},
  title   = {Collective action and policy implementation: Evidence from {Salvador Allende}'s expropriations},
  journal = {Journal of Economic History},
  year    = {2021},
  volume  = {81},
  number  = {2},
  pages   = {405--440}
}
```

#### Diff 10: `RamosSergio1979` (REP-16)
- **Authorization:** Phase 11 Bridge Item 17; Qwen Handoff line 224.
- **Before (`references.bib:1043`):**
```bibtex
@misc{Ramos1979,
	author = {Ramos, Sergio},
	title  = {[Title to verify]},
	year   = {1979},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1043`):**
```bibtex
@incollection{RamosSergio1979,
  author    = {Ramos, Sergio},
  title     = {Inflation in {Chile} and the Political Economy of the {Unidad Popular} Government},
  booktitle = {Chile 1970-73: Economic Development and Its International Setting},
  editor    = {Sideri, Sandro},
  year      = {1979},
  publisher = {Martinus Nijhoff},
  address   = {The Hague},
  pages     = {313--362}
}
```

#### Diff 11: `AhumadaChang2025` (REP-21)
- **Authorization:** Phase 11 Bridge Item 7; Qwen Handoff line 128.
- **Before (`references.bib:1060`):**
```bibtex
@misc{AhumadaChang2025,
	author = {Ahumada, Jos{\'e} Miguel and Chang, Ha-Joon},
	title  = {[Title to verify]},
	year   = {2025},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1060`):**
```bibtex
@article{AhumadaChang2025,
  author  = {Ahumada, Jos{\'e} Miguel and Chang, Ha-Joon},
  title   = {A new international economic order for the twenty-first century: an agenda for industrial and trade policies from the {Global South}},
  journal = {Review of Keynesian Economics},
  year    = {2025},
  volume  = {13},
  number  = {4},
  pages   = {562--580}
}
```

#### Diff 12: `BautistaEtAl2023` (REP-20)
- **Authorization:** Phase 11 Bridge Item 27; Qwen Handoff line 316.
- **Before (`references.bib:1094`):**
```bibtex
@misc{BautistaGonzalezMartinezMunozPrem2023,
	author = {Bautista, Mauricio and Gonz{\'a}lez, Felipe and Mart{\'\i}nez, Mat{\'\i}as and Mu{\~n}oz, Pablo and Prem, Mounu},
	title  = {[Title to verify]},
	year   = {2023},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1094`):**
```bibtex
@article{BautistaEtAl2023,
  author  = {Bautista, Mar{\'i}a Ang{\'e}lica and Gonz{\'a}lez, Felipe and Mart{\'i}nez, Luis and Mu{\~n}oz, Pablo and Prem, Mounu},
  title   = {The geography of repression and opposition to autocracy},
  journal = {American Journal of Political Science},
  year    = {2023},
  volume  = {67},
  number  = {1},
  pages   = {101--118}
}
```

#### Diff 13: `GonzalezPremUrzua2020` (REP-21)
- **Authorization:** Phase 11 Bridge Item 25; Qwen Handoff line 297.
- **Before (`references.bib:1101`):**
```bibtex
@misc{GonzalezPremUrzua2020,
	author = {Gonz{\'a}lez, Felipe and Prem, Mounu and Urz{\'u}a, Francisco},
	title  = {[Title to verify]},
	year   = {2020},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1101`):**
```bibtex
@article{GonzalezPremUrzua2020,
  author  = {Gonz{\'a}lez, Felipe and Prem, Mounu and Urz{\'u}a, Francisco},
  title   = {The privatization origins of political corporations: Evidence from the {Pinochet} regime},
  journal = {Explorations in Economic History},
  year    = {2020},
  volume  = {78},
  pages   = {101355}
}
```

#### Diff 14: `RamosJoseph1980` (REP-16)
- **Authorization:** Phase 11 Bridge Item 18; Qwen Handoff line 236.
- **Before (`references.bib:1129`):**
```bibtex
@misc{Ramos1980,
	author = {Ramos, Joseph},
	title  = {[Title to verify]},
	year   = {1980},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1129`):**
```bibtex
@article{RamosJoseph1980,
  author  = {Ramos, Joseph R.},
  title   = {The economics of hyperstagflation: Stabilization policy in post 1973 {Chile}},
  journal = {Journal of Development Economics},
  year    = {1980},
  volume  = {7},
  number  = {4},
  pages   = {467--488}
}
```

#### Diff 15: `Gonzalez2013` (REP-21)
- **Authorization:** Phase 11 Bridge Item 4; Qwen Handoff line 103.
- **Before (`references.bib:1143`):**
```bibtex
@misc{Gonzalez2013,
	author = {Gonz{\'a}lez, Felipe},
	title  = {[Title to verify]},
	year   = {2013},
	note   = {Compatibility placeholder for consolidated dissertation build; verify bibliographic details before submission}
}
```
- **After (`references.bib:1143`):**
```bibtex
@article{Gonzalez2013,
  author  = {Gonz{\'a}lez, Felipe},
  title   = {Can Land Reform Avoid a Left Turn? Evidence from {Chile} after the {Cuban} Revolution},
  journal = {The B.E. Journal of Economic Analysis \& Policy},
  year    = {2013},
  volume  = {13},
  number  = {1},
  pages   = {31--72}
}
```
