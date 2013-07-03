SOURCES=menu.md diff_patch.md
DEST=menu.html diff_patch.html# git

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

diff_patch.html: diff_patch.md
		pandoc --offline -s -t slidy -o $@ $<

#git:
#		(cd git; make)

clean:
		-rm -f *.html
		(cd git; make clean)
