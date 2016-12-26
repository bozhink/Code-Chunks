rem Build file for Temp sample

rc temp.rc
deftofd resource.h resource.fd

ifort /nologo  temp.f90 temp.res

