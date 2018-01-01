/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ArvoreB.c       */

#include "ArvoreB.H"

/* Algoritmo 10.29 */
void Init_C(Elo X)
{
	int I;

	for(I = 0; I < Sons; ++I)
		X -> C[I] = NULL;

	for(I = 0; I < Keys; ++I)
		X -> Status[I] = FALSE;

} /* Init_C */

/* Algoritmo 10.30 */
Elo Inicializa()
{
	Elo R;

	R = calloc(1,sizeof(No));
	if (R == NULL) {
		printf("*** Inicializa: Memoria insuficiente\n");
		exit(1);
		} 

	Init_C(R);

	R -> N     = 0;
	R -> Folha = TRUE;

	return R;

} /* Inicializa */

/* Algoritmo 10.31 */
void Divide_Filho(Elo X, int I, Elo FI)
{
	Elo FI2;
	int J;

	FI2 = calloc(1,sizeof(No));
	if (FI2 == NULL) {
		printf("*** Divide_Filho Memoria insuficiente\n");
		exit(1);
		} 

	Init_C(FI2);

	FI2 -> Folha  = FI -> Folha;
	FI2 -> N      = T - 1;

	for(J = 0; J < (T - 1); ++J) {
		strcpy(FI2 -> Chave[J],FI -> Chave[J+T]);
		FI2 -> Tag[J]       = FI -> Tag[J+T];
		FI2 -> Status[J]    = FI -> Status[J+T];
		FI -> Status[J+T]   = FALSE;
		FI -> Chave[J+T][0] = '\0';
		}

	if (!FI -> Folha)
		for(J = 0; J < T; ++J)  
			FI2 -> C[J] = FI -> C[J+T];

	FI -> N = T - 1;

	for(J = X -> N; J >= I+1; --J)
		X -> C[J+1] = X -> C[J];

	X -> C[I+1] = FI2;

	for(J = X -> N-1; J >= I;--J)  {
		strcpy(X -> Chave[J+1],X -> Chave[J]);
		X -> Tag[J+1]    = X -> Tag[J];
		X -> Status[J+1] = X -> Status[J];
		X -> Status[J]   = FALSE;
		}

	strcpy(X -> Chave[I],FI -> Chave[T-1]);
	X -> Tag[I]       = FI -> Tag[T-1];
	X -> Status[I]    = TRUE;
	FI -> Status[T-1] = FALSE;
	X -> N            = X -> N + 1;

} /* Divide_Filho */

/* Algoritmo 10.32 */
void Insere_Nao_Cheio(Elo X, char K[], int Tag)
{
	int I;

	I = X -> N - 1;

	if (X -> Folha) {
		while (I >= 0) {

			if (strcmp(K,X -> Chave[I]) < 0) {
				strcpy(X -> Chave[I+1],X -> Chave[I]);
				X -> Tag[I+1]    = X -> Tag[I];
				X -> Status[I+1] = X -> Status[I];
				--I;
				}
			else
				break;
			}

		strcpy(X -> Chave[I+1],K);
		X -> Tag[I+1]    = Tag;
		X -> Status[I+1] = TRUE;
		X -> N           = X -> N + 1;
		}
	else {

		while (I >= 0) 
			if (strcmp(K,X -> Chave[I]) < 0)
				--I;
			else
				break;
		++I;

		if (X -> C[I] -> N == Keys)  {
			Divide_Filho(X,I,X -> C[I]);
			if (strcmp(K,X -> Chave[I]) > 0)
				++I;
			}

		Insere_Nao_Cheio(X -> C[I],K,Tag);
		}

} /* Insere_Nao_Cheio */

/* sub-algoritmo 10.33.1 */
int Consulta_Insere(Elo R, char K[], Elo *X)
{
	int J;

	*X = NULL;
	J  = 0;

	while (J < R -> N) 
		if (strcmp(K,R -> Chave[J]) > 0)
			++J;
		else
			break;

	if (J < R -> N) {
		if (!strcmp(K,R -> Chave[J])) {
			*X = R;
			return J;
			}
		else
			if (!R -> Folha) 
				return Consulta_Insere(R -> C[J],K,X);
		}
	else
		if (!R -> Folha)
			Consulta_Insere(R -> C[J],K,X);

	return 0;

} /* Consulta_Insere */

/* Algoritmo 10.33 */
void Insere(Elo *Ra, char K[], int Tag)
{
	Elo R, S;
	int I;

	/* Primeiro verifica se K já está na árvore B */
	I = Consulta_Insere(*Ra,K,&R);
	if (R != NULL) {
		if (R -> Status[I]) {
			printf("*** A chave %s ja  existe\n", K);
			exit(1);
			}

		/* Se K estava inativo reutilize o seu local */
		R -> Status[I] = TRUE;
		R -> Tag[I]    = Tag;
		}
	else {

		R = *Ra;

		if (R -> N == Keys) {
			S = calloc(1,sizeof(No));
			if (S == NULL) {
				printf("*** Insere: Memoria insuficiente ");
				printf("para insercao de %s\n", K);
				exit(1);
				} 

			Init_C(S);

			*Ra        = S;
			S -> Folha = FALSE;
			S -> N     = 0;
			S -> C[0]  = R;
			Divide_Filho(S,0,R);
			Insere_Nao_Cheio(S,K,Tag);
			}
		else
			Insere_Nao_Cheio(R,K,Tag);
		}

} /* Insere */

/* Algoritmo 10.34 */
int Consulta(Elo R, char K[])
{
	int I = 0;

	while (I < R -> N)
		if (strcmp(K,R -> Chave[I]) > 0)
			++I;
		else
			break;

	if (I < R -> N) {
		if (!strcmp(K,R -> Chave[I])) {
			if (R -> Status[I])
				return R -> Tag[I];
			}
		else
			if (!R -> Folha)
				return Consulta(R -> C[I],K);
		}
	else
		if (!R -> Folha)
			return Consulta(R -> C[I],K);

	return 0;
} /* Consulta */

/* Algoritmo 10.35 */
int Remove(Elo R, char K[])
{
	int I = 0;

	while (I < R -> N)
		if (strcmp(K,R -> Chave[I]) > 0)
			++I;
		else
			break;

	if (I < R -> N) {
		if (!strcmp(K,R -> Chave[I])) {
			R -> Status[I] = FALSE;
			return 1;
			}
		else
			if (!R -> Folha)
				return Remove(R -> C[I],K);
		}
	else
		if (!R -> Folha)
			return Remove(R -> C[I],K);

	return 0;

} /* Remove */

/* Sub-algoritmo 10.36.1 */
void Squash_2(Elo Ra, Elo *Nova)
{
	int I;

	if (Ra != NULL) {
		for(I = 0; I < Ra -> N; ++I) {
			Squash_2(Ra -> C[I],Nova);
			if  (Ra -> Status[I])
				Insere(Nova,Ra -> Chave[I],Ra -> Tag[I]);
			}
		Squash_2(Ra -> C[Ra -> N],Nova);
		if (Ra -> Folha)
			free(Ra);
		}

} /* Squash_2 */

/* Algoritmo 10.36 */
Elo Squash(Elo Ra)
{
	Elo R;

	R = Inicializa();

	Squash_2(Ra,&R);

	return R;

} /* Squash_2 */

/* Algoritmo 10.37 */
void Conta(Elo R, int *Deletados, int *Ativos)
{
	int I;

	if (R != NULL) {
		for(I = 0 ; I < R -> N; ++I) {
			Conta(R -> C[I],Deletados,Ativos);
			if (R -> Status[I])
				*Ativos    = *Ativos + 1;
			else
				*Deletados = *Deletados + 1;
			}
		Conta(R -> C[R -> N],Deletados,Ativos);
		}

} /* Conta */

/* Algoritmo 10.38 */
void Imprime(Elo Ra)
{
	int I;

	if (Ra != NULL) {
		for(I = 0; I < Ra -> N; ++I) {
			Imprime(Ra -> C[I]);
			if (Ra -> Status[I])
				printf("%4d %s\n", Ra -> Tag[I], Ra -> Chave[I]);
			}
		Imprime(Ra -> C[Ra -> N]);
		}

} /* Imprime */
