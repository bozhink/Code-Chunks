// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TETF.cpp         

#include "etf2.h"

void main()
{
	Etf X("3+4*(5-1)");

	cout << "O resultado de 3+4*(5-1) e': "<< X.E() << '\n';
}