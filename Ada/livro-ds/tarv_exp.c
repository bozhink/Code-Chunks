/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TArv_Exp.c       */

#include "arv_exp.h"

void main()
{                                               
	Elo Raiz;             
	
	Gera_Expressao("(4+5+6)*7+8*(1+2+3)", &Raiz);

	printf("O valor de (4+5+6)*7+8*(1+2+3) e': %d\n", Calcula(Raiz));

} /* TArv_Exp */
