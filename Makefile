MK      = latexmk
TEXC    = pdflatex

COMPILE = $(MK) -pdflatex=$(TEXC) -recorder

.PHONY: all bg clean

all:
	pgrep $(MK) || $(COMPILE)

bg:
	$(COMPILE) -pvc -interaction=nonstopmode -view=none

clean:
	$(MK) -c
	rm pdfa.xmpi # additional file created by pdfx package
