SOURCES=menu.md folders.md 8steps.md arch.md meta_input.md development.md
DEST=menu.html folders.html 8steps.html arch.html meta_input.html development.html

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

folders.html: folders.md
		pandoc --offline -s -t slidy -o $@ $<

8steps.html: 8steps.md
		pandoc --offline -s -t slidy -o $@ $<

arch.html: arch.md
		pandoc --offline -s -t slidy -o $@ $<

meta_input.html: meta_input.md
		pandoc --offline -s -t slidy -o $@ $<

development.html: development.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
