SOURCES=menu.md basics.md branching.md
DEST=menu.html basics.html branching.html

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

branching.html: branching.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
