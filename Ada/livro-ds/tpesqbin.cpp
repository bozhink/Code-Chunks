// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TPesqBin.cpp    

#include "pesqbin2.h"

PesqBin<int,10> Tab;

void main()
{
	Tab.Insere(5);
	Tab.Insere(1);
	Tab.Insere(4);
	Tab.Insere(-1);
	Tab.Insere(2);

	Tab.Imprime("Tab apos a insercao de 5,1,4,-1,2: ");

	cout << "Tab.Consulta(4) e' igual a " << Tab.Consulta(4) << '\n';

	cout << "Tab.Consulta(3) e' igual a " << Tab.Consulta(3) << '\n';

	Tab.Remove(3);

	Tab.Imprime("Tab apos a remocao da terceira chave: ");

} // main 