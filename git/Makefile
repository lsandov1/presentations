SOURCES=menu.md basics.md
DEST=menu.html basics.html

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
