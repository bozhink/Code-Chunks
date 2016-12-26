rem Build script for C_Calls_Fortran sample

rem if using the Platform SDK on Intel(R) 64 or IA-64 architectures need to add a library
set COOKIE_LIB=
if "%MSVCVer%"=="Win64" set COOKIE_LIB=bufferoverflowu.lib

rem Non-DLL

ifort /nologo /c fsub.f90
cl  /nologo /Feuselib.exe /D_CRT_SECURE_NO_DEPRECATE cmain.cpp fsub.obj %COOKIE_LIB%

rem DLL

ifort /nologo /dll fsub.f90
cl /nologo /Feusedll.exe /DUSE_DLL /D_CRT_SECURE_NO_DEPRECATE cmain.cpp fsub.lib %COOKIE_LIB%