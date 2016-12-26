rem Build script for Scigraph sample

rem Build library

ifort /nologo /c /libdir:noauto sgdata.f90
ifort /nologo /c /libdir:noauto sglowlvl.f90
ifort /nologo /c /libdir:noauto sgdraw.f90
ifort /nologo /c /libdir:noauto sgplot.f90
ifort /nologo /c /libdir:noauto sgadmin.f90
ifort /nologo /c /libdir:noauto scigraph.f90
lib /nologo /out:scigraph.lib sgdata.obj sglowlvl.obj sgdraw.obj sgplot.obj sgadmin.obj scigraph.obj

rem build demo

ifort /nologo /libs:qwin sgdemo.f90 scigraph.lib
