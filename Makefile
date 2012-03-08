SOURCES=basics.md stdout.md stdin.md
DEST=basics.html stdout.html stdin.html

all: $(DEST)

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

stdout.html: stdout.md
		pandoc --offline -s -t slidy -o $@ $<

stdin.html: stdin.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
