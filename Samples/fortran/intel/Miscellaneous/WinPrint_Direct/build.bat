rem Build script for WinPrint_Direct sample

ifort /nologo /c WinPrint_Direct.f90
ifort /nologo Test_WinPrint_Direct.f90 WinPrint_Direct.obj