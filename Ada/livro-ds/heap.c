/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Heap.c          */

#include "Heap.H"

/* Algoritmo 7.5 */
void Inicializa(Heap *H)
{
	H -> Q    = 0;
	H -> V[0] = MValor;

} /* Inicializa */


/* Algoritmo 7.6 */
void Insere(Heap *H, Tipo_Dado Va)
{
	int I;

	if (H -> Q == N)  {
		printf("*** Heap overflow.\n");
		exit(1);
		}

	H -> Q         = H -> Q + 1;
	H -> V[H -> Q] = Va;
	I              = H -> Q;
	while(H -> V[I / 2] <= Va) {
		H -> V[I] = H -> V[I / 2];
		I         = I / 2;
		}
	H -> V[I] = Va;

} /* Insere */


/* Algoritmo 7.7 */
Tipo_Dado Remove(Heap *H)
{
	int J, K;
	Tipo_Dado Va, X;

	if (H -> Q == 0)  {
		printf("*** Heap underflow.\n");
		exit(1);
		}

	X         = H -> V[1];
	H -> V[1] = H -> V[H -> Q];
	H -> Q    = H -> Q - 1;
	Va        = H -> V[1];
	K         = 1;
	while(K <= (H -> Q / 2)) {
		J = K + K;
		if (J < H -> Q)
			if (H -> V[J] < H -> V[J+1])
				J = J + 1;
		if (Va >= H -> V[J])
			break;
		else {
			H -> V[K] = H -> V[J];
			K      = J;
			}
		}

	H -> V[K] = Va;
	return X;

} /* Remove */

	
/* Algoritmo 7.8 */
void Imprime(Heap *H, char Msg[])
{
	int I, J;
	int Nivel;
	char format[5];

	printf("%s\n", Msg);
	Nivel = 1;
	printf("%30s%d\n", " ", H -> V[1]);
	I     = Nivel + 1;
	while(I <= H -> Q) {
		J = 1;
		while((J <= Nivel * 2) && (I <= H -> Q))  {
			sprintf(format,"%c%ds", '%', 80 / (Nivel * 2 + 1));
			printf(format, " ");
			printf("%d", H -> V[I]);
			I = I + 1;
			J = J + 1;
			}
		putchar('\n');
		Nivel = Nivel + 1;
		}
} /* Imprime */
