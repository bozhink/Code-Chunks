rem Build script for MemoryStatus sample

ifort /nologo /c GetValueMod.f90
ifort /nologo MemoryStatus.f90 GetValueMod.obj