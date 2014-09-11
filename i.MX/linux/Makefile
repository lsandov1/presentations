SOURCES=menu.md toolchain.md uboot.md kernel.md

DEST=menu.html toolchain.html uboot.html kernel.html

all: $(DEST)

menu.html: menu.md
		pandoc --self-contained -s -t slidy -o $@ $<

toolchain.html: toolchain.md
		pandoc --self-contained -s -t slidy -o $@ $<

uboot.html: uboot.md
		pandoc --self-contained -s -t slidy -o $@ $<

kernel.html: kernel.md
		pandoc --self-contained -s -t slidy -o $@ $<

clean:
		rm -f *.html
