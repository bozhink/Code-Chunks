/* 
 * File:   Matrix.h
 * Author: bozhin
 *
 * Created on Петък, 2012, Май 11, 18:44
 */

#ifndef MATRIX_H
#define	MATRIX_H

class Matrix
{
private:
   int nx, ny;
   int *Array;
public:
   Matrix(int _nx, int _ny);
   void Set(int i, int j, int value);
   int Get(int i, int j);
};

#endif	/* MATRIX_H */

