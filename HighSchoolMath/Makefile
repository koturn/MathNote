TEX       := platex
DVIPDF    := dvipdfmx
DVIPS     := dvips
GNUPLOT   := gnuplot
PDFVIEWER := acroread
PSVIEWER  := gv
DVIVIEWER := dviout
MKDIR     := mkdir -p
RM        := rm -f
TEXFLAGS  := --kanji=utf8 -src-specials -interaction=nonstopmode

TARGET      := sincostan.pdf
PSFILE      := $(TARGET:.pdf=.ps)
DVIFILE     := $(TARGET:.pdf=.dvi)
TEXFILE     := $(TARGET:.pdf=.tex)
STYFILE     := $(TARGET:.pdf=.sty)
AUXFILE     := $(TARGET:.pdf=.aux)
LOGFILE     := $(TARGET:.pdf=.log)

BASEPLTS    := second_incdec first_incdec
GNUPLOTDIR  := gnuplot
IMGDIR      := img
EPSFILES    := $(addsuffix .eps, $(addprefix $(IMGDIR)/, $(BASEPLTS)))
EPSTEXFILES := $(addsuffix .tex, $(addprefix $(IMGDIR)/, $(BASEPLTS)))
PLTFILES    := $(addsuffix .plt, $(addprefix $(GNUPLOTDIR)/, $(BASEPLTS)))
TRUSHLIST   := $(AUXFILE) $(DVIFILE) $(LOGFILE) $(PSFILE) $(EPSFILES) $(EPSTEXFILES)

VPATH       := $(GNUPLOTDIR)/


.SUFFIXES: .dvi .eps .pdf .plt .ps .tex
.dvi.pdf:
	$(DVIPDF) $*
.dvi.ps:
	$(DVIPS) $*
.tex.dvi:
	$(TEX) $(TEXFLAGS) $*
.tex.aux:
	$(TEX) $(TEXFLAGS) $*
.plt.eps:
	$(GNUPLOT) $^
.plt.tex:
	$(GNUPLOT) $^

$(IMGDIR)/%.eps $(IMGDIR)/%.tex: %.plt
	@if [ ! -d $(@D) ]; then \
		$(MKDIR) $(@D); \
	fi
	$(GNUPLOT) $^


.PHONY: all
all: $(DVIFILE)

.PHONY: pdf
pdf: $(TARGET)

.PHONY: ps
ps: $(PSFILE)


$(TARGET): $(DVIFILE)

$(DVIFILE): $(TEXFILE) $(STYFILE) $(AUXFILE) $(EPSFILES) $(EPSTEXFILES)

$(AUXFILE): $(TEXFILE)

$(EPSFILES): $(PLTFILES)

$(EPSTEXFILES): $(PLTFILES)


.PHONY: viewpdf
viewpdf: $(TARGET)
	$(PDFVIEWER) $< &

.PHONY: viewps
viewps: $(PSFILE)
	$(PSVIEWER) $< &

.PHONY: viewdvi
viewdvi: $(DVIFILE)
	$(DVIVIEWER) $< &

.PHONY: clean
clean:
	$(RM) $(TARGET) $(TRUSHLIST) *.pbm

.PHONY: cleanobj
cleanobj:
	$(RM) $(TRUSHLIST) *.pbm
