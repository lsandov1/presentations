SOURCES=menu.md basics.md stdout.md stdin.md exec.md scripting.md tools.md
DEST=menu.html basics.html stdout.html stdin.html exec.html scripting.html tools.html

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

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

tools.html: tools.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f *.html
