# These are common defs used in the top-level Makefile and 
# and Makefile.intel 
GCC6PKGS = openmpi openmpi-module 
GCC6TARGETS = $(addsuffix .pkg, $(GCC6PKGS))
