/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte RadixSor.c      */

#include "RadixSor.H"

int Digito(int Val, int D)
{
	switch(D) {
		case 1  : return Val % B;
		case 2  : return (Val % (B * B)) / B;
		default :
			printf("Modifique a funcao Digito\n");
			exit(1);
		}
} /* Digito */

/* Algoritmo 8.9  modificado */
void Contagem(int V[], int *R, int N, int D)
{
	int T[10];
	int I, P;


	/* Inicializa o vetor T; por isso o intervalo
	   de chaves deve estar entre 1 e B */
	for(I = 0; I < B; ++I)
			T[I] = 0;

	/* Determina T[I] de modo a indicar o número
	   de elementos iguais a I */
	for(I = 0; I < N; ++I)
		T[Digito(V[I],D)] = T[Digito(V[I],D)] + 1;

	/* Faz com que T[I] contenha o número
	   de elementos menores ou iguais a I */
	for(I = 1; I < B; ++I)
		T[I] = T[I] + T[I - 1];

	/* Coloca cada elemento V[I] em sua
	   posição correta */
	for(I = 0; I < N; ++I) {
		P         = Digito(V[I],D);
		R[N-T[P]] = V[I];
		T[P]      = T[P] - 1;
		}

	/* Copia R para V */
	for(I = 0; I < N; ++I) 
		if (D == Digitos)
			V[N-I-1] = R[I];
		else
			V[I]     = R[I];
	
} /* Contagem */


/* Algoritmo 8.10 */
void Radix_Sort(int V[], int N)
{
	int I;
	int *R;	

	R = (int *) calloc(N,sizeof(int));
	if (R == NULL)  {
		printf("*** Radix_Sort: faltou memoria!\n");
		exit(1);
		}

	for(I = 1; I <= Digitos; ++I)
		Contagem(V,R,N,I);

	free(R); 
}

void Imprime_Vetor(char Msg[],int V[], int N)
{
	int I;
	
	printf("%s", Msg);
	for(I = 0; I < N; ++I) {
		printf("%d", V[I]);
		if (I != (N - 1))
			putchar(',');
		}

	putchar('\n');

} /* Imprime_Vetor */
	
