rem Build script for Fxplorer sample

rc fxplorer.res
deftofd resource.h resource.fd
ifort /nologo /c fxplorerglobals.f90
ifort /nologo /c browser.f90
ifort /nologo /winapp fxplorer.f90 fxplorerglobals.obj browser.obj fxplorer.res