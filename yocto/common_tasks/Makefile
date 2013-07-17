SOURCES=layer.md patching_kernel.md building_kernel.md
DEST=layer.html patching_kernel.html building_kernel.html

all: $(DEST)

layer.html: layer.md
		pandoc --offline -s -t slidy -o $@ $<

patching_kernel.html: patching_kernel.md
		pandoc --offline -s -t slidy -o $@ $<

building_kernel.html: building_kernel.md
		pandoc --offline -s -t slidy -o $@ $<
