/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TETF.c          */

#include "etf.h"

void main()
{
	Inicializa("3+4*(5-1)");
	printf("O resultado de 3+4*(5-1) e': %d\n", E());
}