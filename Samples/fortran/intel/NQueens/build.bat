rem Build script for NQueens sample

ifort /nologo          Nqueens-Serial\nq-serial.f90
ifort /nologo /Qopenmp Nqueens-OpenMP\nq-openmp.f90
ifort /nologo          Nqueens-BtTree\nq-bttree.f90
