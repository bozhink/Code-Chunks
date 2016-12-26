rem Build script for Cube sample

rc menu.rc
deftofd resource.h resource.fd
ifort /nologo /c sharedat.f90
ifort /nologo /c cube.f90
ifort /nologo /winapp /exe:puzzle.exe main.f90 cube.obj sharedat.obj menu.res