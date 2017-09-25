keep.pdf: keep.tex references.bib
	cat keep.tex | sed "s/COMMIT/$$(git show HEAD | head -1 | awk '{print $$2}' | cut -c 1-10 | tee TEST)/g" > templated.tex
	pdflatex -halt-on-error templated.tex
	bibtex templated.aux
	pdflatex -halt-on-error templated.tex
	pdflatex -halt-on-error templated.tex
	mv templated.pdf keep.pdf

clean:
	rm -f templated.out templated.log templated.aux templated.blg templated.dvi templated.bbl templated.aux keep.pdf
