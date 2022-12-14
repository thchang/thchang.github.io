INSTALL = ../thchang-style
BUILDDIR = .
IMGDIR = img

all: $(BUILDDIR)/web.html $(BUILDDIR)/cv.pdf $(BUILDDIR)/fullcv.pdf $(BUILDDIR)/resume.pdf

$(BUILDDIR)/index.html: info/* templates/web.template
	python3 $(INSTALL)/parser.py templates/web.template $(BUILDDIR)
	#cp -r img $(BUILDDIR)/img # comment out this line if building in-place
	mv web.html index.html # set the landing page

$(BUILDDIR)/cv.pdf: info/* templates/cv.template
	python3 $(INSTALL)/parser.py templates/cv.template $(BUILDDIR)

$(BUILDDIR)/fullcv.pdf: info/* templates/fullcv.template
	python3 $(INSTALL)/parser.py templates/fullcv.template $(BUILDDIR)

$(BUILDDIR)/resume.pdf: info/* templates/resume.template
	python3 $(INSTALL)/parser.py templates/resume.template $(BUILDDIR)

clean:
	rm -f $(BUILDDIR)/*.log $(BUILDDIR)/*.out $(BUILDDIR)/*.aux $(BUILDDIR)/timeline.svg
	rm -f $(BUILDDIR)/web.html $(BUILDDIR)/cv.pdf $(BUILDDIR)/fullcv.pdf $(BUILDDIR)/resume.pdf
