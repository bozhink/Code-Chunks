/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TFlorest.c      */

#include "Floresta.h"

void main()
{
	Floresta F;
	long     K;

	F = Inicializa("ADISCO.DAT");

	Insere(F,"Fulano de Tal",1010);
	Insere(F,"Fulana de Tal",1020);
	Insere(F,"Ciclano de Tal",1030);
	Insere(F,"Beltrano",1040);
	Insere(F,"Pertrano",1050);

	Imprime(F);

	Fecha(F);

	F = Abre("ADISCO.DAT");

	if ((K = Consulta(F,"Ciclano de Tal")) >= 0L) 
		printf("Ciclano de Tal tem tag %ld\n", K);
	else
		printf("Nao encontrou Ciclano de Tal\n");

	if (Remove(F,"Ciclano de Tal") == 0) 
		printf("Ciclano de Tal foi removido\n");
	else
		printf("Nao removeu Ciclano de Tal\n");

	if ((K = Consulta(F,"Ciclano de Tal")) >= 0L) 
		printf("Ciclano de Tal tem tag %ld\n", K);
	else
		printf("Nao encontrou Ciclano de Tal\n");

	if (Fecha(F)) {
		printf("*** Nao pode fechar a floresta\n");
		exit(1);
		}

	if ((K = Squash("ADISCO.DAT")) != 0) {
		printf("*** Erro no Squash [%d]\n", K);
		exit(1);
		}

	F = Abre("ADISCO.DAT");

	Imprime(F);

	Fecha(F);
}