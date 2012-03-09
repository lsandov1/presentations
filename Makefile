SOURCES=basics.md stdout.md stdin.md exec.md scripting.md tools_1.md
DEST=basics.html stdout.html stdin.html exec.html scripting.html tools_1.html

all: $(DEST)

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

stdout.html: stdout.md
		pandoc --offline -s -t slidy -o $@ $<

stdin.html: stdin.md
		pandoc --offline -s -t slidy -o $@ $<

exec.html: exec.md
		pandoc --offline -s -t slidy -o $@ $<

scripting.html: scripting.md
		pandoc --offline -s -t slidy -o $@ $<

tools_1.html: tools_1.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
