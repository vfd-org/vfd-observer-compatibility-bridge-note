TEX      = paper/observer-compatibility-bridge-note.tex
PDF      = $(TEX:.tex=.pdf)
BIB      = paper/references.bib
LATEXMK  = latexmk
PDFLATEX = pdflatex
BIBTEX   = bibtex

.PHONY: all clean distclean

all: $(PDF)

$(PDF): $(TEX) $(BIB)
	cd paper && $(LATEXMK) -pdf -interaction=nonstopmode observer-compatibility-bridge-note.tex

clean:
	cd paper && $(LATEXMK) -c observer-compatibility-bridge-note.tex

distclean:
	cd paper && $(LATEXMK) -C observer-compatibility-bridge-note.tex

# Fallback if latexmk is not installed
manual:
	cd paper && $(PDFLATEX) observer-compatibility-bridge-note.tex \
	&& $(BIBTEX) observer-compatibility-bridge-note \
	&& $(PDFLATEX) observer-compatibility-bridge-note.tex \
	&& $(PDFLATEX) observer-compatibility-bridge-note.tex
