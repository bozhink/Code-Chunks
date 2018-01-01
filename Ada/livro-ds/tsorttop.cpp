// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte TSortTop.cpp

#include "SortTop2.h"

SortTopologico<unsigned char,9> D1;

void main()
{
	D1.D.Conecta(1,2);
	D1.D.Conecta(2,4);
	D1.D.Conecta(2,5);
	D1.D.Conecta(4,7);
	D1.D.Conecta(5,7);
	D1.D.Conecta(3,6);
	D1.D.Conecta(6,8);
	D1.D.Conecta(6,9);
	D1.D.Conecta(7,9);

	cout << "Dag D1:\n";
	D1.D.Imprime();
	cout << '\n';

	cout << "A ordenacao topologica inversa de D1 e': ";
	D1.Sort_Topologico();
	cout << '\n';

} // Testa_Ordenacao_Topologica 
