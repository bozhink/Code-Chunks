// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte TGrafoA2.cpp

#include "GrafoA2.h"

Grafo_Orientado<int,4> G1;

void main()
{
	G1.Conecta(1,2);
	G1.Conecta(1,3);
	G1.Conecta(4,4);
	cout << "Grafo com arcos {1,2}, {1,3}, {4,4}\n";
	G1.Imprime();
	G1.Conecta(3,2);
	G1.Desconecta(1,3);
	cout << "\n\nGrafo com arcos {1,2}, {3,2}, {4,4}\n";
	G1.Imprime();
}


