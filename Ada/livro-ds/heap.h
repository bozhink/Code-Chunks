/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Heap.h          */

#ifndef HEAP
#define HEAP

#include <stdio.h>
#include <process.h>

#define N         12
#define MValor    99
#define Tipo_Dado int

typedef struct {
	Tipo_Dado V[N+1];
	int Q;
	} Heap;
		
void Inicializa(Heap *H);
void Insere(Heap *H, Tipo_Dado Va);
Tipo_Dado Remove(Heap *H);
void Imprime(Heap *H, char Msg[]);

#endif