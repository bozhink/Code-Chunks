Rem Build script for pgo_samples sample

ifort /nologo /Qprof-gen pgo_sample.f90
pgo_sample.exe
ifort /nologo /Qprof-use /Qopt-report:1 /Qopt-report-phase:pgo pgo_sample.f90