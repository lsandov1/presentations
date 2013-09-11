SUBDIRS=yocto

all: $(DEST) $(SUBDIRS)

.PHONY: subdirs $(SUBDIRS)
     
subdirs: $(SUBDIRS)
     
$(SUBDIRS):
		$(MAKE) -C $@
