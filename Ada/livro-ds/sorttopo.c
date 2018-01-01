/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte SortTopo.c      */


/* Alterar o header GrafoDS.h associando 9 a N */

#include "SortTopo.H"


/* Sub-algoritmo 6.25.1 */
void Sort(Grafo (D), int I, unsigned char V[])
{
	int J;

	V[I] = TRUE;

	for(J = 0; J < N; ++J)
		if (Adjacente(D,I+1,J+1))
			if (!V[J]) 
				Sort(D,J,V);

	printf("%3d", I+1);

} /* Sort */


/* Algoritmo 6.25 */
void Sort_Topologico(Grafo (D))
{
	int           I;
	unsigned char V[N];

	/* Inicializa vetor de visitados */
	for(I = 0; I < N; ++I)
		V[I] = FALSE;

	for(I = 0; I < N; ++I)
		if (!V[I]) 
			Sort(D,I,V);

} /* Sort_Topologico */