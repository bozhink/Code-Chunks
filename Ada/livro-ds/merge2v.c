/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Merge2V.c       */

#include "Merge2V.h"

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

void Distribui_F1(char A[], FILE *A_In)
{
	int  I;
	FILE *F1;
	Data R1;
	Rec  V[M];

	/* Armazena as primeiras M chaves e
	   seus respectivos tags em V       */
	for(I = 0; I < M; ++I) {
		if (fread(&R1,sizeof(Data),1,A_In) != 1) {
			printf("Nao pode ler o registro %d do arquivo '%s'\n", I+1, A);
			exit(1);
			}
		strcpy(V[I].Chave,R1.Nome);
		V[I].Tag   = I;
		}

	/* Ordena as chaves de V */
	Shell_Sort(V,M);

	/* Grava o conteúdo de V no arquivo F1 */
	F1 = fopen("F1.DAT","wb");
	if (F1 == NULL)  {
		printf("Nao pode criar o arquivo 'F1.DAT'\n");
		exit(1);
		}

	for(I = 0; I < M; ++I) 
		if (fwrite(&V[I],sizeof(Rec),1,F1) != 1) {
			printf("Nao pode gravar o registro %d do arquivo 'F1.DAT'\n", I+1);
			exit(1);
			}

	fclose(F1);

} /* Distribui_F1 */

void Distribui_F2(char A[], FILE *A_In)
{
	int  I, J;
	FILE *F2;
	Data R2;
	Rec  V[N-M];

	/* Armazena as chaves restantes e
	   seus respectivos tags em V     */
	J = 0;
	I = M;
	while (I < N)  {
		if (fread(&R2,sizeof(Data),1,A_In) != 1) {
			printf("Nao pode ler o registro %d do arquivo '%s'\n", I+1, A);
			exit(1);
			}
		strcpy(V[J].Chave,R2.Nome);
		V[J].Tag   = I;
		I          = I + 1;
		J          = J + 1;
		}

	/* Fecha o arquivo de entrada */
	fclose(A_In);

	/* Ordena as chaves de V */
	Shell_Sort(V,N-M);

	F2 = fopen("F2.DAT","wb");
	if (F2 == NULL)  {
		printf("Nao pode criar o arquivo 'F2.DAT'\n");
		exit(1);
		}

	for(I = 0; I < (N - M); ++I) 
		if (fwrite(&V[I],sizeof(Rec),1,F2) != 1) {
			printf("Nao pode gravar o registro %d do arquivo 'F2.DAT'\n", I+1);
			exit(1);
			}

	fclose(F2);

} /* Distribui_F2 */


void Fase(char A2[])
{
	int  I, J;
	FILE *F1;
	FILE *F2;
	FILE *A_Out;
	Rec  V1, V2;

	/* Reabre F1 e F2 */
	F1 = fopen("F1.DAT","rb");
	if (F1 == NULL)  {
		printf("Nao pode encontar o arquivo 'F1.DAT'\n");
		exit(1);
		}
	F2 = fopen("F2.DAT","rb");
	if (F2 == NULL)  {
		printf("Nao pode encontar o arquivo 'F2.DAT'\n");
		exit(1);
		}

	/* Abre o arquivo de saída */
	A_Out = fopen(A2,"wb");
	if (A_Out == NULL)  {
		printf("Nao pode criar o arquivo '%s'\n",A2);
		exit(1);
		}

	/* Le um registro de F1 e F2 */
	if (fread(&V1,sizeof(Rec),1,F1) != 1) {
		printf("Nao pode ler o registro 1 do arquivo 'F1.DAT'\n");
		exit(1);
		}
	if (fread(&V2,sizeof(Rec),1,F2) != 1) {
		printf("Nao pode ler o registro 1 do arquivo 'F2.DAT'\n");
		exit(1);
		}

	I = M - 1;     /* F1 contém I registros */
	J = N - M - 1; /* F2 contém J registros */

	/* Grave o tag do registro que contiver
	   a menor chave e leia um novo registro
	   do arquivo associado com esta chave
	   enquanto existirem registros a serem
	   lidos em ambos os arquivos F1 e F2    */
	while((I >= 0) && (J >= 0))  
		if (strcmp(V1.Chave,V2.Chave) < 0) {
			if (fwrite(&V1.Tag,sizeof(int),1,A_Out) != 1) {
				printf("Nao pode gravar registro do arquivo '%s'\n"
						, A2);
				exit(1);
				}
			I = I - 1;
			if (I >= 0)
				if (fread(&V1,sizeof(Rec),1,F1) != 1) {
					printf("Nao pode ler o registro %d do arquivo 'F1.DAT'\n"
						, M - I);
					exit(1);
					}
			}
		else {
			if (fwrite(&V2.Tag,sizeof(int),1,A_Out) != 1) {
				printf("Nao pode gravar registro do arquivo '%s'\n"
						, A2);
				exit(1);
				}
			J = J - 1;
			if (J >= 0)
				if (fread(&V2,sizeof(Rec),1,F2) != 1) {
					printf("Nao pode ler o registro %d do arquivo 'F2.DAT'\n"
						, M - J);
					exit(1);
					}
			}


	/* Neste ponto apenas um dos arquivos de entrada
	   contém chaves cujos tags ainda não foram
	   transferidos para o arquivo de referência     */

	/* Grave os tags restantes do arquivo F1 */
	while(I >= 0) {
		if (fwrite(&V1.Tag,sizeof(int),1,A_Out) != 1) {
			printf("Nao pode gravar registro do arquivo '%s'\n"
					, A2);
			exit(1);
			}
		I = I - 1;
		if (I >= 0)
			if (fread(&V1,sizeof(Rec),1,F1) != 1) {
				printf("Nao pode ler o registro %d do arquivo 'F1.DAT'\n"
					, M - I);
				exit(1);
				}
		}

	/* Grave os tags restantes do arquivo F2 */
	while(J >= 0) {
		if (fwrite(&V2.Tag,sizeof(int),1,A_Out) != 1) {
			printf("Nao pode gravar registro do arquivo '%s'\n"
					, A2);
			exit(1);
			}
		J = J - 1;
		if (J >= 0)
			if (fread(&V2,sizeof(Rec),1,F2) != 1) {
				printf("Nao pode ler o registro %d do arquivo 'F2.DAT'\n"
					, M - J);
				exit(1);
				}
		}
	
	fclose(F1);
	fclose(F2);

	unlink("F1.DAT"); /* Remove os arquivos */
	unlink("F2.DAT"); /* F1.DAT e F2.DAT    */

	/* Fecha o arquivo de saída */
	fclose(A_Out);

} /* Fase */


/* Algoritmo 9.1 */
void Merge_Duas_Vias(char A[], char A2[])
{
	FILE *A_In;

	/* Abre o arquivo de entrada */
	A_In = fopen(A,"rb");
	if (A_In == NULL)  {
		printf("Nao pode encontar o arquivo '%s'\n", A);
		exit(1);
		}

	/* Ordena as primeiras M chaves e gera F1 */
	Distribui_F1(A,A_In);

	/* Ordena as chaves restantes e gera F2   */
	Distribui_F2(A,A_In);

	/* Realiza a operação de merge com F1 e F2
	   gerando o arquivo de referência         */
	Fase(A2);

} /* Merge_Duas_Vias */


