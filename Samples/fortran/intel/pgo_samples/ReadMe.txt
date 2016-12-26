Instructions for building and running the PGO Sample

This sample demonstrates the use of the Profile-Guided Optimization (PGO) feature
of the Intel compilers.  For details on the PGO feature, please refer to the
compiler documentation.

Using PGO is a multistep process:

1. Compile the application with /Qprof-gen specified.  This creates an instrumented
   executable.
2. Run the application using a reduced-size dataset that is representative of the
   actual workload. Each run will create a .dpi file with profile information.
3. Compile the application with /Qprof-use specified.  This will create an optimized
   executable.

If building from the command line:

ifort /Qprof-gen pgo_sample.f90
pgo_sample.exe
ifort /Qprof-use /Qopt-report:1 /Qopt-report-phase:pgo pgo_sample.f90

Note that the when the build is done with /Qprof-use, the compiler will comment that
_ADDERMOD has no .DYN information.  This is because _ADDERMOD is a null routine
generated for the module and it is never called.

If using Microsoft Visual Studio, a project with two configurations, prof_gen and
prof_use, has been provided.  Follow these steps:

1. Clean the solution (Build > Clean Solution)
2. Select the prof_gen configuration from the toolbar
3. Build the project
4. Run the application (Ctrl-F5)
5. Select the prof_use configuration. 
6. Build the project and examine the build output.  
   
