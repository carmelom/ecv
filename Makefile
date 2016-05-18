MAIN            = main
MAIN_TEX        = $(MAIN).tex
MAIN_PDF        = $(MAIN).pdf
EXT_CLEAN       = *.aux *.bbl *.blg *.brf *.idx \
                  *.ilg *.ind *.log *.lof *.lot *.toc *.out\
                  *maf *mtc *mtc0
EXT_DISTCLEAN   = *.pdf

PDFLATEX = TEXINPUTS=.:./europecv2013/: pdflatex
BIBTEX = TEXINPUTS=.:./europecv2013/: bibtex

.PHONY : pdf pdflatex distclean clean all


pdf : $(MAIN_PDF)

pdflatex : $(MAIN_PDF)
	$(PDFLATEX) $(MAIN_TEX)

$(MAIN_PDF): $(MAIN_TEX) 
	$(PDFLATEX) $(MAIN_TEX)
	$(BIBTEX) $(MAIN)
	$(PDFLATEX) $(MAIN_TEX)
	$(PDFLATEX) $(MAIN_TEX)
#	make clean
    
distclean : clean
	rm -f $(EXT_DISTCLEAN)
	
clean :
	rm -f $(EXT_CLEAN)

