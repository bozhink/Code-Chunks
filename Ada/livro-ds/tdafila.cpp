// (C) 1999, Arthur Vargas lopes
// Arquivo fonte TDAFila.cpp

#include "TDAFila.h"


Fila::Fila() // Substitui procedimento de inicialização
{
	Inicio = 1;
	Fim    = 0;
}
	
void Fila::Queue(char D)
{
	if (sizeof(Q) == Fim)
		cout << "*** Overflow na fila ***" << '\n';
	else {
		Fim        += 1;
		Q[Fim - 1] = D;
		}
}

void Fila::DeQueue(char *R)
{
	if (Inicio > Fim) {
		cout << "*** Underflow na fila ***\n";
		*R = '?';
		}
	else
		*R = Q[Inicio++ - 1];
}

int Fila::Tamanho() 
{   
	if (Inicio > Fim)
		return 0;
	else
		return Fim - Inicio + 1;
}
	
