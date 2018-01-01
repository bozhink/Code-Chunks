// (C) 1999, Arthur Vargas lopes
// Arquivo fonte TDAFila.h

#ifndef FILA
#define FILA

#include <iostream.h>

class Fila
{
public:
	Fila();  // Construtor

	void Queue(char D);
	void DeQueue(char *R);
	int Tamanho();

private:    
	char Q[10];
	int Inicio;
	int Fim;
};

#endif
