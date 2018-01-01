/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GCaminha.c      */

#include "GCaminha.h"

/* Algor¡tmo 4.4 */
void Inicializa_Fila(Fila *F)
{
	F -> Inicio  = 1;
	F -> Fim     = 0;
	F -> Tamanho = 0;
} /* Inicializa */

/* Algor¡tmo 4.5 */
void Queue(Fila *F, int D)  
{
	if (F -> Tamanho == Max) {/* Verifica overflow de fila circular */
		printf("*** Overflow na Fila ***\n");
		exit(1);
		}
	else {
		F -> Fim             = F -> Fim % Max + 1;
		F -> Q[F -> Fim - 1] = D;
		F -> Tamanho        += 1;
		}
} /* Queue */

/* Algor¡tmo 4.6 */
void DeQueue(Fila *F, int *R)
{
	if (F -> Tamanho == 0) { /* Verifica underflow de fila circular */
		printf("*** Underflow na Fila ***\n");
		exit(1);
		}
	else  {
		*R            = F -> Q[F -> Inicio - 1];
		F -> Inicio   = F -> Inicio % Max + 1;
		F -> Tamanho -= 1;
		}
} /* DeQueue */
 

/* Algoritmo 6.12 */
void DFS(Grafo (G), int I)
{
	int J;

	V[I-1] = TRUE;
	printf("%3d", I);
	for(J = 0; J < N; ++J)
		if (Adjacente(G,I,J+1))
			if (!V[J])
				DFS(G,J+1);
} /* DFS */


/* Algoritmo 6.13 */
void BFS(Grafo (G), int I)
{
	Fila F;
	int  X;
	int  J;

	/* Inicializa vetor de visitados */
	Inicializa_Visitados(V);

	Inicializa_Fila(&F);

	printf("%3d", I);
	V[I-1] = TRUE;
	Queue(&F,I);
	while(F.Tamanho > 0) {
		DeQueue(&F,&X);
		for(J = 0; J < N; ++J)
			if (Adjacente(G,X,J+1))
				if (!V[J]) {
					printf("%3d", J+1);
					V[J] = TRUE;
					Queue(&F,J+1);
					}
		}
} /* BFS */


void Inicializa_Visitados(int V[])
{
	int I;

	for(I = 0; I < N; ++I)
		V[I] = FALSE;

} /* Inicializa_Visitados */
