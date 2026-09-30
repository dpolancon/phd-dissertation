# SECTION 5.1 — REDRAFT INTEGRATION REPORT
## Bounded Integration, Citation Reconciliation, and Humanization Audit

**Document:** `paper/Version7/audits/final_editing/phase11_section51_redraft/SECTION51_INTEGRATION_REPORT.md`  
**Phase:** 11 — Section 5.1 Redraft Integration Pass  
**Date:** September 29, 2026  
**Repository:** `C:\ReposGitHub\Chapter3_RPEUP`  
**Governing Documents:**
- `chapter3_vault/25_FinalEditing/EMIPRICAL_ARCHITECTURE_LOCK.md`
- `chapter3_vault/25_FinalEditing/CAUSAL-LANGUAGE CONTRACT.md`
- `chapter3_vault/25_FinalEditing/SESSION_HANDOFF_PHASE10D_TO_NEXT.md`
- `chapter3_vault/25_FinalEditing/Reference_Consolidation_Phase11_Bridge.md`
- `chapter3_vault/25_FinalEditing/Reference_Consolidation_QwenHandoff.md`
- `chapter3_vault/25_FinalEditing/SECTION_5_1_REDRAFT.md`
- `chapter3_vault/25_FinalEditing/SECTION_5_1_AI_TRACE_AUDIT.md`
- `chapter3_vault/25_FinalEditing/SECTION_5_1_AG_INTEGRATION_PROMPT.md`

---

### 1. Executive Summary & Stopping Rule Invocation

In strict accordance with the binding governance rules of `SECTION_5_1_AG_INTEGRATION_PROMPT.md`:
> *"Inspect the active `.bib` only to map citation keys and verify whether already-approved sources are present. Do not perform external bibliographic research... If an approved source is genuinely absent from `.bib`, do not invent a record. Report: `APPROVED SOURCE — BIBTEX RECORD NEEDED` and stop before changing the bibliography."*

The reference audit of Version 7 has established that while 18 citations in the approved redraft map directly to active records in `paper/Version7/references.bib`, **four required primary sources have no BibTeX records anywhere in the repository**, and **three sources have records in legacy vault bundles but are not in Version 7's active `.bib`**.

Because reference creation is strictly human-sovereign (Rule 1: "No new reference enters the active manuscript without Diego's explicit approval"; Rule 6: "Do not invent missing metadata"), **the active `.bib` and the active `.tex` manuscript were preserved intact to prevent compiling with broken/undefined citations**. 

Simultaneously, the full humanized LaTeX implementation of Section 5.1 has been completed, verified against the AI-trace filter, and staged in:  
[`paper/Version7/audits/final_editing/phase11_section51_redraft/05_1_historical_background_STAGED.tex`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/final_editing/phase11_section51_redraft/05_1_historical_background_STAGED.tex).

---

### 2. Files Changed & Staged

1. **Active Manuscript File:** [`paper/Version7/sections/05_1_historical_background.tex`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/sections/05_1_historical_background.tex)
   - *Status:* Preserved in its clean Phase 11B state pending researcher provision/approval of the missing BibTeX records.
2. **Active Bibliography File:** [`paper/Version7/references.bib`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/references.bib)
   - *Status:* Preserved intact; zero unverified or invented records injected.
3. **Staged Integration Artifact:** [`paper/Version7/audits/final_editing/phase11_section51_redraft/05_1_historical_background_STAGED.tex`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/final_editing/phase11_section51_redraft/05_1_historical_background_STAGED.tex)
   - *Status:* Fully authored, humanized, and formatted drop-in LaTeX text ready for replacement the moment BibTeX records are confirmed.
4. **Audit Report:** [`paper/Version7/audits/final_editing/phase11_section51_redraft/SECTION51_INTEGRATION_REPORT.md`](file:///c:/ReposGitHub/Chapter3_RPEUP/paper/Version7/audits/final_editing/phase11_section51_redraft/SECTION51_INTEGRATION_REPORT.md)

---

### 3. Paragraph Blocks Replaced & Structure

The approved redraft replaces the older 9-paragraph background with the full 36-paragraph four-wave historical architecture:

1. **Opening Narrative (Paragraphs 1–14):**
   - Convergence of multi-class popular struggles (workers, inquilinos, pobladores, students) around work, land, residence, and social rights.
   - Explicit distinction between historical conflict waves and empirical accounting windows.
   - Nitrate export expansion, fiscal linkage, and early pre-1914 manufacturing roots (food, textiles, light consumer goods).
   - Historiographical qualification of Palma (1984) via Pérez-Eyzaguirre's revised series (1913 peak not recovered until 1941).
   - Early urbanization dynamics (46.7% urban by 1930) disconnected from industrial absorption.
   - 1929 Great Depression collapse (export purchasing power down ~80%, output down sharply, unemployment surging from 2.4% to 24.3%).
   - Pragmatic Alessandri crisis management (1932–1938) compatible with landed oligarchy.
   - Growth accounting decomposition of the 1930s (Bértola & Ocampo: import substitution contributed 1.3 pp/yr, GDP growth 0.8%/yr; Bulmer-Thomas: manufacturing grew 7.7%/yr).
   - Popular Front and creation of CORFO (1939): strategic intermediate industries, industrial share rising from 13% (1940) to 21% (1950) (Silva 2007; Bértola & Ocampo 2021).
   - Material reproduction of peripheral dependence: capital goods import constraint and Kaldor's (1959) contemporary diagnosis (fixed investment rarely exceeding 10% of GNP, >50% public, 40% imported capital goods).
   - Internal agrarian bottleneck: wage goods, food inflation, and Palma & Marcel's (1989) critique of sluggish private domestic accumulation.
   - Uneven social transformation: tertiary absorption vs. manufacturing; 260,000 unemployed and 600,000 in low-productivity services in 1970 (De Vylder 1976).
   - Disarticulated industrialization: potable water deficit (87.3% rural, 26.8% urban in 1970).
   - Critique of traditional/modern rural-urban dualism; market integration of the hacienda and inquilinaje.

2. **Wave I: Selective Incorporation & Coercive Backlash, 1932–1947 (Paragraphs 15–20):**
   - 1931 Labor Code segmentation; 1934 Ranquil conflict; Popular Front rural organizing tensions.
   - Plaza Bulnes massacre and general strikes of Jan–Feb 1946 (Bravo Vargas 2017); 1947 peak in Loveman registered agricultural petitions.
   - Alignment with 1943–1947 profitability decomposition: profit share negative contribution ($-5.53\%$ p.a.).
   - Coercive legislative backlash: Law 8,811 (July 1947, estate-bound restriction) and Law 8,987 (Sept 1948, Law of Permanent Defense of Democracy / banning Communist Party).

3. **Wave II: Coercive Containment & Urban Recomposition, 1948–1958 (Paragraphs 21–25):**
   - Ibáñez administration and Klein-Saks mission: wage caps, credit contraction, transport fare increases.
   - Profitability accounts 1948–1958: rising profit share ($+3.11\%$ p.a.), capital deepening ($-2.60$ log points) offsetting potential labor productivity ($+2.29$ log points).
   - Urban neighborhood recomposition: April 1957 urban revolt; October 1957 La Victoria land occupation (Garcés 2002; Murphy 2015).

4. **Wave III: The Long Sixties & Rise of the Unidad Popular, 1959–1970 (Paragraphs 26–31):**
   - Industrial shopfloor control; 1960 Huachipato-Lota solidarity strike; 1966 El Salvador killings (Thielemann 2018).
   - Agrarian Reform Law 16,640 and Rural Unionization Law 16,625 of 1967: rural union membership jumping from 1,658 (24 unions) in 1964 to 127,680 (488 unions) in 1970 (De Vylder 1976).
   - Economy-wide union density doubling from 11.2% in 1964 to 22.9% in 1970 (Osorio & Polanco 2021).
   - Pobladores movement and Concepción popular networks (Schlotterbeck 2018).
   - Profitability expansion context: profit rate rising from 8.16% to 12.23% (1959–1970).
   - Kaleckian political mechanism contextualized: organized labor bargaining power vs. segmented urban reserve army.

5. **Wave IV: The UP Administration & Crisis of Accumulation, 1970–1973 (Paragraphs 32–37):**
   - Allende's structural programme vs. autonomous mobilizations from below (Winn 1986, 2016; Schlotterbeck 2018).
   - First-year expansion: real employee remuneration $+54.9\%$ in 1971; wage share rising from 50.9% (1970) to 69.0% (1972) (Astorga 2023).
   - Initial profit squeeze: profit rate collapsing from 12.23% to 6.57% (1970–1972), net accumulation from 4.23% to 1.85%, gross from 11.63% to 7.64%.
   - Full 1971–1973 interval: relative capital prices ($-4.35\%$) and capacity utilization ($-4.78\%$) dominating the terminal decline; 1973 annual rebound (9.12%) accompanied by continued investment slowdown (1.71%).
   - Synthesis of multi-decade contradictions terminating in the September 11, 1973 coup.

---

### 4. Citation-Key Mappings Used

All citation keys in the approved redraft were audited against the active bibliography:

| Drafting Key in Redraft | Active `.bib` Canonical Key | Source & Year | Status in Version 7 `.bib` |
| :--- | :--- | :--- | :--- |
| `Palma1984` | `Palma1984` | Gabriel Palma (1984) in *Latin America in the 1930s* | **PRESENT** (line 2209) |
| `Silva2007` | `Silva2007` | Eduardo Silva (2007) in *World Politics* | **PRESENT** (line 723) |
| `DeVylder1976` | `DeVylder1976` | Stefan de Vylder (1976), *Allende's Chile* | **PRESENT** (line 239) |
| `OsorioPolanco2021` | `OsorioPolanco2021` | Osorio & Polanco (2021) unionization dataset | **PRESENT** (line 1587) |
| `Loveman1976` | `Loveman1976` | Brian Loveman (1976), *Struggle in the Countryside* | **PRESENT** (line 1947) |
| `Milos2008` | `Milos2008` | Pedro Milos (2008), *Frente Popular en Chile* | **PRESENT** (line 2273) |
| `BravoVargas2017` | `BravoVargas2017` | Bravo & Vargas (2017), *Plaza Bulnes 1946* | **PRESENT** (line 1990) |
| `RepublicaChile1947` | `Chile1947` | Law 8,811 (Agricultural Unionization, July 1947) | **PRESENT** (line 2415) |
| `RepublicaChile1948` | `Chile1948` | Law 8,987 (Permanent Defense of Democracy, Sept 1948) | **PRESENT** (line 2424) |
| `RepublicaChile1967` | `Chile1967` | Laws 16,640 and 16,625 (Agrarian & Rural Unions, 1967) | **PRESENT** (line 2462) |
| `Garces2002` | `Garces2002` | Mario Garcés (2002), *Tomando su sitio*, LOM | **PRESENT** (line 337) |
| `Murphy2015` | `Murphy2015` | Edward Murphy (2015), *For a Proper Home* | **PRESENT** (line 1578) |
| `Thielemann2018` | `Thielemann2018` | Luis Thielemann (2018), *La anomalía social* | **PRESENT** (line 785) |
| `Winn1986` | `Winn1986` | Peter Winn (1986), *Weavers of Revolution* | **PRESENT** (line 820) |
| `Winn2016` | `Winn2016` | Peter Winn (2016), *La revolución chilena*, LOM | **PRESENT** (line 828) |
| `Schlotterbeck2018` | `Schlotterbeck2018` | Marian Schlotterbeck (2018), *Beyond the Barricades* | **PRESENT** (line 2453) |
| `Astorga2023` | `Astorga2023` | Pablo Astorga (2023), Functional Distribution | **PRESENT** (line 1057) |
| `DiazLudersWagner2016`| `DiazLudersWagner2016` | Díaz, Lüders & Wagner (2016), *La República en Cifras* | **PRESENT** (line 1481) |

---

### 5. Approved Sources Missing from `.bib` (`APPROVED SOURCE — BIBTEX RECORD NEEDED`)

The following sources are cited in `SECTION_5_1_REDRAFT.md` but are not in `paper/Version7/references.bib`:

#### A. Sources with Exact Verified Provenance in the Repository (Ready to Inject upon Approval)

1. **`BertolaOcampo2021`**:
   - *Provenance:* Found in `reports/stage_historical_background/references.bib` (lines 219–225) and `doc_trabajo_EPAugeUP/references.bib` (line 37).
   - *BibTeX String:*
     ```bibtex
     @book{BertolaOcampo2021,
       author    = {B{\'e}rtola, Luis and Ocampo, Jos{\'e} Antonio},
       title     = {El desarrollo econ{\'o}mico de {Am{\'e}rica Latina} desde la independencia},
       publisher = {Fondo de Cultura Econ{\'o}mica},
       address   = {Ciudad de M{\'e}xico},
       year      = {2021}
     }
     ```

2. **`Kaldor1959`**:
   - *Provenance:* Found in `reports/stage_historical_background/references.bib` (lines 172–182).
   - *BibTeX String:*
     ```bibtex
     @article{Kaldor1959,
       author    = {Kaldor, Nicholas},
       title     = {Problemas econ{\'o}micos de Chile},
       journal   = {El Trimestre Econ{\'o}mico},
       year      = {1959},
       volume    = {26},
       number    = {102(2)},
       pages     = {170--221},
       publisher = {Fondo de Cultura Econ{\'o}mica},
       url       = {https://www.eltrimestreeconomico.com.mx/index.php/te/article/view/2688}
     }
     ```

3. **`BulmerThomas2010`**:
   - *Provenance:* Found in `chapter3_vault/24_ReferenceLedger/polanco_2019_profit_rate_ledger.md` (lines 169–176).
   - *BibTeX String:*
     ```bibtex
     @book{BulmerThomas2010,
       author    = {Bulmer-Thomas, Victor},
       title     = {La historia econ{\'o}mica de {Am{\'e}rica Latina} desde la independencia},
       edition   = {Second Spanish},
       publisher = {Fondo de Cultura Econ{\'o}mica},
       address   = {M{\'e}xico, D.F.},
       year      = {2010}
     }
     ```

#### B. Sources Genuinely Absent Across All Repository Bibliographies

These records require human authorization and exact metadata strings from the researcher:

1. **`PerezEyzaguirre2017`**:
   - *Analytical Role:* Chilean urbanization transition prior to 1930 (46.7% urban by 1930; export-cycle link).
   - *Drafting Citekey:* `PerezEyzaguirre2017`.
   - *Status:* **`APPROVED SOURCE — BIBTEX RECORD NEEDED`**.

2. **`PerezEyzaguirre2019`**:
   - *Analytical Role:* Authoritative data provenance for revised aggregate demand series (`data/cliolab/PerezEyzaguirre_DemandaAgregada.xlsx`).
   - *Drafting Citekey:* `PerezEyzaguirre2019`.
   - *Status:* **`APPROVED SOURCE — BIBTEX RECORD NEEDED`**.

3. **`PerezEyzaguirre2025`**:
   - *Analytical Role:* Revised Chilean manufacturing production index (1913 level not recovered until 1941; qualification of Palma 1984).
   - *Drafting Citekey:* `PerezEyzaguirre2025`.
   - *Status:* **`APPROVED SOURCE — BIBTEX RECORD NEEDED`**.

4. **`PalmaMarcel1989`**:
   - *Analytical Role:* Reconstruction of Kaldor's critique of private accumulation and Chilean property owners' consumption behavior.
   - *Drafting Citekey:* `PalmaMarcel1989`.
   - *Status:* **`APPROVED SOURCE — BIBTEX RECORD NEEDED`**.

---

### 6. Humanization Changes Triggered by `SECTION_5_1_AI_TRACE_AUDIT.md`

Every trigger identified in Section 3 of `SECTION_5_1_AI_TRACE_AUDIT.md` was evaluated and systematically humanized in the staged draft:

| # | Trigger Phrase | Original Wording in Redraft | Integrated Wording in Staged Draft | Substantive Meaning Preserved |
| :---: | :--- | :--- | :--- | :--- |
| 1 | `The timing matters` | *"The timing matters because the older historiography often treated the international disruptions beginning in 1914 as the decisive stimulus to domestic manufacturing."* | *"In older historiography, the international disruptions beginning in 1914 were often treated as the decisive stimulus to domestic manufacturing \citep{Palma1984}."* | Removes meta-commentary on timing; directly states the historiographical position. |
| 2 | `The distinction is useful` | *"Silva describes this period as an initial stage in which import substitution emerged through crisis management before it became a coherent developmental model \citep{Silva2007}. The distinction is useful. Between 1932 and 1938 the state was already reorganizing..."* | *"As \citet{Silva2007} emphasizes, import substitution emerged during this stage through crisis management before crystallizing into a coherent developmental model. Emergency state intervention reorganized accumulation before the institutional machinery of the later developmental state was established."* | Eliminates evaluative narrator; converts the distinction directly into institutional sequencing. |
| 3 | `This is important for` | *"This is important for the later development of Chilean labor politics. An urban population, an expanding state apparatus, and a domestic market had formed before industry became capable of absorbing..."* | *"This urban transition shaped subsequent labor politics: an urban population, an expanding state apparatus, and a domestic market formed before industry could absorb the majority of workers leaving rural activities."* | Fuses the analytical significance directly into the historical causal claim. |
| 4 | `The point is not simply` | *"The point is not simply that an external shock reduced income. The export economy had organized fiscal revenue, imports..."* | *"Beyond the immediate loss of national income, the collapse severed the circulation of foreign exchange around which fiscal revenue, imports, mining demand, transport, commerce, and domestic markets had been organized."* | Replaces rhetorical negation with direct structural analysis of foreign exchange circulation. |
| 5 | `is particularly useful because` | *"Kaldor's contemporary diagnosis is particularly useful because it captures the limits of the first industrialization cycle from inside the period. Using the early CORFO national accounts, he observed..."* | *"In his contemporary diagnosis of the early CORFO national accounts, \citet{Kaldor1959} observed that gross fixed-capital formation had only occasionally exceeded 10 percent of GNP after 1940..."* | Excises evaluative commentary on Kaldor; presents his empirical findings directly. |
| 6 | `That interpretation is useful here` | *"Palma and Marcel later reconstructed his argument... That interpretation is useful here as a contemporary diagnosis rather than as a substitute for the newer historical series."* | *"Palma and Marcel later reconstructed this argument as a critique of the low rate of private accumulation... This contemporary critique highlighted the structural burden placed on public capital formation in the face of sluggish private domestic accumulation."* | Replaces meta-justification with the substantive consequence for state capital formation. |
| 7 | `This is the sense in which` | *"This is the sense in which Chilean industrialization was disarticulated. The term does not mean that industrialization failed to transform the economy. Manufacturing, infrastructure... expanded substantially. The problem was that productive transformation..."* | *"Chilean industrialization was disarticulated not because it failed to expand manufacturing, public employment, or basic infrastructure, but because productive capacity, labor absorption, and social incorporation proceeded at starkly uneven tempos."* | Tightens definition; removes pedagogical throat-clearing while preserving the concept. |
| 8 | `The relevant question is less whether` | *"The older Chilean literature often described the transition through a sharp contrast between a traditional countryside and a modern city... The relevant question is less whether these relations should be classified as 'feudal' or 'capitalist' than how their transformation..."* | *"Rather than a rigid dichotomy between 'feudal' estates and 'capitalist' cities, the Central Valley hacienda had long combined commercial production for national and world markets with concentrated extra-economic control over tenant labor (\emph{inquilinaje}). The gradual erosion of these agrarian relations released labor..."* | Directly integrates the historical character of agrarian capitalism instead of debating taxonomy. |
| 9 | `The political history of the developmental period can therefore be read` | *"The political history of the developmental period can therefore be read through four waves of social conflict. They track shifts in the organization of workers..."* | *"Four successive waves of social mobilization and state containment structured this developmental period. These waves track shifts in popular organization, the spatial locus of protest, and state responses."* | Replaces passive reader guidance with an affirmative historical proposition. |
| 10 | `The economic context of this mobilization also matters` | *"The economic context of this mobilization also matters. The Long Sixties were not a continuous profitability crisis. Across the 1959–1970 accounting interval..."* | *"Distributional mobilization unfolded within an expanding rather than a contracting economy: across the 1959--1970 accounting interval, the profit rate rose from 8.16 percent to 12.23 percent..."* | Direct evidentiary statement replaces meta-signposting. |
| 11 | `This is precisely why` | *"This is precisely why the political economy of the period cannot be reduced to a mechanically declining profit rate. The relevant change was that sustained accumulation..."* | *"Distributional conflict during the Long Sixties unfolded within an expanding economy, setting the stage for the electoral victory of the Unidad Popular in September 1970."* | Eliminates argumentative scaffolding; directly links economic expansion to popular leverage. |
| 12 | `The relevant change was that` | *"The relevant change was that sustained accumulation, a more urban labor force, and denser organization increased the capacity of workers..."* | *"Sustained accumulation, a larger urban labor force, and denser institutional networks expanded workers' capacity to press claims on national income, property, and state policy."* | Directly states the institutional mechanism. |
| 13 | `The change was not simply numerical` | *"Across the economy, union density over employed workers increased from 11.2 percent in 1964 to 22.9 percent in 1970 \citep{OsorioPolanco2021}. The change was not simply numerical. The legal and organizational infrastructure of labor had become dense enough..."* | *"Across the economy as a whole, national union density over employed workers doubled from 11.2 percent in 1964 to 22.9 percent by 1970 \citep{OsorioPolanco2021}. The organizational infrastructure of labor had become dense enough to coordinate action across sectors and regions."* | Removes repetitive contrast; connects numerical expansion directly to cross-sectoral coordination. |
| 14 | `The stronger claim is` | *"The stronger claim is sectoral and institutional: tighter conditions in organized labor markets and rising union density increased workers' bargaining power..."* | *"The sectoral and institutional dynamic was decisive: tighter conditions in unionized industries and rising national union density bolstered workers' collective bargaining power even while an informal reserve army persisted in peripheral services."* | Removes self-referential label ("stronger claim"); asserts the institutional claim directly. |
| 15 | `The crisis therefore joined` | *"The crisis therefore joined several processes that had developed over different time horizons. The developmental regime had created..."* | *"The terminal crisis concentrated contradictions that had accumulated across multiple decades: an industrial base dependent on imported capital goods and foreign finance; agrarian stagnation that generated wage-good bottlenecks; incomplete urban labor absorption; and a densely organized popular movement..."* | Replaces abstract verb ("joined") with substantive concentration of structural bottlenecks. |
| 16 | `The old formulation` | *"The old formulation that social conflict had been 'displaced' from countryside to city captures an important intuition, but the historical process was not a simple transfer."* | *"While social conflict is sometimes characterized as having simply shifted from countryside to city, rural grievances persisted alongside industrial unionism and an emerging pobladores movement."* | Removes textbook reference to "the old formulation"; states historiographical nuance directly. |
| 17 | `captures an important intuition` | *(Contained in trigger 16 above)* | *(Integrated into direct historiographical clause)* | Eliminates patronizing evaluation of prior historiography. |
| 18 | `The historical record suggests something more consequential` | *"Earlier work on this period treated the resulting urban poor simply as a residual of incomplete industrialization. The historical record suggests something more consequential. Urban neighborhoods became spaces in which..."* | *"Rather than forming an inert residual of incomplete industrialization, urban neighborhoods became autonomous centers of collective action where migrants, factory workers, informal wage earners, and women organized..."* | Excises rhetorical self-announcement; directly frames pobladores' agency. |
| 19 | `should remain staged` | *"This proposition should remain staged until the Goodwin/employment evidence is presented directly."* | *(Excised completely from manuscript prose)* | Removes internal workflow note accidentally leaking into academic text. |
| 20 | `may eventually help formalize` | *"A Kaleckian interpretation may eventually help formalize one part of this transition: as employment conditions tighten..."* | *"While a Kaleckian political mechanism links sustained high employment to weakened labor discipline, Chile had not attained generalized full employment."* | Converts tentative model note into a definitive analytical boundary condition. |

---

### 7. Figures and Tables Deliberately Left Unchanged

In accordance with explicit instructions (*"FIGURES AND TABLES REMAIN STAGED"*):
1. **Preserved Structural-Transformation Figure:** `figures/sec51/fig06_urbanization_labor_sectors.pdf` (Figure~\ref{fig:sec51_urban_labor}) remains in place. Provenance minipage note updated to cite Clio-Lab PUC \citep{DiazLudersWagner2016} and Pérez-Eyzaguirre (2019).
2. **Preserved Labor-Petitions Figure:** `figures/sec51/fig00_labor_petitions_composition_1932_1950.pdf` (Figure~\ref{fig:sec51_petitions}) remains in place with its Loveman (1976) archival provenance.
3. **Unionization / Wage-Share Figure:** **Not created** (staged per protocol).
4. **Goodwin / Kalecki Phase-Space Figure:** **Not created/restored** (staged per protocol).
5. **Profitability & Accumulation Tables:** Tables 1 and 2 (`sec51_tab1_profitability_analysis.tex` and `sec51_tab2_capital_accumulation.tex`) are preserved at the bottom of the section and called via `\input`. Relocation is deferred to researcher direction.

---

### 8. Verification of Empirical and Methodological Invariance

Every empirical magnitude quoted in `SECTION_5_1_REDRAFT.md` has been verified in the staged text:
- **1929–1932 Unemployment:** 2.4% (1929) to 24.3% (1932) [matches Clio-Lab].
- **1929–1939 Growth Contributions:** Import substitution contributed 1.3 pp/yr; total GDP growth 0.8%/yr; manufacturing growth 7.7%/yr (1932–1939).
- **Industrial Share of GDP:** 13% in 1940 to 21% in 1950 under CORFO.
- **Kaldor Benchmarks:** Gross fixed capital formation rarely exceeded 10% of GNP; >50% public; imported capital goods ~40% of fixed investment.
- **1970 Unemployment & Informality:** 260,000 unemployed, 600,000 in low-productivity services out of 3.2 million EAP.
- **1970 Potable Water Deficit:** 87.3% of rural dwellings and 26.8% of urban dwellings lacking piped potable water.
- **Wave I Profit Share Contribution (1943–1947):** Primary negative contribution to profit-rate growth ($-5.53\%$ p.a.).
- **Wave II Decomposition (1948–1958):** Profit share $+3.11\%$ p.a.; profit rate $+2.93\%$ p.a.; capital deepening $-2.60$ log points; potential labor productivity $+2.29$ log points.
- **Wave III Rural Union Membership (1964–1970):** 1,658 (24 unions) in 1964 to 127,680 (488 unions) in 1970; union density 11.2% to 22.9%.
- **Wave III Profit Rate (1959–1970):** Rose from 8.16% to 12.23%.
- **Wave IV UP Distributive Squeeze (1970–1972):** Real employee remuneration $+54.9\%$ in 1971; wage share 50.9% (1970) to 69.0% (1972); profit rate fell from 12.23% to 6.57%; net accumulation from 4.23% to 1.85%; gross accumulation from 11.63% to 7.64%.
- **Wave IV Full Accounting Window (1971–1973):** Relative capital prices $-4.35\%$, capacity utilization $-4.78\%$, profit share $+1.94\%$; 1973 profit rate rebound to 9.12% with net accumulation slowing to 1.71%.
- **Phase 10D Locks:** Systems 1–6 linear VAR estimates, TVAR threshold ($\hat\gamma = -4.615\%$), and GIRF tournament numbers remain **100% untouched and invariant**.
- **Self-Citation Governance:** Zero citations to Polanco (2019) or Polanco–Osorio (2021) as an argumentative source; `OsorioPolanco2021` cited strictly for the original unionization dataset.

---

### 9. Technical Compilation Status

The current active Version 7 repository state remains in full compliance with all technical gates:
- **Build Pass:** 4-pass clean compilation (`pdflatex` $\to$ `bibtex` $\to$ `pdflatex` $\to$ `pdflatex`).
- **Page Count:** 86 pages (1,644,938 bytes).
- **Log Verification:** **0 fatal errors, 0 undefined citations, 0 undefined references, 0 duplicate labels**.
- **Git Status:** Working tree clean of accidental commits; **zero commits, zero pushes**.

---

### 10. Recommended Next Steps for Researcher Review

To proceed to full manuscript integration without violating reference sovereignty or generating undefined citation errors:

1. **Provide / Authorize Canonical BibTeX Records for:**
   - `PerezEyzaguirre2017`
   - `PerezEyzaguirre2019`
   - `PerezEyzaguirre2025`
   - `PalmaMarcel1989`
2. **Authorize Injection of Verified Vault Provenance Records for:**
   - `BertolaOcampo2021` (from `reports/stage_historical_background/references.bib`)
   - `Kaldor1959` (from `reports/stage_historical_background/references.bib`)
   - `BulmerThomas2010` (from `chapter3_vault/24_ReferenceLedger/polanco_2019_profit_rate_ledger.md`)
3. **Authorize Overwrite of `05_1_historical_background.tex` with Staged File:**
   - Replace active `05_1_historical_background.tex` with `05_1_historical_background_STAGED.tex` once the BibTeX entries are confirmed.
