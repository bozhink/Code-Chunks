rem Build script for DynamicLoad sample

ifort /nologo /dll /libs:dll /exe:USERDLL.dll USERFUNC.f90
ifort /nologo /libs:dll DynamicLoad.f90
