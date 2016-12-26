rem Build script for Angle sample

rc angle.rc
ifort /nologo /c anginc.f90
ifort /nologo /winapp angle.f90 anginc.obj angle.res