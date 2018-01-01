/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GCaminha.h      */

#ifndef G_CAMINHAMENTOS
#define G_CAMINHAMENTOS

#include <stdio.h>
#include <process.h>	
#include <malloc.h>

/* Alterar o header "GrafoDS." com o valor correto para N
   e o tipo de dado do grafo                              */

#include "grafos.h"

#define Max  N

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

/* Define o tipo Fila circular  */
typedef struct {
	int Q[N];
	int Inicio;
	int Fim;
	int Tamanho;
	} Fila;

int V[N];

void Inicializa_Fila(Fila *F);
void Queue(Fila *F, int D);
void DeQueue(Fila *F, int *R);
void Inicializa_Visitados(int V[]);
void DFS(Grafo (G), int I);
void BFS(Grafo (G), int I);

#endif
