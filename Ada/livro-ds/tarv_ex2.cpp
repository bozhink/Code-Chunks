// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TArv_Ex2.cpp    

#include "arv_exp2.h"

void main()
{                                               
	Arvore_De_Expressao Arv;             
	
	Arv.Gera_Expressao("(4+5+6)*7+8*(1+2+3)");

	cout << "O valor de (4+5+6)*7+8*(1+2+3) e': " 
	     << Arv.Calcula(Arv.Raiz) << '\n';

} // TArv_Ex2
