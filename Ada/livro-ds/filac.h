/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte FilaC.h         */

#ifndef FILAC
#define FILAC 

#include <stdio.h>

#define Max 10   /* Define o número máximo de elementos da Fila */

/* Define o tipo Fila circular  */
typedef struct {
	char Q[Max];
	int Inicio;
	int Fim;
	int Tamanho;
	} Fila;

void Inicializa(Fila *F);
void Queue(Fila *F, char D);
void DeQueue(Fila *Fm, char *R);

#endif
