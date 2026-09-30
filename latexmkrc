# Dissertation LaTeX build configuration
# Compile with: latexmk -pdf dissertation.tex

$pdf_mode = 1;           # PDF via pdflatex
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Disable cd-to-aux-dir behavior for bibtex.
# By default latexmk (bibtex_fudge=1) changes to the directory of the
# .aux file before running bibtex. Since integration/*.aux files live in
# integration/ and their \bibdata{} paths point to Chapter1/references.bib
# (relative to the root), we must run bibtex from the root.
# Setting bibtex_fudge=0 achieves this.
$bibtex_fudge = 0;

# Run bibtex when needed (chapterbib generates per-chapter .aux files)
$bibtex_use = 1;

# Number of compilation passes
$max_repeat = 5;

# Clean extensions
@generated_exts = qw(
  aux bbl bcf blg fdb_latexmk fls log out run.xml synctex.gz toc lof lot
  idx ind ilg
);
