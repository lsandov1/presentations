SOURCES=menu.md basics.md branching.md collaboration.md tags.md tips_tricks.md
DEST=menu.html basics.html branching.html collaboration.html tags.html tips_tricks.html

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

branching.html: branching.md
		pandoc --offline -s -t slidy -o $@ $<

collaboration.html: collaboration.md
		pandoc --offline -s -t slidy -o $@ $<
		
tags.html: tags.md
		pandoc --offline -s -t slidy -o $@ $<		

tips_tricks.html: tips_tricks.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
