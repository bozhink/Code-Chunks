// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Tpilha2.cpp

#include "pilha2.h"

void main()
{
	Pilha Pilha_1, Pilha_2;	// Declara e inicializa
							// duas pilhas
	char Estava_No_Topo;	// Armazena quem estava
							// no topo de uma pilha
	int I;					// Auxiliar para loop

	Pilha_1.Push('A');	
	Pilha_1.Push('B');	
	Pilha_1.Push('C');	
	Pilha_1.Push('D');	

	Pilha_2.Push('A');	

	for(I = 1; I <= 4; ++I) { // Exibe conteüdo da pilha 1
		Pilha_1.Pop(&Estava_No_Topo);
		cout << (5 - I) << ' ' << Estava_No_Topo << '\n';
		}

	for(I = 1; I <= 4; ++I) { // Exibe conteüdo da pilha 2
		Pilha_2.Pop(&Estava_No_Topo);
		cout << (5 - I) << ' ' << Estava_No_Topo << '\n';
		}
} // main
