rem Build script for DLL_Shared_Data sample

ifort /nologo /dll shared_globals.f90 /link /section:.data,RWS
ifort /nologo /libs:dll main.f90 shared_globals.lib
