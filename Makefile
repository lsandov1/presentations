SOURCES=menu.md
DEST=menu.html
SUBDIRS = tools yocto

all: $(DEST) $(SUBDIRS)

menu.html: menu.md
		pandoc --offline -s -t slidy -o $@ $<

.PHONY: subdirs $(SUBDIRS)
     
subdirs: $(SUBDIRS)
     
$(SUBDIRS):
		$(MAKE) -C $@

clean:
		-rm -f *.html
