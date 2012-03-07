all: basics.html

basics.html: basics.md
		pandoc --offline -s -t slidy -o $@ $<

clean:
		-rm -f basics.html
