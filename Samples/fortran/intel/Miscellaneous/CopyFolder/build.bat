rem Build script for CopyFolder sample

ifort /nologo /c Copy_Folder_mod.f90
ifort /nologo CopyFolder.f90 Copy_Folder_Mod.obj