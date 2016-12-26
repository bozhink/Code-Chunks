rem Build script for Calendar sample

ifort /nologo /c /libs:qwin calnmod.f90
ifort /nologo /libs:qwin calendar.f90 calnmod.obj