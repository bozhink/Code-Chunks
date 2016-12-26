/* 
 * File:   Matrix.cpp
 * Author: bozhin
 * 
 * Created on Петък, 2012, Май 11, 18:44
 */

#include "Matrix.h"

Matrix::Matrix(int _nx, int _ny)
{
    nx = _nx;
    ny = _ny;
    Array = new int[_nx*_ny];
}

void Matrix::Set(int i, int j, int value)
{
    Array[i*nx+j] = value;
}

int Matrix::Get(int i, int j)
{
      return Array[i*nx+j];
}
