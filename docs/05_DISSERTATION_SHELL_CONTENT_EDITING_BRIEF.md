# 05 — DISSERTATION SHELL CONTENT EDITING BRIEF

**Project:** `dpolancon/phd-dissertation`  
**Pass:** Dissertation-level intellectual integration  
**Status:** DESIGN / EDITING BRIEF FOR AG  
**Primary target:** `frontmatter/introduction.tex`  
**Secondary targets:** dissertation-level material outside the three frozen essays  
**Date:** 2026-09-30

---

## 0. Purpose of this pass

This pass edits the dissertation **around** the three essays. It does not reopen the substantive editing of Chapters 1–3.

The goal is to make the assembled manuscript read as a coherent dissertation while preserving the essays as distinct pieces of research. Coherence should come from an explicit dissertation-level problem, a clear map of fields of inquiry, calibrated contributions, consistent terminology, and a transparent explanation of how the three essays relate to one another.

The dissertation should **not** pretend that the three essays are three tests of one identical model. Their relationship is cumulative but not linear:

> **measurement and identification → structural mechanism and comparative extension → historical-institutional crisis analysis**

A broader formulation of the dissertation-level problem is preferable to making the transformation elasticity \(\theta\) the organizing object of all three essays:

> **The dissertation investigates capitalist reproduction when the relation between accumulation, productive capacity, and macroeconomic stability cannot be assumed to be proportional, self-equilibrating, or insulated from distribution, institutions, and external constraints.**

Chapter 1 identifies the measurement/long-run-relation problem. Chapter 2 develops and estimates the structural transformation from accumulation into productive capacity. Chapter 3 asks how external and monetary constraints operate historically during a peripheral structural transformation and crisis.

---

## 1. Hard locks

### Frozen substantive sources

Do **not** edit prose, equations, empirical results, citations, tables, figures, or claims inside:

- `Chapter1/`
- `Chapter2/`
- `Chapter3/`

These are the authoritative essay versions.

### Citation lock

- Do not introduce new references into the dissertation-level Introduction without prior author approval.
- Work first from the references already present in the essays and current Introduction.
- Any proposed new literature must be listed separately as a proposal; do not silently add it.
- Preserve the existing self-citation rule.

### Scope lock

This pass may edit or propose edits to:

- `frontmatter/introduction.tex`
- `frontmatter/working-title.tex` only where dissertation-level wording is implicated
- future dissertation abstract
- future consolidated conclusion/discussion
- dissertation-level transitions or prefatory material outside the essays
- `dissertation.tex` only to add/include dissertation-level components
- documentation in `docs/`

Integration wrappers should remain technical unless a very short dissertation-level bridge is later authorized.

### Explicit exclusion

**Do not perform AI de-tracing / humanization as a separate stylistic pass yet.**

This pass fixes intellectual architecture, claim calibration, terminology, contribution logic, and missing content. Sentence-level de-tracing comes after the content architecture is locked.

---

## 2. Core diagnosis of the current Introduction

The current Introduction is substantive and already contains a credible common problem. Its weakness is **over-integration**, not absence of integration.

### 2.1 It makes \(\theta\) do too much

The Introduction currently treats the three essays as successive stages of one transformation-elasticity inquiry. This is accurate for Chapters 1 and 2 but only partially describes Chapter 3.

Chapter 3 does not estimate the capacity transformation elasticity. Its central questions concern:

- competing interpretations of the Unidad Popular;
- dependency theory as a research programme;
- the international currency hierarchy and world money;
- financial subordination and the balance-of-payments constraint;
- central-bank foreign-exchange solvency;
- endogenous monetary accommodation;
- historical agency and contingency;
- the evidentiary limits of macro time-series causal claims.

The dissertation-level bridge should therefore broaden after Chapter 2. Chapter 3 is not simply “the external constraint at a higher frequency.” It is a historically specific inquiry into **macroeconomic reproduction and crisis under peripheral monetary and external constraints**.

### 2.2 The fields of inquiry are implicit rather than stated

The current opening names several traditions, but it does not tell the reader clearly **which research conversations the dissertation enters** or what it contributes to each.

A dissertation-level Introduction should locate the project across at least four connected fields:

1. **Capacity utilization, accumulation, and heterodox macroeconomics**  
   Post-Keynesian/Kaleckian, Sraffian, and classical-Marxian debates over normal utilization, output-capital relations, profitability, and unbalanced growth.

2. **Technical change, choice of technique, and the political economy of the firm**  
   The conversion of investment into productive capacity, decentralized accumulation, mechanization, distributive conflict, capital composition, and the internally divided firm.

3. **Structuralist/dependency and center–periphery political economy**  
   Import dependence, balance-of-payments constraints, external finance, uneven development, and the different conditions under which accumulation can be transformed into productive capacity.

4. **Historical political economy and international monetary political economy of the Unidad Popular**  
   Competing research programmes, historical contingency and agency, international currency hierarchy, central-bank balance sheets, solvency, and monetary accommodation.

**History of economic thought / methodology of competing research programmes** is a transversal field, particularly important to Chapters 1 and 3.

These should not become a long literature review. A compact “Fields of Inquiry and Research Questions” section is enough.

### 2.3 The contribution section is too estimator-driven

The current “Measurement and Methodological Contribution” is essentially a catalogue of GPIM, ARDL grids, VECM, IM-OLS, threshold regressions, TVARs, and GIRFs.

Those methods matter, but at dissertation level they are **means of identification**, not the primary intellectual contribution.

Reorganize contributions around the questions and literatures the dissertation changes. The technical contribution should be shorter and subordinate to the substantive contributions.

### 2.4 Chapter summaries are too close to extended abstracts

The present essay summaries report many exact coefficients, thresholds, horizons, and estimators. This causes three problems:

- the dissertation Introduction duplicates the abstracts;
- the intellectual contribution of each chapter becomes harder to see;
- the Introduction is forced to make stronger cross-chapter claims than the essays themselves require.

Each chapter summary should answer four things, in this order:

1. What question does the chapter ask?
2. Which field/debate does it enter?
3. What evidence/design does it use?
4. What does it establish, and what does it leave open?

Numerical results should appear only where one number is necessary to communicate the substantive result.

### 2.5 Several dissertation-level formulations exceed the evidentiary language of the chapters

Chapter 3 explicitly states that its time-series evidence establishes directional precedence and state-dependent conditional responses, not experimental counterfactual identification. It describes its findings as consistent with balance-sheet constraints and endogenous accommodation and as opening, rather than settling, the empirical inquiry.

The Introduction must inherit that calibration.

---

## 3. Proposed architecture for `frontmatter/introduction.tex`

The target is not necessarily a longer Introduction. It is a better allocated one.

### Section A — The dissertation problem

Retain the strong opening puzzle: productive capacity is unobserved and capacity utilization depends on how its denominator is constructed.

Then broaden the problem:

- measuring capacity is one problem;
- explaining how accumulation becomes capacity is a second;
- explaining how that reproduction is constrained historically in a peripheral economy is a third.

Avoid presenting all three immediately as one \(\theta\) problem.

### Section B — Fields of Inquiry and Research Questions **[NEW]**

Add a compact section after the opening problem.

Suggested function:

- locate the dissertation in its fields;
- state three dissertation-level research questions;
- explain why the United States and Chile are analytically related rather than merely two country cases.

Suggested research questions:

**RQ1 — Measurement / identification**  
How can productive capacity be identified empirically if it is unobserved and the long-run output-capital relation is historically and distributionally conditioned?

**RQ2 — Accumulation / structural mechanism**  
What determines the rate at which capital accumulation is transformed into productive capacity, and how do distribution, choice of technique, capital composition, and external constraints alter that transformation?

**RQ3 — Peripheral crisis / historical political economy**  
How do external finance, central-bank foreign-exchange solvency, distributive conflict, and institutional agency shape macroeconomic transmission during a peripheral structural transformation such as Chile’s Unidad Popular?

Do not force RQ3 into the transformation-elasticity notation.

### Section C — The sequence of the dissertation argument

Replace the present three-step “same inquiry at different frequencies” logic with:

1. **Chapter 1: measurement and identification**  
   Tests whether the output-capital relation can sustain an autonomous capacity benchmark.

2. **Chapter 2: mechanism and comparative extension**  
   Theorizes and estimates the transformation from accumulation into capacity, then asks how the mechanism changes between center and periphery.

3. **Chapter 3: historical-institutional determination of crisis**  
   Moves from long-run capacity formation to the operation of external and monetary constraints during a concrete peripheral crisis, with a distinct historical and epistemological research question.

Use connective language such as:

- “raises the question examined in…”
- “extends the problem to…”
- “introduces an additional constraint…”
- “examines the historically specific operation of…”
- “provides a different evidentiary perspective on…”

Avoid:

- “proves”
- “confirms”
- “validates”
- “at the highest frequency the same mechanism…”
- any wording that implies Chapter 3 is simply a time-scale version of Chapter 2.

### Section D — Contributions by field

Replace the current four generic contribution headings with contributions tied to fields.

#### D1. Capacity measurement and heterodox macroeconomics

Core claim:
- the dissertation treats the productive-capacity denominator as something requiring identification;
- Chapter 1 shows the standalone output-capital relation is not a stable autonomous benchmark over the full sample;
- the long-run relation survives only when distribution and historical structure enter the system.

Do not imply that a particular estimator is itself the contribution.

#### D2. Accumulation, technical change, and capacity formation

Core claim:
- Chapter 2 turns the non-unitary output-capital relation into an explicit structural question;
- it makes the transformation elasticity estimable rather than normalized;
- it links distribution, choice of technique, firm organization, capital composition, and capacity formation.

#### D3. Center–periphery political economy

Core claim:
- the dissertation shows that the conditions governing productive transformation differ according to location in the international division of labor;
- the Chilean extension introduces import dependence, foreign exchange, and a binding external constraint into the choice-of-technique problem;
- center/periphery is an analytical relation, not just a two-country comparison.

#### D4. Historical political economy of the Unidad Popular and international money

Core claim:
- Chapter 3 reopens a contested historical episode using dependency theory as a research programme and an open-economy central-bank balance-sheet framework;
- it distinguishes global monetary change, targeted bilateral financial pressure, domestic distributive conflict, and BCCh agency;
- its empirical evidence is consistent with state-dependent endogenous accommodation under adverse solvency conditions and challenges monocausal accounts that treat money creation as an autonomous explanation of inflation.

Use “challenges,” “qualifies,” “provides evidence inconsistent with,” or “provides evidence consistent with,” rather than “refutes,” unless the chapter itself establishes the stronger claim.

#### D5. Measurement/data/methods **[short supporting contribution]**

Keep this to one compact paragraph.

Possible content:
- reconstruction of long historical capital stocks and archival monthly monetary/external series;
- staged specification testing and system cointegration;
- state-dependent long-run estimation;
- threshold VAR evidence.

Do not turn this into a software/estimator inventory.

---

## 4. Chapter-level contribution map for the rewrite

### Chapter 1 — Critical Replication of Shaikh’s Capacity Utilization Measure

**Fields:** capacity measurement; heterodox macroeconomics; classical-Marxian/Sraffian distribution; applied time-series econometrics; critical replication.

**Question:** Can the long-run output-capital relation serve as an autonomous empirical benchmark for productive capacity?

**Design:** reconstruct Shaikh; open the specification space; test the relation at system level.

**Substantive result:** the full-sample bivariate output-capital relation does not sustain the required long-run system properties; the relation survives when the rate of exploitation and historical breaks enter the system; retained specifications imply \(\theta<1\).

**Contribution wording:**  
The chapter establishes that capacity measurement cannot treat the output-capital coefficient as an insulated technical constant. It identifies distributional conditioning as part of the long-run relation and leaves the mechanism generating that conditioning to Chapter 2.

**Do not overstate:**  
The chapter does not by itself provide the full structural mechanism later developed in Chapter 2.

### Chapter 2 — The Transformation of Accumulation into Productive Capacities

**Fields:** accumulation and growth; classical choice of technique; political economy of the firm; technical change; comparative political economy; structuralism/dependency; balance-of-payments constraints.

**Question:** What determines how much productive capacity is generated by a unit of accumulated capital, and how does that relation differ between center and periphery?

**Design:** theoretical model plus long-run comparative estimation for the United States and Chile.

**Substantive result:** transformation is non-unitary and distributionally conditioned; heterogeneous capital composition matters; in Chile, the mechanization response is sharply attenuated when the external constraint binds.

**Contribution wording:**  
The chapter provides the dissertation’s principal structural mechanism linking accumulation to productive capacity and shows why the mechanism cannot be assumed to operate identically in center and periphery.

**Scope limit that should be visible at dissertation level:**  
Chapter 2 explicitly does not claim to supply a complete crisis theory or exhaustive dependency framework. The Introduction should preserve this boundary.

### Chapter 3 — Re-visiting the Political Economy of the Rise and Fall of the Unidad Popular

**Fields:** history of economic thought; dependency theory; historical political economy/economic history of Chile; international monetary political economy; central banking; endogenous money; balance-of-payments and financial subordination.

**Question:** What was the causal/directional ordering among monetary creation, inflation, external constraint, and central-bank accommodation during the Unidad Popular, and how did external solvency condition that transmission?

**Design:** research-programme comparison, historical reconstruction, annual and monthly evidence, directional-precedence tests, and state-dependent threshold dynamics.

**Substantive result:** the evidence supports state-dependent transmission and shows reverse monetary accommodation to be more persistent/larger than forward transmission in the adverse solvency-growth state.

**Contribution wording:**  
The chapter places the Chilean crisis in an open-economy balance-sheet framework, distinguishes structural constraint from historical agency, and supplies evidence consistent with endogenous monetary accommodation under external stress.

**Do not overstate:**  
The chapter explicitly rejects the claim that its macro time-series evidence constitutes experimental counterfactual identification. The dissertation Introduction must not convert these findings into definitive causal proof or into a claim that the central bank was mechanically “compelled” to take one action.

---

## 5. Claim-calibration ledger for the current Introduction

| Current formulation / tendency | Problem | Preferred dissertation-level formulation |
|---|---|---|
| “capacity utilization as something an economy produces” | Conflates the denominator with the ratio | Productive **capacity is formed**; capacity utilization measures realized output relative to that capacity. If retaining the Chapter 2 phrase, explain that utilization is a derived residual of the capacity-formation process. |
| “intensity of exploitation within the labor process and the institutional distribution of income between wages, profits, and intangible capital” | Mixes a distribution variable with capital composition; intangibles are not a distributive share | Distinguish **functional distribution / wage pressure**, **labor-process conflict**, and **capital composition / intangible assets**. |
| Chapter 3 as “the highest frequency” of the same transformation relation | Over-integrates Ch3 and makes it a frequency extension | Present Ch3 as a shift from long-run capacity formation to historically specific crisis transmission and peripheral monetary reproduction. |
| “foreign-exchange reserves run out” | Too binary and cruder than Ch2’s estimated external-constraint index | “when external financing and reserve availability become binding” or “when the balance-of-payments constraint binds.” |
| “the international currency hierarchy compels the monetary authority to monetize enterprise deficits” | Erases the agency/contingency distinction that Ch3 carefully restores | External conditions **constrain the BCCh’s policy space**; historically, the BCCh chose accommodation rather than immediate deflationary adjustment. |
| “resolving acute balance-of-payments shocks through endogenous accommodation” | “Resolving” implies successful closure | “responding to” or “accommodating domestic liquidity needs under” external stress. |
| “refutes monocausal monetarist narratives” | Stronger than Ch3’s own evidentiary caveat | “challenges monocausal monetarist accounts” / “provides evidence inconsistent with accounts that treat money creation as an autonomous driver.” |
| “breakdown occurred only after mid-1972, when Nixon’s closure of the gold window…” | Risks conflating global Bretton Woods breakdown with the Chile-specific crisis | Separate: (a) breakdown of Bretton Woods/global inflationary environment; (b) copper/terms-of-trade movements; (c) targeted bilateral credit restrictions; (d) domestic political conflict and BCCh response. |
| “intangible asset accumulation reconstituted US corporate profitability after Fordism” | Profitability is not the direct dissertation-wide empirical target in Ch2 | Prefer: “documents the changing composition of US capital, effective wage pressure, and the transformation elasticity in the post-Fordist period.” |
| “robust, calibrated parameters” | Sweeps very different designs and evidentiary strength into one certification | State results chapter by chapter and preserve estimator-specific uncertainty/limits. |
| “causal ordering” without qualification | Ch3 itself distinguishes directional precedence/conditional response from experimental causality | Use “directional precedence,” “dynamic transmission,” and “state-dependent conditional responses” where appropriate. |

---

## 6. Jargon and terminology harmonization contract

This is a content-coherence pass, not a de-tracing pass. The objective is to make identical terms mean identical things across the dissertation shell.

### Productive capacity vs. capacity utilization

- **Productive capacity \(Y^p\):** the latent denominator / potential productive output associated with the capital stock under the chapter’s framework.
- **Capacity utilization \(\mu=Y/Y^p\):** realized output relative to productive capacity.
- Do not use “capacity utilization” when the sentence actually describes **capacity formation**.

### Transformation elasticity \(\theta\)

- Central organizing quantity in Chapters 1 and 2.
- Define once in the dissertation Introduction.
- Do not make \(\theta\) the organizing variable of Chapter 3.
- Chapter 3 inherits the broader questions of reproduction, external constraint, and crisis, not the same estimating equation.

### Distribution / exploitation / labor process

Keep distinct:

- **functional distribution / wage share / profit share:** macro distributive variables;
- **rate of exploitation:** the specific Chapter 1 variable and classical-Marxian relation;
- **labor-process conflict:** organizational/institutional mechanism, not synonymous with the measured exploitation rate.

### Center / periphery terminology

Preferred dissertation terms:

- **center**
- **periphery**
- **center–periphery relation**
- **peripheral economy / peripheral capitalism**

Avoid switching without purpose among “advanced capitalist core,” “Global South,” “dependent periphery,” and “core.” Use other terms only where the relevant chapter’s theoretical language requires them.

### External constraint / financial subordination / solvency

Do not use as synonyms.

- **balance-of-payments / external constraint:** limitation arising from foreign-exchange/import-financing conditions.
- **financial subordination:** broader relation within the international financial/currency hierarchy.
- **central-bank solvency:** Chapter 3 balance-sheet condition linking foreign reserve assets and domestic monetary liabilities.

### State dependence

Use “state-dependent” where an estimated regime/threshold structure actually exists. Do not use it as a generic synonym for “historically variable.”

### Structural overaccumulation

Use with the dissertation’s specific meaning: \(\theta<1\), accumulation outpacing capacity formation. Do not silently expand it into a complete theory of crisis.

### Causality

Especially for Chapter 3:

- “directional precedence”
- “conditional response”
- “dynamic transmission”
- “evidence consistent with”

should generally precede unqualified claims of causal identification.

---

## 7. Research-design section: what to keep and what to remove

Rename/recast “Methodological Plurality and the Sequence of the Argument” as something closer to:

> **Research Design, Evidence, and Levels of Analysis**

Its role is epistemic, not technical.

Explain that the dissertation combines:

- critical replication and system testing;
- long-run structural/comparative estimation;
- historical reconstruction and archival evidence;
- high-frequency dynamic time-series analysis.

Then explain **why different evidence is appropriate to different questions**.

Do not list every estimator unless needed. The reader should understand the evidentiary division of labor:

- Ch1 asks whether a measurement relation survives.
- Ch2 asks what structural relation can generate and estimate the transformation.
- Ch3 asks how historically specific monetary/external mechanisms operate and what the evidence can and cannot identify.

Add one sentence making explicit that methodological plurality does **not** mean that evidence from one chapter “validates” another chapter’s model.

---

## 8. Missing dissertation-level contents

### High priority substantive content

1. **Fields of Inquiry and Research Questions** — missing from current Introduction.
2. **Explicit statement of the analytical relationship between the US and Chile** — not just two case studies; center/periphery is a relational comparative strategy.
3. **Dissertation-level scope and evidentiary limits** — especially to prevent Ch3’s macro time-series findings from being overstated in the shell.
4. **Consolidated dissertation conclusion/discussion** after Essay 3 — currently still a placeholder in `dissertation.tex`.
5. **General dissertation abstract** — should be written only after the revised Introduction and conclusion are stable.

### Front matter still pending in the repository

- final title page / removal of “[Working Title]”;
- dissertation abstract;
- dedication if desired;
- acknowledgments;
- committee/copyright/institutional approval pages;
- List of Tables;
- final submission-compliance pages/metadata.

These are separate from the substantive Introduction rewrite but should remain visible in the project plan.

### Optional coherence device

After the Introduction is rewritten, assess whether two very short dissertation-level bridge paragraphs are useful:

- before Essay 2: from identification to mechanism;
- before Essay 3: from long-run capacity formation/external constraint to historical crisis and monetary reproduction.

Do not add these unless the Introduction alone leaves a genuine transition problem.

---

## 9. Proposed final Introduction outline

A workable target structure:

1. **The Problem of Productive Capacity and Capitalist Reproduction**
2. **Fields of Inquiry and Research Questions** **[NEW]**
3. **From Measurement to Mechanism to Historical Crisis**
4. **Contributions of the Dissertation**
   - capacity measurement and heterodox macroeconomics
   - accumulation, choice of technique, and capacity formation
   - center–periphery and the external constraint
   - historical political economy, dependency, and international money
   - supporting data/method contribution
5. **Research Design, Evidence, and Levels of Analysis**
6. **The Three Essays**
   - Essay 1: question → design → finding → contribution/limit
   - Essay 2: question → design → finding → contribution/limit
   - Essay 3: question → design → finding → contribution/limit
7. **Structure of the Dissertation**

The current separate “Dissertation-Level Implications” section should either:

- be absorbed into the contributions and final synthesis paragraphs; or
- be substantially softened and moved toward the eventual consolidated Conclusion.

At present it states several results with more generality than the chapter-level evidence warrants.

---

## 10. Content-level edits to the current opening

### Preserve

- productive capacity as an unobserved denominator;
- the critique of treating the capacity benchmark as given;
- the distinction between realized output and productive capacity;
- the balanced/unbalanced growth problem;
- the idea that accumulation does not automatically translate one-for-one into capacity.

### Rework

The opening currently moves too quickly from measurement to a fully unified theory of decentralized accumulation, the internally divided firm, dependency, and central-bank solvency.

The first two pages should instead establish a hierarchy:

**Problem 1:** capacity cannot be directly observed.  
**Problem 2:** therefore its relation to accumulated capital has to be identified rather than normalized.  
**Problem 3:** once this relation is opened theoretically, distribution, technique, institutions, and external constraints can affect capacity formation.  
**Problem 4:** in a peripheral crisis, the external constraint also conditions monetary reproduction and policy space, which requires a historically specific analysis beyond the \(\theta\) model.

That sequence preserves the common thread without forcing all chapters into one equation.

---

## 11. Dissertation title: content check, not a required change

Current working title:

> **Accumulation, Capacity, and Crisis: Essays on Productive Transformation in Center and Periphery**

It broadly fits Chapters 1–3, but the phrase “productive transformation” describes Chapters 1–2 more directly than Chapter 3.

Do not change the title in this pass unless the author requests it. During final-title review, compare the current subtitle with a broader formulation centered on **capitalist reproduction**, **political economy**, or **center and periphery**, because those terms better encompass the monetary-historical content of Chapter 3.

---

## 12. AG implementation protocol

### Phase 1 — Diagnostic edit map

Before rewriting prose:

1. Read `frontmatter/introduction.tex`.
2. Read the abstract, introduction, and conclusion/discussion of each frozen essay.
3. Produce an internal mapping:
   - dissertation claim;
   - chapter source;
   - evidentiary status;
   - KEEP / CALIBRATE / MOVE / DELETE / ADD.
4. Confirm no proposed dissertation-level claim exceeds the strongest version supported in the corresponding essay.

### Phase 2 — Architecture rewrite

Rewrite the Introduction according to Section 9 of this brief.

Priority order:

1. fields and research questions;
2. unifying sequence;
3. contribution architecture;
4. chapter summaries;
5. research design/evidentiary scope;
6. implications/structure.

Do not optimize sentence-level style yet beyond what is necessary for conceptual clarity.

### Phase 3 — Coherence audit

Run a cross-chapter terminology audit using Section 6.

Required checks:

- capacity vs. utilization;
- \(\theta\) restricted to Chapters 1–2 as principal organizing variable;
- center/periphery terminology;
- external constraint vs. financial subordination vs. central-bank solvency;
- distribution vs. rate of exploitation vs. labor-process conflict;
- causal language in Chapter 3 summary.

### Phase 4 — Build and review

Compile the dissertation and review the revised Introduction as a reader encountering all three essays for the first time.

Do not modify frozen chapter prose to solve a dissertation-shell problem.

---

## 13. Acceptance criteria

This pass is complete only if all of the following are true:

- [ ] A reader can name the dissertation’s common research problem after the first 2–3 pages.
- [ ] The Introduction explicitly identifies the fields of inquiry.
- [ ] The Introduction states the dissertation-level research questions.
- [ ] Chapter 1 is represented as measurement/identification, not as a complete theory of capacity formation.
- [ ] Chapter 2 is represented as the main structural mechanism/comparative extension.
- [ ] Chapter 3 is represented as a distinct historical-political-economy and monetary inquiry, not merely a higher-frequency Chapter 2.
- [ ] The contribution section is organized primarily by intellectual contribution, not by estimator.
- [ ] Claims about Chapter 3 match its own evidentiary caveats.
- [ ] Global Bretton Woods change, Chile-specific external financial pressure, and BCCh agency are analytically distinguished.
- [ ] No new references have been silently introduced.
- [ ] No frozen chapter source has been modified.
- [ ] No AI de-tracing pass has been performed yet.
- [ ] The revised Introduction creates a clear handoff to a future consolidated dissertation conclusion.

---

## 14. One-sentence editorial test

Every paragraph added to the dissertation shell should pass this question:

> **Does this sentence help the reader understand why these three essays belong in one dissertation without claiming that they ask the same question or establish the same kind of evidence?**

If not, remove it, move it to the eventual conclusion, or return it to the chapter whose claim it actually belongs to.
