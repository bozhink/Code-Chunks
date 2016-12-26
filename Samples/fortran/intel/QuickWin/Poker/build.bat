rem Build file for Poker sample

Rc /l 0x0409 /fo Poker.res Poker.rc
deftofd resource.h resource.fd

ifort /nologo /libs:qwin /c  Descript.f90
ifort /nologo /libs:qwin /c  Bitmap.f90
ifort /nologo /libs:qwin /c  Cards.f90
ifort /nologo /libs:qwin /c  Button.f90
ifort /nologo /libs:qwin /c  Misc.f90
ifort /nologo /libs:qwin /c  Scoring.f90
ifort /nologo /libs:qwin /c  Registry.f90
ifort /nologo /libs:qwin /c  Subclass.f90
ifort /nologo /libs:qwin /c  Poker.f90

ifort /nologo /libs:qwin poker.obj descript.obj bitmap.obj cards.obj button.obj misc.obj scoring.obj registry.obj subclass.obj poker.res
