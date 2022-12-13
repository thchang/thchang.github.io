INSTALL = ../thchang-style
BUILDDIR = ./build

all: $(BUILDDIR)/web.html $(BUILDDIR)/cv.pdf

$(BUILDDIR)/web.html: templates/web.template info/*
	python3 $(INSTALL)/parser.py templates/web.template $(BUILDDIR)
	mv build/web.html ./index.html
	mv build/timeline.svg ./timeline.svg

$(BUILDDIR)/cv.pdf: templates/cv.template info/*
	python3 $(INSTALL)/parser.py templates/cv.template $(BUILDDIR)
