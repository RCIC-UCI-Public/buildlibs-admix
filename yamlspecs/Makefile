# Copyright (c) 2000 - 2019 The Regents of the University of California.
# All rights reserved.	
# This includes the Generic yaml2rpm Makefile - most packaging should
# be able to use this.

# All packages are made with gcc. SOME packages are made with Intel.
# IntelDefs.mk is used by this Makefile and Makefile.intel

SUBMAKES = Makefile.gcc Makefile.intel
include IntelDefs.mk

.DEFAULT_GOAL = default
%.pkg:
	$(MAKE) -f Makefile.gcc $@
	echo $(INTELTARGETS) | grep -q -w $@; \
	if [ $$? -eq 0 ]; then \
		/bin/rm $@; \
		$(MAKE) -f Makefile.intel $@; \
        fi
	
ansible:
	$(MAKE) -s -f Makefile.gcc $@

manifest module-provides module-requires: 
	for f in $(SUBMAKES); do \
		$(MAKE) -s -f $$f $@; \
        done

download:
	$(MAKE) -f Makefile.gcc $@

%: 	
	$(MAKE) -f Makefile.gcc $@
	$(MAKE) -f Makefile.intel clean
	$(MAKE) -f Makefile.intel $@
	
	
