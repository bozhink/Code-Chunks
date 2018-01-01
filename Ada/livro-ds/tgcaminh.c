/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TGCaminh.c      */

#include "GCaminha.h"

void main()
{
	Grafo (G1);

	Inicializa(G1);
	Conecta(G1,1,2);
	Conecta(G1,1,5);
	Conecta(G1,1,7);
	Conecta(G1,2,3);
	Conecta(G1,2,6);
	Conecta(G1,2,4);
	Conecta(G1,3,4);
	Conecta(G1,5,4);
	Conecta(G1,5,6);
	Conecta(G1,6,7);
	Conecta(G1,4,7);
	printf("Grafo com sete vertices:\n");
	Imprime(G1);
	Inicializa_Visitados(V);
	printf("\nDFS(G1,1) = ");
	DFS(G1,1);
	putchar('\n');
	printf("\nBFS(G1,1) = ");
	BFS(G1,1);
	putchar('\n');

} /* TGCaminh.c */
