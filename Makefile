all: keep.pdf keep.ru.pdf

keep.pdf: keep.tex references.bib
	cat keep.tex | sed "s/COMMIT/$$(git show HEAD | head -1 | awk '{print $$2}' | cut -c 1-10 | tee TEST)/g" > templated.tex
	pdflatex -halt-on-error templated.tex
	bibtex templated.aux
	pdflatex -halt-on-error templated.tex
	pdflatex -halt-on-error templated.tex
	mv templated.pdf keep.pdf

keep.ru.pdf: keep.ru.tex references.bib
	cat keep.ru.tex | sed "s/COMMIT/$$(git show HEAD | head -1 | awk '{print $$2}' | cut -c 1-10 | tee TEST)/g" > templated.ru.tex
	pdflatex -halt-on-error templated.ru.tex
	bibtex templated.ru.aux
	pdflatex -halt-on-error templated.ru.tex
	pdflatex -halt-on-error templated.ru.tex
	mv templated.ru.pdf keep.ru.pdf

clean:
	rm -f templated.out templated.log templated.aux templated.blg templated.dvi templated.bbl templated.aux keep.pdf templated.ru.out templated.ru.log templated.ru.aux templated.ru.blg templated.ru.dvi templated.ru.bbl templated.ru.aux keep.ru.pdf
