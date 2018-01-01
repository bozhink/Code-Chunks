/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Hash.c          */

#include "hash.h"

/*  Algoritmo 10.44 */
void Inicializa(Tabela *T)
{
	int I;

	T -> N = 0;

	for(I = 0; I < Valor_Hash; ++I)
		T -> Bucket[I] = -1;

	for(I = 0; I < (Tamanho_Tabela - 1); ++I)
		T -> Tab[I].Next = I + 1;

	T -> Tab[Tamanho_Tabela - 1].Next = -1;

	T -> Livre = 0;

} /* Inicializa */

/*  Algoritmo 10.45 */
int Hash(char K[])
{
	int I, V;

	V = 0;

	for(I = 0; I < strlen(K); ++I)
		V = V + (K[I] * (I + 1));

	return V % Valor_Hash;

} /* Hash */

/*  Algoritmo 10.46 */
void Insere_Tab(Tabela *T, char K[], int Tag, int Colide, int *B)
{
	int Pos;

	if (T -> N >= Tamanho_Tabela) {
		printf("*** Overflow na Tabela\n");
		exit(1);
		}

	T -> N     = T -> N + 1;
	Pos        = T -> Livre;
	T -> Livre = T -> Tab[Pos].Next;

	strcpy(T -> Tab[Pos].Id,K);
	T -> Tab[Pos].Tag  = Tag;
	T -> Tab[Pos].Next = Colide;
	*B                 = Pos;

} /* Insere_Tab */

/*  Algoritmo 10.47 */
int Consulta(Tabela T, char K[])
{
	int P;

	P = T.Bucket[Hash(K)];

	while (P >= 0)
		if (!strcmp(T.Tab[P].Id,K))  
			return T.Tab[P].Tag;
		else
			P = T.Tab[P].Next;

	return 0;

} /* Consulta */

/*  Algoritmo 10.48 */
void Remove(Tabela *T, char K[], int *R)
{
	int P, L;

	*R = FALSE;

	P = T -> Bucket[Hash(K)];

	if (!strcmp(T -> Tab[P].Id,K)) {
		T -> Bucket[Hash(K)] = T -> Tab[P].Next;
		T -> Tab[P].Next     = T -> Livre;
		T -> Livre           = P;
		T -> N               = T -> N - 1;
		*R                   = TRUE;
		}
	else

		while(P >= 0)

			if (!strcmp(T -> Tab[P].Id,K)) {
				T -> Tab[L].Next = T -> Tab[P].Next;
				T -> Tab[P].Next = T -> Livre;
				T -> Livre       = P;
				T -> N           = T -> N - 1;
				*R               = TRUE;
				return;
				}
			else {
				L = P;
				P = T -> Tab[P].Next;
				}

} /* Remove */

/*  Algoritmo 10.49 */
void Insere(Tabela *T, char K[], int Tag)
{
	int P, Onde;

	Onde = Hash(K);

	if (T -> Bucket[Onde] < 0)
		Insere_Tab(T,K,Tag,-1,&(T -> Bucket[Onde]));

	else {
		P = T -> Bucket[Onde];
		while ( 1 )
			if (T -> Tab[P].Next < 0) {
				Insere_Tab(T
				          ,K
				          ,Tag
				          ,T -> Bucket[Onde]
				          ,&(T -> Bucket[Onde]));
				return;
				}
			else
				P = T -> Tab[P].Next;
		}

} /* Insere */

/*  Algoritmo 10.50 */
int Quantidade(Tabela T)
{
	return T.N;

} /* Quantidade */

/*  Algoritmo 10.51 */
void Imprime(Tabela T)
{
	int I, J;

	printf("Tabela com %d elementos:\n", T.N);

	for(I = 0; I < Valor_Hash; ++I) {
		J = T.Bucket[I];
		while (J >= 0) {
			printf("%3d ", J);
			printf("%-14s ", T.Tab[J].Id);
			printf("%4d ", T.Tab[J].Tag);
			printf("%d\n", T.Tab[J].Next);
			J = T.Tab[J].Next;
			}
		}

} /* Imprime */
