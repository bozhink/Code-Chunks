// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte TArv_Bu2.cpp 

#include "Arv_Bu2.h"

void main()
{
	Arvore_Busca AB;

	AB.Insere('G');
	AB.Insere('O');
	AB.Insere('N');
	AB.Insere('P');
	AB.Insere('Z');
	AB.Insere('D');
	AB.Insere('B');
	AB.Insere('A');
	AB.Insere('C');
	AB.Insere('F');

	cout << "Caminhamento Pre_Fixado: ";
	AB.Pre_Fixado(AB.Le_Raiz());
	cout << '\n';

	cout << "Caminhamento Central: ";
	AB.Central(AB.Le_Raiz());
	cout << '\n';

	cout << "Caminhamento Pos_Fixado: ";
	AB.Pos_Fixado(AB.Le_Raiz());
	cout << '\n';

	AB.Remove(AB.Consulta('G'));

	cout << "Caminhamento Central depois da remocao de G: ";
	AB.Central(AB.Le_Raiz());
	cout << '\n';

} // main 



