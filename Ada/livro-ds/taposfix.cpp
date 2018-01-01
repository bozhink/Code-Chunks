// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TAPosfix.cpp

#include "APosfix2.h"


APosfix<int,10> P;

void main()
{
	char *Exp = "45+6+7*812+3+*+";
	int  Resultado;

	P.Avalia_Posfix(Exp,&Resultado);
	cout << "O resultado da avaliacao de '" << Exp << "' e': "
	     << Resultado <<'\n';
}
		
