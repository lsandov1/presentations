SOURCES= menu.pdf.md menu.md folders.md Nsteps.md arch.md meta_input.md layer.md patching_kernel.md building_kernel.md contribute.mb

DEST=menu.html folders.html Nsteps.html arch.html meta_input.html layer.html patching_kernel.html building_kernel.html contribute.html menu.pdf folders.pdf Nsteps.pdf arch.pdf meta_input.pdf yocto_tutorial.pdf layer.pdf patching_kernel.pdf building_kernel.pdf contribute.pdf 

all: $(DEST)

menu.html: menu.md
		pandoc --self-contained -s -t slidy -o $@ $<

folders.html: folders.md
		pandoc --self-contained -s -t slidy -o $@ $<

Nsteps.html: Nsteps.md
		pandoc --self-contained -s -t slidy -o $@ $<

arch.html: arch.md
		pandoc --self-contained -s -t slidy -o $@ $<

meta_input.html: meta_input.md
		pandoc --self-contained -s -t slidy -o $@ $<

layer.html: layer.md
		pandoc --self-contained -s -t slidy -o $@ $<

patching_kernel.html: patching_kernel.md
		pandoc --self-contained -s -t slidy -o $@ $<

building_kernel.html: building_kernel.md
		pandoc --self-contained -s -t slidy -o $@ $<

contribute.html: contribute.md
		pandoc --self-contained -s -t slidy -o $@ $<

menu.pdf: menu.pdf.md
		pandoc --self-contained -s -o $@ $<

folders.pdf: folders.md
		pandoc --self-contained -s -o $@ $<

Nsteps.pdf: Nsteps.md
		pandoc --self-contained -s -o $@ $<

arch.pdf: arch.md
		pandoc --self-contained -s -o $@ $<

meta_input.pdf: meta_input.md
		pandoc --self-contained -s -o $@ $<

layer.pdf: layer.md
		pandoc --self-contained -s -o $@ $<

patching_kernel.pdf: patching_kernel.md
		pandoc --self-contained -s -o $@ $<

building_kernel.pdf: building_kernel.md
		pandoc --self-contained -s -o $@ $<

contribute.pdf: contribute.md
		pandoc --self-contained -s -o $@ $<

yocto_tutorial.pdf: menu.pdf folders.pdf Nsteps.pdf arch.pdf meta_input.pdf layer.pdf patching_kernel.pdf building_kernel.pdf contribute.pdf 
		gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$@ menu.pdf Nsteps.pdf folders.pdf arch.pdf meta_input.pdf layer.pdf patching_kernel.pdf building_kernel.pdf contribute.pdf

clean:
		rm -f *.html *.pdf
