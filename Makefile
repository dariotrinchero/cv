MK      = latexmk
TEXC    = pdflatex

COMPILE = $(MK) -pdflatex=$(TEXC) -recorder

# latexmk processes already running in this folder, i.e. from a running `make bg`
WATCHERS := $(shell for p in $$(pgrep -x $(MK)); do \
	[ "$$(readlink /proc/$$p/cwd)" = "$(CURDIR)" ] && echo $$p; done)

.PHONY: all bg clean

ifeq ($(WATCHERS),)
all:
	$(COMPILE)

bg:
	$(COMPILE) -pvc -interaction=nonstopmode -view=none
else
all bg:
	@echo "make bg is already running in this folder"
endif

clean:
	$(MK) -c
	rm pdfa.xmpi # additional file created by pdfx package
