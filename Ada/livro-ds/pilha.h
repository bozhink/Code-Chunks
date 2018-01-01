/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte pilha.h         */

#ifndef PILHA
#define PILHA
#include <stdio.h>
#define Max 10   /* Define o número máximo de elementos da pilha */

/* Define o tipo Pilha */
typedef struct {
	char V[Max];
	int Sp;
	} Pilha;

void Inicializa(Pilha *P);
void Push(Pilha *p, char D);
void Pop(Pilha *p, char *R);

#endif

