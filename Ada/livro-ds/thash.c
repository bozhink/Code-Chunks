/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte THash.c         */

#include "hash.h"

void main()
{
	Tabela     Ta;
	int        K;
	int        Re;

	Inicializa(&Ta);

	Insere(&Ta,"Fulano de Tal ",1010);
	Insere(&Ta,"Fulana de Tal ",1020);
	Insere(&Ta,"Ciclano de Tal",1030);
	Insere(&Ta,"Beltrano      ",1040);
	Insere(&Ta,"Pertrano      ",1050);
	Insere(&Ta,"Rulanx de Tal ",1060);
	Insere(&Ta,"Bulany de Tal ",1070);
	Insere(&Ta,"Ticlanx de Tal",1080);
	Insere(&Ta,"Keltranx      ",1090);
	Insere(&Ta,"Aertranx      ",1100);

	Imprime(Ta);

	K = Consulta(Ta,"Ciclano de Tal");
	if (K > 0)
		printf("Ciclano de Tal tem tag %d\n", K);
	else
		printf("Nao encontrou Ciclano de Tal\n");

	Remove(&Ta,"Ciclano de Tal",&Re);
	if (Re)
		printf("Ciclano de Tal foi removido\n");
	else
		printf("Nao removeu Ciclano de Tal\n");

	K = Consulta(Ta,"Ciclano de Tal");
	if (K > 0)
		printf("Ciclano de Tal tem tag %d\n", K);
	else
		printf("Nao encontrou Ciclano de Tal\n");

	Imprime(Ta);

} /* main */
