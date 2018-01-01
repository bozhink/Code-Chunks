/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GrafoV.c        */

#include "GrafoV.h"


/* algoritmo 6.14 */
void Inicializa(Grafo (G))
{
	int I, J;

	for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				G[I][J] = (Tipo_Dado) 0;
} /* inicializa */


/* algoritmo 6.15 */
void Conecta(Grafo (G), int I, int J, Tipo_Dado V)
{
	G[I-1][J-1] = V;

} /* Conecta */


/* algoritmo 6.16 */
void Desconecta(Grafo (G), int I, int J)
{
	G[I-1][J-1] = (Tipo_Dado) 0;

} /* Desconecta */


/* algoritmo 6.17 */
Tipo_Dado Adjacente(Grafo (G), int I, int J)
{
	return G[I-1][J-1];

} /* Adjacente */


/* algoritmo 6.18 */
void Imprime(Grafo (G))
{
	int I, J;

	putchar(' ');
	for(I = 0; I < N; ++I)  
		printf("%3d", I+1);
	putchar('\n');

	for(I = 0; I < N; ++I)  {
		printf("%d", I+1);
		for(J = 0; J < N; ++J)
			printf("%3d", Adjacente(G,I+1,J+1));
		putchar('\n');
		}
} /* Imprime */


/* algoritmo 6.19 */
void Menores_Custos(Grafo (G), Grafo (C))
{
	int I, J, K;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			if (G[I][J] != (Tipo_Dado) 0)
				C[I][J] = G[I][J];
			else
				C[I][J] = MValor;

	for(I = 0; I < N; ++I)
		C[I][I] = (Tipo_Dado)0;

	for(K = 0; K < N; ++K)
		for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				if ((C[I][K] + C[K][J]) < C[I][J])
					 C[I][J] = C[I][K] + C[K][J];

} /* Menores_Custos */


/* algoritmo 6.20 */
void Gera_Caminhos(Grafo (G), Grafo (P))
{
	Grafo (C);
	int I, J, K;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)  {
			P[I][J] = (Tipo_Dado)0;
			if (G[I][J] != (Tipo_Dado) 0)
				C[I][J] = G[I][J];
			else
				C[I][J] = MValor;
			}

	for(I = 0; I < N; ++I)
		C[I][I] = (Tipo_Dado)0;

	for(K = 0; K < N; ++K)
		for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				if ((C[I][K] + C[K][J]) < C[I][J])  {
					C[I][J] = C[I][K] + C[K][J];
					P[I][J] = K + 1;
					}

} /* Gera_Caminhos */



/* algoritmo 6.21 */
void Exibe_Caminho(Grafo (P), int I, int J, int F)
{
	Tipo_Dado K;

	if (F == 1) /* Exibe o vértice inicial */
		printf("%3d", I);

	K = P[I-1][J-1];

	if (K != 0) {
		Exibe_Caminho(P,I,K,F+1);
		printf("%3d", K);
		Exibe_Caminho(P,K,J,F+1);
		}

	if (F == 1) /* Exibe o vértice final */
		printf("%3d\n", J);


} /* Exibe_Caminho */



/* algoritmo 6.22 */
void Menor_Caminho(Grafo (G), int I, int J)
{
	Grafo (P);

	printf("O menor caminho entre %d e %d e': ", I, J);

	Gera_Caminhos(G,P);

	Exibe_Caminho(P,I,J,1);

} /* Menor_Caminho */



/* algoritmo 6.23 */
void Gera_Conectividade(Grafo (G), Grafo (Cd))
{
	int I, J, K;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			if (G[I][J] > ((Tipo_Dado)0))
				Cd[I][J] = (Tipo_Dado)1;
			else
				Cd[I][J] = (Tipo_Dado)0;

	for(K = 0; K < N; ++K)
		for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				if (Cd[I][J] == ((Tipo_Dado)0)) 
					if ((Cd[I][K] > ((Tipo_Dado)0)) &&
					    (Cd[K][J] > ((Tipo_Dado)0))) 
						Cd[I][J] = (Tipo_Dado)1;

} /* Gera_Conectividade */



/* algoritmo 6.24 */
Tipo_Dado Centro(Grafo (G))
{
	Grafo (C);

	/* declara o vetor de exentricidades */
	Tipo_Dado E[N];
	int       I, J;
	Tipo_Dado X;

	Menores_Custos(G,C);

	for(I = 0; I < N; ++I)
		E[I] = (Tipo_Dado) 0;

	for(J = 0; J < N; ++J)
		for(I = 0; I < N; ++I)
			if (C[I][J] > E[J])
				E[J] = C[I][J];

	X = MValor;

	for(I = 0; I < N; ++I) {
		printf("          E(%d) = %d\n",I+1,E[I]);
		if (E[I] < X)
			X = E[I];
		}

	return X;

} /* Centro */