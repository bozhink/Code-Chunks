/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GrafoS.c        */

#include "GrafoS.h"

/* algoritmo 6.1 */
void Inicializa(Grafo (G))
{
	int I, J;

	for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				G[I][J] = FALSE;
} /* inicializa */


/* algoritmo 6.2 */
void Conecta(Grafo (G), int I, int J)
{
	G[I-1][J-1] = TRUE;

} /* Conecta */


/* algoritmo 6.3 */
void Desconecta(Grafo (G), int I, int J)
{
	G[I-1][J-1] = FALSE;

} /* Desconecta */


/* algoritmo 6.4 */
int Adjacente(Grafo (G), int I, int J)
{
	return G[I-1][J-1];

} /* Adjacente */


/* algoritmo 6.5 */
void Imprime(Grafo (G))
{
	int I, J;

	putchar(' ');
	for(I = 0; I < N; ++I)  
		printf("%2d", I+1);
	putchar('\n');

	for(I = 0; I < N; ++I)  {
		printf("%d", I+1);
		for(J = 0; J < N; ++J)
			if (Adjacente(G,I+1,J+1))
				printf(" 1");
			else
				printf(" 0");
		putchar('\n');
		}
} /* Imprime */

