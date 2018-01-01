/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TAPosfix.c */

#include "APosfix.h"

void main()
{
	char *Exp = "45+6+7*812+3+*+";
	int  Resultado;

	Avalia_Posfix(Exp,&Resultado);
	printf("O resultado da avaliacao de '%s' e': %d\n"
	      , Exp, Resultado);
}
