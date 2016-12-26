rem Build script for QWpaint sample

ifort /nologo /c /libs:qwin paintmod.f90
ifort /nologo /libs:qwin qwpaint.f90 paintmod.obj