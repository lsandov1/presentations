SOURCES= intro.md
DEST= intro.html intro.pdf
all: $(DEST)

intro.html: intro.md
		pandoc --self-contained -s -t slidy -o $@ $<

intro.pdf: intro.md
		pandoc --self-contained -s -o $@ $<

clean:
		rm -f *.html *.pdf
