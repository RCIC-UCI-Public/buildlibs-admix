# buildlibs-admix
Various generic libraries that may need updated compilers to build

1. Boost

   Before compiling boost, make sure that there are correct  python and its
   include files for system installed python3.6. The */usr/include/python3.6m*
   is installed via *python3-libs-3.6.8-41.el8.rocky.0.x86_64*.

   By default, system python is set to */usr/bin/unversioned-python*
   Reset to use pytohn 3.6 via an interactive command and choosing
   an option for python3 in themenu:

   ```bash
   alternatives --config python
   ```

   When compiling boost,  gcc looks for header files in  *-I"/usr/include/python3.6"*
   which by default install of above RPM does not exist.  Creation of *libboost_python*
   libraries fails with *fatal error: pyconfig.h: No such file or directory*
   while this file is present in */usr/include/python3.6m*

   To remedy create missing */usr/include/python3.6* via

   ```bash
   alternatives --install /usr/bin/unversioned-python \
                          python \
                          /usr/bin/python3 \
                          300 \
                --slave   /usr/bin/python \
                          unversioned-python \
                          /usr/bin/python3 \
                --slave   /usr/share/man/man1/python.1.gz \
                          unversioned-python-man \
                          /usr/share/man/man1/python3.1.gz \
                --slave   /usr/include/python3.6 \
                          pyinc3.6 \
                          /usr/include/python3.6m
   ```

   Here, the last *slave* directive is is added to the original command run
   via script by above RPM.

1. Scalapack

   Running make test during compilation failes due to settings for the root
   using mpi. The following steps are a workaround:

   ```bash
   export OMPI_ALLOW_RUN_AS_ROOT=1 t
   export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
   make test
   ```
