#!/bin/bash
# mpich, openmpi need F90 to be unset
unset F90
# Rules.mk sets CPPFLAGS=-DVERSION\"$(VERSION)\"= set. Need to investigate if removing
# this from Rules.mk has unintended consequences for other builds. For MPICH/OPENMPI, this
# needs to be removed from CPPFLAGS
CPPFLAGS=$(echo -n $CPPFLAGS | sed 's/ -DVERSION=.*"//')
exec ./configure $*
