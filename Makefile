MK      = latexmk
TEXC    = pdflatex

COMPILE = $(MK) -pdflatex=$(TEXC) -recorder

# The academic version, and the industry version's wrapper (which compiles to cv-industry.pdf here)
CVS     = cv.tex template/cv-industry.tex

# latexmk processes already running in this folder, i.e. from a running `make bg`
WATCHERS := $(shell for p in $$(pgrep -x $(MK)); do \
	[ "$$(readlink /proc/$$p/cwd)" = "$(CURDIR)" ] && echo $$p; done)

.PHONY: all bg bg-industry clean

ifeq ($(WATCHERS),)
all:
	$(COMPILE) $(CVS)

# latexmk can only watch one file, so each version gets its own target
bg:
	$(COMPILE) -pvc -interaction=nonstopmode -view=none cv.tex

bg-industry:
	$(COMPILE) -pvc -interaction=nonstopmode -view=none template/cv-industry.tex
else
all bg bg-industry:
	@echo "make bg is already running in this folder"
endif

clean:
	$(MK) -c $(CVS)
	rm pdfa.xmpi # additional file created by pdfx package
