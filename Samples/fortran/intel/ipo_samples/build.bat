rem Build script for ipo_samples sample

ifort /c /nologo /Qipo ipo_sample_init.f90
ifort /c /nologo /Qipo ipo_sample_sum.f90
ifort /nologo /Qipo ipo_sample_main.f90 ipo_sample_init.obj ipo_sample_sum.obj