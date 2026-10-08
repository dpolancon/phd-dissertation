TARGET = working_paper

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex references.bib sections/*.tex appendices/*.tex
	latexmk -pdf -bibtex -interaction=nonstopmode -synctex=1 $(TARGET).tex

clean:
	latexmk -C
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.synctex.gz
