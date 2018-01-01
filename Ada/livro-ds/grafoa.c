/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GrafoA.c        */

#include "GrafoA.h"

/* algoritmo 6.6 */
void Inicializa(Grafo G)
{
	Tipo_Dado I;

	for(I = 0; I < N; ++I)
		G[I] = NULL;

} /* inicializa */


/* algoritmo 6.7 */
void Conecta(Grafo G, Tipo_Dado I, Tipo_Dado J)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(Nodo));
	if (P == NULL) {
		printf("*** Faltou memoria: Conecta.\n");
		exit(1); /* Termina a execução do programa */
		}

	P -> Dado = J;
	P -> Link = G[I-1];
	G[I-1]      = P;

} /* Conecta */


/* algoritmo 6.8 */
void Desconecta(Grafo G, Tipo_Dado I, Tipo_Dado J)
{
	Elo P, Q;
		
	P = G[I-1];
	while (P != NULL) 
		if (P -> Dado == J)
			break;
		else {
			Q = P;
			P = P -> Link;
			}

	if (P == NULL) {
			printf("Operacao_Invalida\n");
			exit(1);
			}

	if (G[I-1] == P)
		G[I-1] = P -> Link;
	else
		Q -> Link = P -> Link;

	free(P);

} /* Desconecta */


/* algoritmo 6.9 */
int Adjacente(Grafo G, Tipo_Dado I, Tipo_Dado J)
{
	Elo P;

	for(P = G[I-1]; P != NULL; P = P -> Link)
		if (P -> Dado == J)
			return 1;
		else
			P = P -> Link;
	return 0;

} /* Adjacente */


/* algoritmo 6.10 */
void Libera_Memoria(Grafo G)
{
	Elo P, Q;
	Tipo_Dado I;

	for(I = 0; I < N; ++I) {
		P    = G[I];
		G[I] = NULL;
		while (P != NULL) {
			Q = P;
			P = P -> Link;
			free(Q);
			}
		}	

} /* Libera_Memoria */


/* algoritmo 6.11 */
void Imprime(Grafo G)
{
	Tipo_Dado I;
	Elo P;

	for(I = 0; I < N; ++I) {
		printf("%d : ", I + 1);
		P = G[I];
		while (P != NULL) {
			printf("%d", P -> Dado);
			P = P -> Link;
			if (P != NULL)
				printf(", ");
			}
		if (G[I] == NULL)
			printf("nao tem adjacencia");
		printf(".\n");
		}
} /* Imprime */


