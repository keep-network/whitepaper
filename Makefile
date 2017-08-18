keep.pdf: keep.tex references.bib
	pdflatex -halt-on-error keep.tex
	bibtex keep.aux
	pdflatex -halt-on-error keep.tex
	pdflatex -halt-on-error keep.tex

clean:
	rm -f keep.out keep.log keep.aux keep.blg keep.dvi keep.bbl keep.aux keep.pdf
