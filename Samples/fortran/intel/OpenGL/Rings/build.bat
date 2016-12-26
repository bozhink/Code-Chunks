rem Build script for Rings sample

ifort /nologo /c RingsMod.f90
ifort /nologo /c GLUtilsMod.f90
ifort /nologo /winapp Rings.f90 RingsMod.obj GLUtilsMod.obj