"""
apply_working_paper_revisions.py
================================
Applies the diagnostic revisions to workingpapers/chapter3:
1. Adds Polanco (2026) PhD dissertation citation to references.bib.
2. Rewrites all Chapter 2 cross-references to Polanco (2026) citations.
3. Rewrites all internal "this chapter" self-references to "this paper" / "this study".
4. Ensures clean compilation.
"""

from pathlib import Path
import re

WP_DIR = Path("workingpapers/chapter3")

POLANCO_BIB = r"""
@phdthesis{Polanco2026,
  author  = {Polanco, Diego},
  title   = {Essays in the Political Economy of Growth, Distribution, and Crisis in the Center and Periphery},
  school  = {Department of Economics, University of Massachusetts Amherst},
  year    = {2026},
  type    = {Ph.D. Dissertation}
}
"""

def update_references_bib():
    bib_path = WP_DIR / "references.bib"
    with open(bib_path, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    if "Polanco2026" not in content:
        content = POLANCO_BIB.strip() + "\n\n" + content
        with open(bib_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("[+] Added Polanco2026 to references.bib")

def replace_in_file(file_path, replacements):
    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    
    modified = content
    for pattern, repl in replacements:
        modified = re.sub(pattern, repl, modified)
        
    if modified != content:
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(modified)
        print(f"[+] Modified {file_path.relative_to(WP_DIR)}")

def apply_all_revisions():
    update_references_bib()
    
    # 1. sections/01_introduction.tex
    intro_repl = [
        (r"This chapter investigates the causal ordering", r"This paper investigates the causal ordering"),
        (r"This chapter deepens the theoretical foundations established in Chapter~2\.\s*Whereas Chapter~2 identified the external boundary of accumulation through an annual balance-of-payments threshold that throttles mechanization under unbalanced growth, this chapter uncovers",
         r"This paper deepens the theoretical foundations of peripheral accumulation and external vulnerability examined in \\citet{Polanco2026}. Whereas \\citet{Polanco2026} identified the external boundary of accumulation through an annual balance-of-payments threshold that throttles mechanization under unbalanced growth, this paper uncovers"),
        (r"dataset developed in Chapter~2\.", r"dataset developed in \\citet{Polanco2026}."),
        (r"The remainder of this chapter is structured as follows\.", r"The remainder of this paper is structured as follows\.")
    ]
    replace_in_file(WP_DIR / "sections/01_introduction.tex", intro_repl)
    
    # 2. sections/02_literature_review.tex
    lit_repl = [
        (r"the chapter as a whole seeks to resolve", r"this paper seeks to resolve"),
        (r"This chapter seeks to bridge this methodological void", r"This paper seeks to bridge this methodological void"),
        (r"empirical architecture of this dissertation:\s*the long-run historical accounts of inequality compiled there",
         r"empirical architecture of \\citet{Polanco2026}: the long-run historical accounts of inequality compiled there"),
        (r"developed in this chapter\.", r"developed in this paper."),
        (r"In this chapter, I treat Monetarism", r"In this paper, I treat Monetarism")
    ]
    replace_in_file(WP_DIR / "sections/02_literature_review.tex", lit_repl)
    
    # 3. sections/03_macro_framework.tex
    macro_repl = [
        (r"central theoretical sequence of the chapter:", r"central theoretical sequence of this paper:"),
        (r"empirical regimes identified in this chapter", r"empirical regimes identified in this paper")
    ]
    replace_in_file(WP_DIR / "sections/03_macro_framework.tex", macro_repl)
    
    # 4. sections/04_data_architecture.tex
    data_repl = [
        (r"from the GPIM dataset of Chapter~2;", r"from the GPIM dataset of \\citet{Polanco2026};")
    ]
    replace_in_file(WP_DIR / "sections/04_data_architecture.tex", data_repl)
    
    # 5. sections/05_1_historical_background.tex
    hbg_repl = [
        (r"series used in this chapter,", r"series used in this paper,"),
        (r"in the chapter's decomposition", r"in the paper's decomposition")
    ]
    replace_in_file(WP_DIR / "sections/05_1_historical_background.tex", hbg_repl)
    
    # 6. sections/05_2_stylized_facts.tex
    sf_repl = [
        (r"serves in this chapter as a proxy", r"serves in this paper as a proxy")
    ]
    replace_in_file(WP_DIR / "sections/05_2_stylized_facts.tex", sf_repl)
    
    # 7. sections/05_4_threshold_var.tex
    tvar_repl = [
        (r"central objective of this chapter", r"central objective of this paper"),
        (r"central theoretical dispute of this chapter\.", r"central theoretical dispute of this paper.")
    ]
    replace_in_file(WP_DIR / "sections/05_4_threshold_var.tex", tvar_repl)
    
    # 8. sections/05_historical_empirical_results.tex
    results_repl = [
        (r"chapter's causal-language contract", r"paper's causal-language contract"),
        (r"Under the chapter's admissibility criteria", r"Under the paper's admissibility criteria"),
        (r"satisfied the chapter's residual-admissibility criteria", r"satisfied the paper's residual-admissibility criteria"),
        (r"In accordance with the chapter's methodological discipline", r"In accordance with the paper's methodological discipline")
    ]
    replace_in_file(WP_DIR / "sections/05_historical_empirical_results.tex", results_repl)
    
    # 9. sections/06_discussion_conclusion.tex
    disc_repl = [
        (r"This chapter advances this tradition", r"This paper advances this tradition"),
        (r"deployed in this chapter---", r"deployed in this paper---"),
        (r"this chapter demonstrates the progressive capacity", r"this paper demonstrates the progressive capacity")
    ]
    replace_in_file(WP_DIR / "sections/06_discussion_conclusion.tex", disc_repl)
    
    # 10. appendix files
    replace_in_file(WP_DIR / "appendix/appendix_archival_codebook.tex", [
        (r"compiled for this chapter\.", r"compiled for this paper."),
        (r"and my Chapter~2 Cointegrating Multivariate Polynomial Regression \(CMPR IM-OLS\) capacity utilization and harmonized capital stock frameworks",
         r"and Polanco's \\citeyearpar{Polanco2026} Cointegrating Multivariate Polynomial Regression (CMPR IM-OLS) capacity utilization and harmonized capital stock frameworks")
    ])
    
    replace_in_file(WP_DIR / "appendix/appendix_bop_levr.tex", [
        (r"utilized in the chapter's empirical ledger", r"utilized in the paper's empirical ledger")
    ])
    
    replace_in_file(WP_DIR / "appendix/appendix_causal_pcmci_ee1.tex", [
        (r"The present chapter takes a different route", r"The present paper takes a different route"),
        (r"the chapter does not claim universal sufficiency", r"the paper does not claim universal sufficiency")
    ])
    
    replace_in_file(WP_DIR / "appendix/appendix_linear_var_diagnostics.tex", [
        (r"discipline of this chapter", r"discipline of this paper")
    ])
    
    # 11. table notes and sources
    replace_in_file(WP_DIR / "tables/sec51_tab1_profitability_analysis.tex", [
        (r"Source: Author's own elaboration \(Chapter 2\)\.", r"Source: Author's elaboration based on \\citet{Polanco2026}.")
    ])
    
    replace_in_file(WP_DIR / "tables/sec51_tab2_capital_accumulation.tex", [
        (r"Source: Author's own elaboration \(Chapter 2\)\.", r"Source: Author's elaboration based on \\citet{Polanco2026}.")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00_annual_austrian_falsification.tex", [
        (r"dataset of Chapter~2\.", r"dataset of \\citet{Polanco2026}."),
        (r"framework of Chapter~2\.", r"framework of \\citet{Polanco2026}.")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00_annual_data_audit.tex", [
        (r"Chapter 2 Model \(\\texttt\{Capacity-Utilization\}\)", r"\\citet{Polanco2026} Model (\\texttt{Capacity-Utilization})"),
        (r"Chapter 2 Harmonized K-Stock Dataset", r"\\citet{Polanco2026} Harmonized K-Stock Dataset"),
        (r"Chapter 2 Error-Correction Panel", r"\\citet{Polanco2026} Error-Correction Panel"),
        (r"integrate my Chapter~2 structural capacity utilization estimations", r"integrate the structural capacity utilization estimations from \\citet{Polanco2026}"),
        (r"Chapter~2 harmonized capital stock series", r"and the harmonized capital stock series")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00_profit_capacity_1968_1975.tex", [
        (r"framework of Chapter~2", r"framework of \\citet{Polanco2026}"),
        (r"Following Chapter~2,", r"Following \\citet{Polanco2026},")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00_profit_rate_accumulation_1960_1975.tex", [
        (r"and Chapter~2 dataset\.", r"and \\citet{Polanco2026}."),
        (r"Following Chapter~2,", r"Following \\citet{Polanco2026},"),
        (r"framework of Chapter~2", r"framework of \\citet{Polanco2026}")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00a_weisskopf_growth_accounting_shares.tex", [
        (r"estimated via Chapter~2 CMPR IM-OLS;", r"estimated via CMPR IM-OLS in \\citet{Polanco2026};")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00a_weisskopf_levels_regimes.tex", [
        (r"and Chapter~2 dataset\.", r"and \\citet{Polanco2026}."),
        (r"framework of Chapter~2;", r"framework of \\citet{Polanco2026};")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00b_capital_accumulation_regimes.tex", [
        (r"and Chapter~2 dataset\.", r"and \\citet{Polanco2026}.")
    ])
    
    replace_in_file(WP_DIR / "tables/tab00c_weisskopf_levels_regimes.tex", [
        (r"and Chapter~2 dataset\.", r"and \\citet{Polanco2026}."),
        (r"framework of Chapter~2;", r"framework of \\citet{Polanco2026};")
    ])
    
    for tab in ["tab02_sign_discrimination_summary.tex", "tab02a_granger_nominal_core.tex",
                "tab02b_granger_banking_bifurcation.tex", "tab02c_granger_real_dual_economy.tex",
                "tab02d_granger_external_pressures.tex", "tab02e_granger_central_bank_solvency.tex"]:
        replace_in_file(WP_DIR / f"tables/{tab}", [
            (r"chapter's (causal-language|methodological) contract", r"paper's \1 contract")
        ])

if __name__ == "__main__":
    apply_all_revisions()
