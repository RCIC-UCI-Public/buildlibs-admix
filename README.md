# buildlibs-admix
Various generic libraries that may need updated compilers to build

1. Scalapack

   Running make test during compilation failes due to settings for the root
   using mpi. The following steps are a workaround: 
   
   ```bash
   export OMPI_ALLOW_RUN_AS_ROOT=1 t
   export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
   make test
   ```
