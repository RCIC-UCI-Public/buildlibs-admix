# These are common defs used in the top-level Makefile and 
# and Makefile.intel 
INTELPKGS = openmpi openmpi-module mpich mpich-module
INTELTARGETS = $(addsuffix .pkg, $(INTELPKGS))
