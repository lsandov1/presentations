SOURCES=layer.md
DEST=layer.html

all: $(DEST)

layer.html: layer.md
		pandoc --offline -s -t slidy -o $@ $<

