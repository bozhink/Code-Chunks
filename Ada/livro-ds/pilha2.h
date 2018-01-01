// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Pilha2.h

#ifndef PILHA
#define PILHA

#include <iostream.h>

class Pilha
{
public:
	char V[10];
	int Sp;

	Pilha();  // Construtor

	void Push(char D);
	void Pop(char *R);
};

#endif
