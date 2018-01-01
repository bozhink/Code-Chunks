/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TArv_Bus.c      */

#include "Arv_Busc.h"

void main()
{
	Elo	Raiz;

	Inicializa(&Raiz);

	Insere(&Raiz, 'G');
	Insere(&Raiz, 'O');
	Insere(&Raiz, 'N');
	Insere(&Raiz, 'P');
	Insere(&Raiz, 'Z');
	Insere(&Raiz, 'D');
	Insere(&Raiz, 'B');
	Insere(&Raiz, 'A');
	Insere(&Raiz, 'C');
	Insere(&Raiz, 'F');

	printf("Caminhamento Pre_Fixado: ");
	Pre_Fixado(Raiz);
	putchar('\n');

	printf("Caminhamento Central: ");
	Central(Raiz);
	putchar('\n');

	printf("Caminhamento Pos_Fixado: ");
	Pos_Fixado(Raiz);
	putchar('\n');

	Remove(&Raiz,Consulta(Raiz,'G'));

	printf("Caminhamento Central depois da remocao de G: ");
	Central(Raiz);
	putchar('\n');

} /* main */

