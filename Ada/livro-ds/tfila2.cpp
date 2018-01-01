// (C) 1999, Arthur Vargas lopes
// Arquivo fonte Tfila2.cpp

#include "TDAFila.h"

void main()
{
	Fila Fila_1, Fila_2;	// Declara e inicializa
					// duas filas
	char Estava_No_Topo;	// Armazena quem estava
				// no topo de uma fila
	int I;			// Auxiliar para loop

	Fila_1.Queue('A');	
	Fila_1.Queue('B');	
	Fila_1.Queue('C');	
	Fila_1.Queue('D');	

	Fila_2.Queue('A');	

	for(I = 1; Fila_1.Tamanho() > 0; ++I) { // Exibe conteüdo da fila 1
		Fila_1.DeQueue(&Estava_No_Topo);
		cout << I << ' ' << Estava_No_Topo << '\n';
		}

	for(I = 1; I <= 4; ++I) { // Exibe conteüdo da fila 2
		Fila_2.DeQueue(&Estava_No_Topo);
		cout << I << ' ' << Estava_No_Topo << '\n';
		}
} // main
