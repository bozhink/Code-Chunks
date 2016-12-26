rem Build script for Fortran_Calls_C sample

cl /nologo /c /D_CRT_SECURE_NO_DEPRECATE clib\csub.cpp
ifort /nologo fmain\fmain.f90 csub.obj