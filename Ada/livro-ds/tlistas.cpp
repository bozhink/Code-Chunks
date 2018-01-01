// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte TListaS.cpp 

#include "ListaSi2.h"

void main()
{
	ListaSimples Ls;
	char Retirado;	                                                      
	
	Ls.Insere_Esq('A');
	Ls.Insere_Esq('B');
	Ls.Insere_Esq('C');
	Ls.Exibe_Lista("Lista apos Insere_Esq A, B, C");
	Ls.Insere_Dir('D');
	Ls.Insere_Dir('E');
	Ls.Insere_Dir('F');
	Ls.Exibe_Lista("Lista apos Insere_Dir D, E, F");
	// Insere 'X' a direita do nó cujo campo de dado é 'A' 
	Ls.Insere_Dir_No(Ls.Consulta('A'),'X');
	Ls.Exibe_Lista("Lista apos Insere_Dir_Q(Consulta('A'),'X')");
	Ls.Retira_Esq(&Retirado);
	cout << Retirado << " estava no primeiro nodo da lista\n";
	Ls.Retira_Dir(&Retirado);
	cout << Retirado << " estava no ultimo nodo da lista\n";
	Ls.Exibe_Lista("Lista apos retirada do primeiro e ultimo nodos");
	Ls.Retira_No(Ls.Consulta('X'),&Retirado);
	cout << "O elemento retirado foi " << Retirado << '\n';
	Ls.Exibe_Lista("Lista depois de retirar o nodo que continha 'X'");
	Ls.Libera_Memoria();
}
