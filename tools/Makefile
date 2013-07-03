SOURCES=menu.md
DEST=menu.html #bash git

all: $(DEST)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

#bash:
#		@(cd bash; $(MAKE))

#git:
#		@(cd git; $(MAKE))

clean:
		-rm -f *.html

