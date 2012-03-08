SOURCES=basics.md stdout.md stdin.md exec.md
DEST=basics.html stdout.html stdin.html exec.html

all: $(DEST)

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

stdout.html: stdout.md
		pandoc --offline -s -t slidy -o $@ $<

stdin.html: stdin.md
		pandoc --offline -s -t slidy -o $@ $<

exec.html: exec.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
