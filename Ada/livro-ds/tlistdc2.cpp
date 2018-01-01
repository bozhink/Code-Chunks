// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TListDC2.CPP

#include "ListaDC2.h"

void main()
{
	ListaDuplaCircular Ld;
	char Retirado;	                                                      
	
	Ld.Insere_Esq('A');
	Ld.Insere_Esq('B');
	Ld.Insere_Esq('C');
	Ld.Exibe_Lista("Lista apos Insere_Esq A, B, C");
	Ld.Insere_Dir('D');
	Ld.Insere_Dir('E');
	Ld.Insere_Dir('F');
	Ld.Exibe_Lista("Lista apos Insere_Dir D, E, F");
	// Insere 'X' a direita do nó cujo campo de dado é 'A' 
	Ld.Insere_Dir_No(Ld.Consulta('A'),'X');
	Ld.Exibe_Lista("Lista apos Insere_Dir_Q(Ld.Consulta('A'),'X')");
	Ld.Retira_Esq(&Retirado);
	cout << Retirado << " estava no primeiro nodo da lista\n";
	Ld.Retira_Dir(&Retirado);
	cout << Retirado << " estava no ultimo nodo da lista\n";
	Ld.Exibe_Lista("Lista apos retirada do primeiro e ultimo nodos");
	Ld.Retira_No(Ld.Consulta('X'),&Retirado);
	cout << "O elemento retirado foi " << Retirado << '\n';
	Ld.Exibe_Lista("Lista depois de retirar o nodo que continha 'X'");
	Ld.Libera_Memoria();
}

