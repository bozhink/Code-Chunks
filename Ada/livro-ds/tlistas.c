/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TListaS.C       */

#include "ListaSim.h"

void main()
{
	Elo Head;
	char Retirado;	                                                      
	
	Inicializa(&Head);
	Insere_Esq(&Head,'A');
	Insere_Esq(&Head,'B');
	Insere_Esq(&Head,'C');
	Exibe_Lista(Head,"Lista apos Insere_Esq A, B, C");
	Insere_Dir(&Head,'D');
	Insere_Dir(&Head,'E');
	Insere_Dir(&Head,'F');
	Exibe_Lista(Head,"Lista apos Insere_Dir D, E, F");
	/* Insere 'X' a direita do nó cujo campo de dado é 'A' */
	Insere_Dir_No(Consulta(Head,'A'),'X');
	Exibe_Lista(Head,"Lista apos Insere_Dir_Q(Consulta(Head,'A'),'X')");
	Retira_Esq(&Head,&Retirado);
	printf("%c estava no primeiro nodo da lista\n", Retirado);
	Retira_Dir(&Head,&Retirado);
	printf("%c estava no ultimo nodo da lista\n", Retirado);
	Exibe_Lista(Head,"Lista apos retirada do primeiro e ultimo nodos");
	Retira_No(&Head,Consulta(Head,'X'),&Retirado);
	printf("O elemento retirado foi %c\n", Retirado);
	Exibe_Lista(Head,"Lista depois de retirar o nodo que continha 'X'");
}
