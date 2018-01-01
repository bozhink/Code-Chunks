/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte PesqSeq.C       */

#include "pesqseq.h"

/* Algoritmo 10.1 */
void Inicializa(Estrutura *T)
{
	T -> N = 0;

} /* Inicializa */

/* Algoritmo 10.2 */
void Insere(Estrutura *T, Key K)
{
	if (T -> N == Max)  {
		printf("*** overflow na tabela.\n");
		exit(1);
		}

	T -> V[T -> N] = K;
	T -> N         = T -> N + 1;

} /* Insere */

/* Algoritmo 10.3 */
int Consulta(Estrutura *T, Key K)
{
	int I;
	
	for(I = 0; I < T -> N; ++I)
		if (T -> V[I] == K)
			return I + 1;

	return 0;

} /* Consulta */

/* Algoritmo 10.4 */
void Remove(Estrutura *T, int P)
{
	if ((P < 1) || (P > T -> N))
		printf("*** nao pode remover na posicao %d\n", P);
	else {
		T -> V[P-1] = T -> V[T -> N - 1];
		T -> N      = T -> N - 1;
		}

} /* Remove */

/* Algoritmo 10.5 */
void Imprime(char *Msg, Estrutura *T)
{
	int I;

	printf("%s", Msg);

	for(I = 0; I < T -> N; ++I)  {
		printf("%d", T -> V[I]);
		if ((I + 1) != T -> N)
			putchar(',');
		}

	putchar('\n');

} /* Imprime */
