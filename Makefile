SOURCES=menu.md
DEST=menu.html

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
