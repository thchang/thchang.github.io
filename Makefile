INSTALL = ../thchang-style
BUILDDIR = .
IMGDIR = img

all: $(BUILDDIR)/index.html $(BUILDDIR)/cv.pdf $(BUILDDIR)/fullcv.pdf $(BUILDDIR)/resume.pdf $(BUILDDIR)/shortcv.pdf $(BUILDDIR)/pubslist.pdf $(BUILDDIR)/refs.pdf

$(BUILDDIR)/index.html: info/* templates/web.template
	python3 $(INSTALL)/parser.py templates/web.template $(BUILDDIR)
	#cp -r img $(BUILDDIR)/img # comment out this line if building in-place
	mv web.html index.html # set the landing page

$(BUILDDIR)/cv.pdf: info/* templates/cv.template
	python3 $(INSTALL)/parser.py templates/cv.template $(BUILDDIR)

$(BUILDDIR)/pubslist.pdf: info/* templates/pubslist.template
	python3 $(INSTALL)/parser.py templates/pubslist.template $(BUILDDIR)

$(BUILDDIR)/refs.pdf: info/* templates/refs.template
	python3 $(INSTALL)/parser.py templates/refs.template $(BUILDDIR)

$(BUILDDIR)/fullcv.pdf: info/* templates/fullcv.template
	python3 $(INSTALL)/parser.py templates/fullcv.template $(BUILDDIR)

$(BUILDDIR)/resume.pdf: info/* templates/resume.template
	python3 $(INSTALL)/parser.py templates/resume.template $(BUILDDIR)

$(BUILDDIR)/shortcv.pdf: info/* templates/shortcv.template
	python3 $(INSTALL)/parser.py templates/shortcv.template $(BUILDDIR)

clean:
	rm -f $(BUILDDIR)/*.log $(BUILDDIR)/*.out $(BUILDDIR)/*.aux $(BUILDDIR)/timeline.svg $(BUILDDIR)/*.flg
	rm -f $(BUILDDIR)/web.html $(BUILDDIR)/cv.pdf $(BUILDDIR)/fullcv.pdf $(BUILDDIR)/resume.pdf $(BUILDDIR)/pubslist.pdf $(BUILDDIR)/refs.pdf
