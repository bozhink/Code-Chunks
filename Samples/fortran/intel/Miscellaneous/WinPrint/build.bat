rem Build script for WinPrint sample

ifort /nologo /c Fortran_WinPrint.f90
ifort /nologo forprint.f90 Fortran_WinPrint.obj