/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TGrafoS.c       */

#include "GrafoS.h"

void main()
{
	Grafo (G1);

	Inicializa(G1);
	Conecta(G1,1,2);
	Conecta(G1,1,3);
	Conecta(G1,4,4);
	printf("Grafo com arcos {1,2}, {1,3}, {4,4}\n");
	Imprime(G1);
	Conecta(G1,3,2);
	Desconecta(G1,1,3);
	printf("\n\nGrafo com arcos {1,2}, {3,2}, {4,4}\n");
	Imprime(G1);
} 
