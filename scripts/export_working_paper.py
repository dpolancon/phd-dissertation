"""
export_working_paper.py
======================
Automated tool to export and build standalone working papers from the dissertation source of truth.
Mirrors the dissertation main layout, typography, table tidying, and float autoscaling engine.

Usage:
    python scripts/export_working_paper.py --chapter 3
    python scripts/export_working_paper.py --chapter 1
    python scripts/export_working_paper.py --chapter 2
"""

import os
import sys
import shutil
import subprocess
import argparse
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent

def build_chapter3_tex():
    """Generates the standalone LaTeX working paper driver for Chapter 3."""
    return r"""\documentclass[11pt]{article}

% ==============================================================================
% WORKING PAPER: Re-visiting the Political Economy of the Rise and Fall of the Unidad Popular
% Exported from PhD Dissertation source of truth (University of Massachusetts Amherst)
% Mirrored layout engine: Letterpaper, 1.05 stretch, microtype, float auto-scaler
% ==============================================================================

% ---- Language & encoding ----
\usepackage[english]{babel}
\usepackage[T1]{fontenc}
\usepackage{lmodern}

% ---- Layout & Spacing (Dissertation Main Engine) ----
\usepackage[letterpaper, margin=1in]{geometry}
\usepackage{setspace}
\setstretch{1.05}

% ---- Microtypography ----
\usepackage{microtype}

% ---- Math & Theorems ----
\usepackage{amsmath,amssymb,bm}
\usepackage{amsthm}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}

% ---- Figures & Floats ----
\usepackage{graphicx}
\usepackage{float}
\usepackage{placeins}
\usepackage{pdflscape}

% ---- Tables (Dissertation Main Engine) ----
\usepackage{array}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{tabularx}
\usepackage{makecell}
\usepackage{threeparttable}
\usepackage{siunitx}
\sisetup{group-separator={,}, group-minimum-digits=4}

% ---- Captions ----
\usepackage{caption}
\usepackage{subcaption}
\captionsetup{font=small, labelfont=bf, labelsep=period}

% ---- Lists ----
\usepackage{enumitem}
\setlist{noitemsep, topsep=4pt}

% ---- Math & Text Helpers ----
\usepackage{xfrac}
\usepackage{ragged2e}

% ---- Color Palette ----
\usepackage[dvipsnames]{xcolor}
\colorlet{ink}{black}
\colorlet{subink}{black!72}
\colorlet{lightink}{black!45}
\colorlet{guide}{black!28}
\colorlet{panel}{black!4}
\colorlet{panelb}{black!7}
\colorlet{panelc}{black!10}
\colorlet{stress}{black!12}
\definecolor{navy}{HTML}{1D3557}
\definecolor{crimson}{HTML}{9E2A2B}
\definecolor{amber}{HTML}{E76F51}
\definecolor{darkgreen}{HTML}{2A9D8F}
\definecolor{slate}{HTML}{4A4E69}
\definecolor{darkblue}{rgb}{0,0,0.8}

% ---- TikZ ----
\usepackage{tikz}
\usetikzlibrary{arrows.meta,positioning,calc,matrix}

% ---- Column Types ----
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% ---- Appendix & Bibliography ----
\usepackage{titlesec}
\usepackage[titletoc,toc,title]{appendix}
\usepackage[authoryear]{natbib}

% ---- Hyperref & Cleveref ----
\usepackage[
  colorlinks  = true,
  linkcolor   = darkblue,
  citecolor   = darkblue,
  urlcolor    = darkblue,
  bookmarksnumbered = true,
  pdfauthor   = {Diego Polanco}
]{hyperref}
\usepackage{cleveref}

% ---- Float Autoscaler Hook (Mirrored from Dissertation Main integration) ----
% Dynamically rescales completed floats only when exceeding text height,
% guaranteeing that large tables and stacked panels fit on a single page.
\newsavebox{\WorkingPaperFloatBox}
\makeatletter
\let\wp@endfloatbox\@endfloatbox
\def\@endfloatbox{%
  \wp@endfloatbox
  \ifdim\dimexpr\ht\@currbox+\dp\@currbox\relax>\textheight
    \typeout{WORKING PAPER: fitting oversized float to page height}%
    \setbox\WorkingPaperFloatBox\box\@currbox
    \global\setbox\@currbox\vbox{%
      \hbox to\columnwidth{\hfil
        \resizebox*{!}{0.98\textheight}{\usebox{\WorkingPaperFloatBox}}%
      \hfil}}%
  \fi
}
\makeatother

% ---- Paragraph Rhythm ----
\setlength{\parskip}{0.55em}
\setlength{\parindent}{0pt}

% ---- Graphicspath ----
\graphicspath{{figures/}{appendix/}{sections/}}

% ---- Working Paper Metadata ----
\title{\textbf{Re-visiting the Political Economy of the Rise and Fall of the Unidad Popular: Towards a Global Political Economy Approach}\thanks{Doctoral Candidate in Economics, Department of Economics, University of Massachusetts Amherst. Email: \texttt{dpolanconeco@umass.edu}. This working paper draws upon and extends research from the author's Ph.D.\ dissertation at the University of Massachusetts Amherst \citep{Polanco2026}. The author thanks the dissertation committee members for invaluable comments and guidance. All analytical arguments, historical interpretations, and remaining errors are the author's sole responsibility.}}

\author{\textbf{Diego Polanco}\thanks{Department of Economics, University of Massachusetts Amherst.} \\
Department of Economics, University of Massachusetts Amherst}

\date{October 2026 \\ \vspace{0.5em} \small\textbf{Working Paper}}

\begin{document}

\maketitle

\begin{abstract}
This paper evaluates competing explanations of the macroeconomic crisis of
Chile's Unidad Popular (1970--1973), examining the causal ordering between
domestic monetary expansion, inflation, the external constraint, and
central-bank accommodation. Advancing dependency theory as a research programme
in the Lakatosian sense, it develops the programme's protective belt by
specifying an empirically testable balance-sheet mechanism that links the
international currency hierarchy, access to world money, the balance-of-payments
constraint, peripheral central-bank solvency, and endogenous monetary
accommodation. Historically, the analysis distinguishes the contingent exercise
of U.S.\ hegemonic agency surrounding the breakdown of Bretton Woods, the
targeted bilateral credit restrictions confronting Chile, and the constrained
but real institutional agency of the Central Bank of Chile (BCCh). Using a
multi-frequency empirical design, the empirical strategy deploys stationary
vector-autoregressive Granger directional-precedence tests and a non-linear
Threshold Vector Autoregression where the central bank's predetermined Solvency
Growth Gap ($\Delta s_{t-1} \equiv g^F_{t-1} - g^H_{t-1}$) acts as the
transition variable. The empirical analysis reveals that in the adverse
solvency-growth state ($\Delta s_{t-1} \le -4.615\%$, reflecting conditions of
central bank insolvency), forward monetary transmission (base-money shock to
inflation) is statistically significant for 9 consecutive months with a
cumulative 12-month response of 3.55 percentage points. In contrast, reverse
accommodation (inflation shock to base-money growth) is statistically
significant for 10 consecutive months, delivering a cumulative 12-month
expansion of 6.54 percentage points. Reverse accommodation exceeds forward
transmission in both duration and cumulative magnitude, with point-wise
multiplier differences significant across 9 consecutive months
($h=2,\dots,10$). These findings indicate that monetary transmission is
state-dependent on external reserve solvency, providing evidence consistent
with an endogenous accommodation mechanism under severe balance-of-payments
constraints and challenging accounts that treat money creation as an autonomous
driver of the Chilean inflation.
\end{abstract}

\vspace{0.8em}
\noindent\textbf{Keywords:} Unidad Popular, Balance of Payments, Financial
Subordination, Solvency Ratio, Endogenous Money, Threshold Vector
Autoregression, International Currency Hierarchy, Dependency Theory.

\vspace{0.4em}
\noindent\textbf{JEL Codes:} B51, C32, E58, F33, N16.

\clearpage

% ── Manuscript Sections ────────────────────────────────────────────────────────
\input{sections/01_introduction}
\input{sections/02_literature_review}
\input{sections/03_macro_framework}
\input{sections/04_data_architecture}
\input{sections/05_historical_empirical_results}
\input{sections/06_discussion_conclusion}

\clearpage
\begingroup
\setlength{\bibsep}{2.5pt}
\bibliographystyle{apalike}
\bibliography{references}
\endgroup

\clearpage
\begin{appendices}
\input{appendix/appendix_bop_levr}
\input{appendix/appendix_archival_codebook}
\input{appendix/appendix_causal_pcmci_ee1}
\input{appendix/appendix_tvar_girf_atlas}
\input{appendix/appendix_linear_var_diagnostics}
\end{appendices}

\end{document}
"""

def export_chapter(chapter_num, compile_pdf=True):
    """Exports a chapter to the workingpapers/ tree and optionally compiles it."""
    dest_dir = REPO_ROOT / "workingpapers" / f"chapter{chapter_num}"
    source_dir = REPO_ROOT / f"Chapter{chapter_num}"
    
    if not source_dir.exists():
        raise FileNotFoundError(f"Source directory {source_dir} not found.")
        
    print(f"[*] Initializing working paper workspace: {dest_dir}")
    dest_dir.mkdir(parents=True, exist_ok=True)
    
    # Folders to copy
    if chapter_num == 3:
        subdirs = ["sections", "figures", "tables", "appendix"]
        for s in subdirs:
            src_sub = source_dir / s
            dst_sub = dest_dir / s
            if src_sub.exists():
                print(f"    - Syncing {s}/...")
                shutil.copytree(src_sub, dst_sub, dirs_exist_ok=True)
        
        # Copy references.bib
        ref_src = source_dir / "references.bib"
        if ref_src.exists():
            shutil.copy2(ref_src, dest_dir / "references.bib")
            print("    - Copied references.bib")
            
        # Write standalone driver
        tex_path = dest_dir / "working_paper.tex"
        tex_content = build_chapter3_tex()
        with open(tex_path, "w", encoding="utf-8") as f:
            f.write(tex_content)
        print(f"    - Generated {tex_path.name}")
        
    else:
        raise NotImplementedError(f"Chapter {chapter_num} template configuration to be added.")
        
    if compile_pdf:
        print(f"[*] Compiling working paper via latexmk in {dest_dir}...")
        cmd = ["latexmk", "-pdf", "-interaction=nonstopmode", "working_paper.tex"]
        res = subprocess.run(cmd, cwd=dest_dir, capture_output=True, text=True, errors="replace")
        if res.returncode == 0:
            print(f"[+] Compilation succeeded! PDF generated at {dest_dir / 'working_paper.pdf'}")
        else:
            print(f"[!] Compilation finished with code {res.returncode}. Check log at {dest_dir / 'working_paper.log'}")
            # Print last 20 lines of log if failed
            log_file = dest_dir / "working_paper.log"
            if log_file.exists():
                with open(log_file, "r", encoding="utf-8", errors="ignore") as lf:
                    lines = lf.readlines()
                    print("".join(lines[-25:]))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export chapter as standalone working paper.")
    parser.add_argument("--chapter", type=int, default=3, choices=[1, 2, 3], help="Chapter number")
    parser.add_argument("--no-compile", action="store_true", help="Skip compilation pass")
    args = parser.parse_args()
    
    export_chapter(args.chapter, compile_pdf=not args.no_compile)
