// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Pilha.cpp

#include "pilha2.h"


// Implementa��o do algor�tmo 3.1 
Pilha::Pilha() // Substitui procedimento de inicializa��o
{
	Sp = -1;
}
	
// Implementa��o do algor�tmo 3.2 
void Pilha::Push(char D)
{
	if ((sizeof(V) / sizeof(char)) == Sp)
		cout << "*** Overflow na pilha ***" << '\n';
	else
		V[++Sp] = D;
}

// Implementa��o do algor�tmo 3.3 
void Pilha::Pop(char *R)
{
	if (Sp < 0) {
		cout << "*** Underflow na pilha ***\n";
		*R = '?';
		}
	else
		*R = V[Sp--];
}
