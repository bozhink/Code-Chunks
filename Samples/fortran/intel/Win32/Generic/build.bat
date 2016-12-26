rem Build script for Generic sample

deftofd resource.h resource.fd
rc generic.rc
ifort /nologo /c genericglobals.f90
ifort /nologo /winapp generic.f90 genericglobals.obj generic.res