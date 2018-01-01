// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte TGFilaC.cpp

#include "GFilaC.h"

FilaC<char,10> Fila_1; // Declara e inicializa
FilaC<char,10> Fila_2; // duas filas circulares

void main()
{
	char Estava_No_Topo;	// Armazena quem estava
							// no topo de uma fila circular
	int I;					// Auxiliar para loop

	Fila_1.Queue('A');	
	Fila_1.Queue('B');	
	Fila_1.Queue('C');	
	Fila_1.Queue('D');	

	Fila_2.Queue('A');	

	// Exibe conteúdo da fila 1
	for(I = 1; Fila_1.Tamanho() > 0; ++I) { 
		Fila_1.DeQueue(&Estava_No_Topo);
		cout << I << ' ' << Estava_No_Topo << '\n';
		}

	// Exibe conteúdo da fila 2
	for(I = 1; Fila_2.Tamanho() > 0; ++I) { 
		Fila_2.DeQueue(&Estava_No_Topo);
		cout << I << ' ' << Estava_No_Topo << '\n';
		}
} // main
