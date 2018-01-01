// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Pilha.cpp

#include "pilha2.h"


// Implementação do algorítmo 3.1 
Pilha::Pilha() // Substitui procedimento de inicialização
{
	Sp = -1;
}
	
// Implementação do algorítmo 3.2 
void Pilha::Push(char D)
{
	if ((sizeof(V) / sizeof(char)) == Sp)
		cout << "*** Overflow na pilha ***" << '\n';
	else
		V[++Sp] = D;
}

// Implementação do algorítmo 3.3 
void Pilha::Pop(char *R)
{
	if (Sp < 0) {
		cout << "*** Underflow na pilha ***\n";
		*R = '?';
		}
	else
		*R = V[Sp--];
}
