// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TGrafoV2.c

#include "GrafoV2.h"

Grafo_Valorado<int,7,99> G1;

void main() 
{
	int X;

	G1.Conecta(1,2,1);
	G1.Conecta(1,5,1);
	G1.Conecta(1,7,9);
	G1.Conecta(2,3,1);
	G1.Conecta(2,4,4);
	G1.Conecta(2,6,5);
	G1.Conecta(3,4,2);
	G1.Conecta(4,7,3);
	G1.Conecta(5,4,10);
	G1.Conecta(5,6,2);
	G1.Conecta(6,3,8);
	G1.Conecta(6,7,3);
	G1.Conecta(7,2,6);

	cout << "Grafo com sete vertices:\n";
	G1.Imprime(G1.G);
	cout << '\n';

	cout << "Menores custos:\n";
	G1.Menores_Custos();
	G1.Imprime(G1.C);
	cout << '\n';

	cout << "Matriz de caminhos:\n";
	G1.Gera_Caminhos();
	G1.Imprime(G1.P);
	cout << '\n';

	G1.Menor_Caminho(1,7);
	G1.Menor_Caminho(1,4);
	G1.Menor_Caminho(4,6);

	cout << '\n';
	G1.Gera_Conectividade();
	cout << "Matriz de conectividade:\n";
	G1.Imprime(G1.Cd);

	cout << "\n\nExentricidades de G1:\n";
	X = G1.Centro();
	cout << "O centro de G1 e': " << X << '\n';

} // Testa_Grafo_Valorado 