TEXFILES := $(shell echo tests/*.tex)
TARGETS := $(patsubst %.tex,%.pdf,$(TEXFILES))

all: $(TARGETS)

$(TEXFILES): tikzlibraryfunprog.code.tex
	touch $(TEXFILES)

%.pdf: %.tex
	pdflatex -halt-on-error -output-directory=$(dir $@) $<

clean:
	rm -f tests/*.log \
	      tests/*.aux \
		  tests/*.pdf

watch:
	while true; do \
		find . -name '*.tex' | inotifywait --fromfile - --recursive -e modify -e create -e delete -e move && make; \
	done

.PHONY: all clean watch
