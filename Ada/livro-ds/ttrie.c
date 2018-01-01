/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TTrie.c         */

#include "Trie.h"

void main()
{
	Elo Raiz;
	int K;

	Raiz = Inicializa();

	Insere(Raiz,"Fulano de Tal",1010);
	Insere(Raiz,"Fulana de Tal",1020);
	Insere(Raiz,"Ciclano de Tal",1030);
	Insere(Raiz,"Beltrano",1040);
	Insere(Raiz,"Pertrano",1050);
	Insere(Raiz,"Rulanx de Tal",1060);
	Insere(Raiz,"Bulany de Tal",1070);
	Insere(Raiz,"Ticlanx de Tal",1080);
	Insere(Raiz,"Keltranx",1090);
	Insere(Raiz,"Aertranx",1100);

	Imprime(Raiz,"");

	K = Consulta(Raiz,"Ciclano de Tal");
	if (K > 0)
		printf("Ciclano de Tal tem tag %d\n", K);
	else
		printf("Nao encontrou Ciclano de Tal\n");

	if (Remove(Raiz,"Ciclano de Tal"))
		printf("Ciclano de Tal foi removido\n");
	else
		printf("Nao removeu Ciclano de Tal\n");

	Imprime(Raiz,"");

} /* main */