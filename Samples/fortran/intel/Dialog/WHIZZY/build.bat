rem Build file for Whizzy sample

rc whizzy.rc
deftofd whizzy.h whizzy.fd

ifort /nologo  /winapp whizzy.f90 whizzy.res

