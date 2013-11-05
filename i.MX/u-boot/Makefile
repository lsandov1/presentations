SOURCES= intro.md
DEST= intro.html intro.pdf intro_dev.pdf
all: $(DEST)

intro.html: intro.md
		pandoc --self-contained -s -t slidy -o $@ $<

intro.pdf: intro.md
		pandoc --self-contained -s -o $@ $<
intro_dev.pdf: intro.md
	cp intro.md intro_dev.md
	echo '' >> intro_dev.md
	echo '# Revision' >> intro_dev.md
	echo '' >> intro_dev.md
	git log --oneline -1 >> intro_dev.md
	pandoc --self-contained -s -o $@ intro_dev.md

clean:
		rm -f *.html *.pdf
