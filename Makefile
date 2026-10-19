MK      = latexmk
TEXC    = pdflatex

COMPILE = $(MK) -pdflatex=$(TEXC) -recorder

# The academic version, and the industry version's wrapper (which compiles to cv-industry.pdf here)
INDUSTRY = template/cv-industry.tex
CVS     = cv.tex $(INDUSTRY)

# latexmk processes already running in this folder, i.e. from a running `make bg`
WATCHERS := $(shell for p in $$(pgrep -x $(MK)); do \
	[ "$$(readlink /proc/$$p/cwd)" = "$(CURDIR)" ] && echo $$p; done)

WATCH   = $(COMPILE) -pvc -interaction=nonstopmode -view=none

.PHONY: all bg bg-academic bg-industry clean

ifeq ($(WATCHERS),)
all:
	$(COMPILE) $(CVS)

# latexmk can only watch one file, so `bg` watches the academic version, and rebuilds the industry
# version after each successful build of it (so the two never compile at once, as both write pdfa.xmpi)
bg:
	$(WATCH) -e '$$success_cmd = "$(COMPILE) -interaction=nonstopmode $(INDUSTRY)"' cv.tex

# Watch one version only
bg-academic:
	$(WATCH) cv.tex

bg-industry:
	$(WATCH) $(INDUSTRY)
else
all bg bg-academic bg-industry:
	@echo "a make bg watcher is already running in this folder"
endif

clean:
	$(MK) -c $(CVS)
	rm pdfa.xmpi # additional file created by pdfx package
