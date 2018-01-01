/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte MergePV.c       */

#include "MergePV.h"

/* Área de controle de vias */
Via DV[P];

void Swap(Rec *X, Rec *Y)
{
	Rec Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */

/* Algoritmo 8.5 */
void Shell_Sort(Rec *V,int n)
{
	int D;
	int Ref;
	int Base;

	D = n / 2;
	while(D > 0)  {
			for(Ref = D; Ref < n; ++Ref) {
				Base = Ref - D;
				while (Base >= 0) 
					if (strcmp(V[Base].Chave,V[Base+D].Chave) > 0)  {
						Swap(&V[Base],&V[Base+D]);
						Base = Base - D;
						}
					else
						break;
				}
			D = D / 2;
			}

} /* Sort_Shell */

void Distribui_F(FILE *A_In, int Pi)
{
	Rec  V[M];
	Data R;
	int  I;
	static Pos = 0;

	/* Monta o nome do arquivo de saida */
	strcpy(DV[Pi].Fn,"F .DAT");
	DV[Pi].Fn[1] = Pi + '0';

	/* Inicializa indicador de fim de arquivo */
	DV[Pi].Fim   = 0;

	/* A última via pode ter menos
	  que M registros */
	if (P == (Pi + 1)) 
		DV[Pi].n = N - ((P - 1) * M);
	else
		DV[Pi].n = M;

	/* Armazena as primeiras M chaves e
	  seus respectivos tags em V */
	for(I = 0; I < DV[Pi].n; ++I) {
		if (fread(&R,sizeof(Data),1,A_In) != 1) {
			printf("Nao pode ler o registro %d do arquivo '%s'\n"
					, I+1, Entrada);
			exit(1);
			}
		strcpy(V[I].Chave,R.Nome);
		V[I].Tag = Pos;
		Pos      = Pos + 1;
		}

	/* Ordena as chaves de V */
	Shell_Sort(V,DV[Pi].n);

	/* Grava o conteúdo de V no arquivo Fp */
	DV[Pi].F = fopen(DV[Pi].Fn,"wb");
	if (DV[Pi].F == NULL)  {
		printf("Nao pode criar o arquivo '%s'\n", DV[Pi].Fn);
		exit(1);
		}

	for(I = 0; I < DV[Pi].n; ++I) 
		if (fwrite(&V[I],sizeof(Rec),1,DV[Pi].F) != 1) {
			printf("Nao pode gravar o registro %d do arquivo '%s'\n"
					, I+1, DV[Pi].Fn);
			exit(1);
			}

	fclose(DV[Pi].F);
	
} /* Distribui_F */



void Fase(char A2[])
{
	int  I;
	int  PVia;
	int  MenorVia;
	char MenorKey[NOME_SIZE+1];
	int  V_Ativas;
	FILE *A_Out;

	/* Reabre todas as vias */
	for(I = 0; I < P; ++I) {
		DV[I].F = fopen(DV[I].Fn,"rb");
		if (DV[I].F == NULL)  {
			printf("Nao pode encontar o arquivo '%s'\n", DV[I].Fn);
			exit(1);
			}
		}

	/* Abre o arquivo de saída */
	A_Out = fopen(A2,"wb");
	if (A_Out == NULL)  {
		printf("Nao pode criar o arquivo '%s'\n",A2);
		exit(1);
		}

	/* Le um registro de cada via */
	for(I = 0; I < P; ++I)
		if (fread(&DV[I].R,sizeof(Rec),1,DV[I].F) != 1) {
			printf("Nao pode ler o registro 1 do arquivo '%s'\n"
				, DV[I].Fn);
			exit(1);
			}

	V_Ativas = P;

	/* Grave o tag do registro que contiver
      a menor chave e leia um novo registro
	  do arquivo associado com esta chave
	  enquanto existirem registros a serem
	  lidos em pelo menos duas vias ativas */

	while (V_Ativas > 1) {

		/* Localiza a 1a via ativa */
		PVia = 0;
		while ((PVia < P) && (DV[PVia].Fim)) 
			PVia = PVia + 1;

		/* Seleciona a menor chave */
		MenorVia = PVia;
		strcpy(MenorKey,DV[PVia].R.Chave);
		PVia = PVia + 1;
		while (PVia < P)  {
			if (!DV[PVia].Fim)
				if (strcmp(DV[PVia].R.Chave,MenorKey) < 0) {
					MenorVia = PVia;
					strcpy(MenorKey,DV[PVia].R.Chave);
					}
			PVia = PVia + 1;
			}

		/* Grava o tag da via com a menor chave
		  no arquivo de referência */
		if (fwrite(&DV[MenorVia].R.Tag,sizeof(int),1,A_Out) != 1) {
			printf("Nao pode gravar registro do arquivo '%s'\n"
					, A2);
			exit(1);
			}

		DV[MenorVia].n = DV[MenorVia].n - 1;

		if (DV[MenorVia].n == 0)  {
			DV[MenorVia].Fim = 1;
			V_Ativas         = V_Ativas - 1;
			}
		else /* Le mais um registro desta via */
			if (fread(&DV[MenorVia].R,sizeof(Rec),1,DV[MenorVia].F) != 1) {
				printf("Nao pode ler o registro 1 do arquivo '%s'\n"
					, DV[MenorVia].Fn);
				exit(1);
				}
		}

	/* Neste ponto apenas uma das vias
	  contém chaves cujos tags ainda não foram
	  transferidos para o arquivo de referência */

	/* Localiza a via com tags pendentes */
	PVia = 0;
	while ((PVia < P) && (DV[PVia].Fim))  
		PVia = PVia + 1;

	while (DV[PVia].n > 0)  {

		if (fwrite(&DV[PVia].R.Tag,sizeof(int),1,A_Out) != 1) {
			printf("Nao pode gravar registro do arquivo '%s'\n"
					, A2);
			exit(1);
			}

		DV[PVia].n = DV[PVia].n - 1;

		if (DV[PVia].n > 0)
			/* Le mais um registro desta via */
			if (fread(&DV[PVia].R,sizeof(Rec),1,DV[PVia].F) != 1) {
				printf("Nao pode ler o registro 1 do arquivo '%s'\n"
					, DV[PVia].Fn);
				exit(1);
				}
		}

	/* Fecha e remove todas as vias */
	for(I = 0; I < P; ++I)  {
		fclose(DV[I].F);
		unlink(DV[I].Fn);
		}

	/* Fecha o arquivo de saída */
	fclose(A_Out);

} /* Fase */


/* Algoritmo 9.2 */
void Merge_P_Vias(char A[], char A2[])
{
	FILE *A_In;
	int I;

	/* Abre o arquivo de entrada */
	A_In = fopen(A,"rb");
	if (A_In == NULL)  {
		printf("Nao pode encontar o arquivo '%s'\n", A);
		exit(1);
		}

	/* Ordena e distribui N chaves em P vias */
	for(I = 0; I < P; ++I)
		Distribui_F(A_In,I);

	/* Realiza a operação de merge com F1 e F2
	   gerando o arquivo de referência         */
	Fase(A2);

} /* Merge_P_Vias */


