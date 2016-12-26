Rem Build script for vectorization samples

ifort /nologo /c /QxSSSE3 /Qvec-report:3 novec_sample.f90
ifort /nologo /c /QxSSSE3 /Qvec-report:3 vec_sample.f90