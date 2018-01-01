/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Fila.h          */

#include <stdio.h>

#define Max 10   /* Define o número máximo de elementos da Fila */

/* Define o tipo Fila */
typedef struct {
	char Q[Max];
	int Inicio;
	int Fim;
	} Fila;

void Inicializa(Fila *F);
void Queue(Fila *F, char D);
void DeQueue(Fila *Fm, char *R);

#endif
