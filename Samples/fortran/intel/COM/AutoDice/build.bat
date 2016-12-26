rem Build script for AutoDice sample

ifort /nologo /c EXCEL.f90
ifort /nologo  /c ADOobjs.f90
ifort /nologo AutoDice.f90 ADOobjs.obj excel.obj