SOURCES=layer.md patching_kernel.md
DEST=layer.html patching_kernel.html

all: $(DEST)

layer.html: layer.md
		pandoc --offline -s -t slidy -o $@ $<

patching_kernel.html: patching_kernel.md
		pandoc --offline -s -t slidy -o $@ $<

