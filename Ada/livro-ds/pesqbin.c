/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte PesqBin.C       */

/* Utiliza as mesmas definições da pesq. seqüêncial */
#include "pesqseq.h"

/* Algoritmo 10.1 */
void Inicializa(Estrutura *T)
{
	T -> N = 0;

} /* Inicializa */

/* Algoritmo 10.6 */
void Insere(Estrutura *T, Key K)
{
	int I, J;

	if (T -> N == Max)  {
		printf("*** overflow na tabela.\n");
		exit(1);
		}

	/* Encontra a posição correta para inserir K */
	I = 0;
	while ((I < (T -> N - 1)) && (K > T -> V[I]))  
		I = I + 1;

	/* Move as chaves a direita de I - 1 uma posiçao
	   para a direita */
	for(J = T -> N - 1; J >= I; --J)
		T -> V[J+1] = T -> V[J];

	T -> N    = T -> N + 1;
	T -> V[I] = K;

} /* Insere */

/* Algoritmo 10.7 */
int Consulta(Estrutura *T, Key K)
{
	int L, H, M;
	
	L = 0;
	H = T -> N - 1;

	while (L <= H)  {

		M = (L + H) / 2;

		if (K == T -> V[M])
			return M + 1;
		else if (K < T -> V[M])
			H = M - 1;
		else
			L = M + 1;
		}

	return 0;

} /* Consulta */

/* Algoritmo 10.8 */
void Remove(Estrutura *T, int P)
{
	int I;

	if ((P < 1) || (P > T -> N))
		printf("*** nao pode remover na posicao %d\n", P);
	else {
		for(I = P - 1; I < (T -> N - 1); ++I)
			T -> V[I] = T -> V[I+1];

		T -> N = T -> N - 1;
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
