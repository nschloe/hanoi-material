# ./Makefile

# ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

LATEX:=lualatex
#LATEX_OPTIONS:=
LATEX_OPTIONS:=-shell-escape

# ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

default: ex1

ex1:
	@$(LATEX) $(LATEX_OPTIONS) ex1

ex2:
	@$(LATEX) $(LATEX_OPTIONS) ex2

.PHONY: clean

clean:
	@rm -f ex*-blx.bib \
	       ex*.aux \
	       ex*.out \
	       ex*.auxlock \
	       ex*.bbl \
	       ex*.blg \
	       ex*.log \
	       ex*.pdf \
	       ex*-figure*.pdf \
	       ex*-figure*.log \
	       ex*-figure*.dpth \
	       ex*.snm \
	       ex*.nav
	@rm -f missfont.log \
	       x.log
	@rm -f *~
