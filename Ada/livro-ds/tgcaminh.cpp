// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TGCaminh.cpp      

#include "GCaminh2.h"

Caminhamentos<int,7> G1;

void main()
{
	G1.G.Conecta(1,2);
	G1.G.Conecta(1,5);
	G1.G.Conecta(1,7);
	G1.G.Conecta(2,3);
	G1.G.Conecta(2,6);
	G1.G.Conecta(2,4);
	G1.G.Conecta(3,4);
	G1.G.Conecta(5,4);
	G1.G.Conecta(5,6);
	G1.G.Conecta(6,7);
	G1.G.Conecta(4,7);
	cout << "Grafo com sete vertices:\n";
	G1.G.Imprime();
	G1.Inicializa_Visitados();
	cout << "\nDFS(G1,1) = ";
	G1.DFS(1);
	cout << '\n';
	cout << "\nBFS(G1,1) = ";
	G1.BFS(1);
	cout << '\n';

} // main
