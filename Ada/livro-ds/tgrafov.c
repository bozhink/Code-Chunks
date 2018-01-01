/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TGrafoV.c       */

#include "GrafoV.h"


void main() 
{
	Grafo (G1);
	Grafo (C1);
	Grafo (P1);
	Grafo (Cd1);
	Tipo_Dado X;

	Inicializa(G1);

	Conecta(G1,1,2,1);
	Conecta(G1,1,5,1);
	Conecta(G1,1,7,9);
	Conecta(G1,2,3,1);
	Conecta(G1,2,4,4);
	Conecta(G1,2,6,5);
	Conecta(G1,3,4,2);
	Conecta(G1,4,7,3);
	Conecta(G1,5,4,10);
	Conecta(G1,5,6,2);
	Conecta(G1,6,3,8);
	Conecta(G1,6,7,3);
	Conecta(G1,7,2,6);

	printf("Grafo com sete vertices:\n");
	Imprime(G1);
	putchar('\n');

	printf("Menores custos:\n");
	Menores_Custos(G1,C1);
	Imprime(C1);
	putchar('\n');

	printf("Matriz de caminhos:\n");
	Gera_Caminhos(G1,P1);
	Imprime(P1);
	putchar('\n');

	Menor_Caminho(G1,1,7);
	Menor_Caminho(G1,1,4);
	Menor_Caminho(G1,4,6);

	putchar('\n');
	Gera_Conectividade(G1,Cd1);
	printf("Matriz de conectividade:\n");
	Imprime(Cd1);

	printf("\n\nExentricidades de G1:\n");
	X = Centro(G1);
	printf("O centro de G1 e': %d\n", X);

} /* Testa_Grafo_Valorado */