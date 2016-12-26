rem Build script for AnimateGL sample

ifort /nologo /c GLUtilsMod.f90
ifort /nologo /winapp AnimateGL.f90 GLUtilsMod.obj