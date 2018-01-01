/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TMerge2V.c      */

#include "Merge2V.h"

void Simula_Dados(char A[])
{
	FILE *A_In;
	Data Registro;
	int  I, J;

	/* Abre o arquivo de entrada */
	A_In = fopen(A,"wb");
	if (A_In == NULL)  {
		printf("Nao pode gerar o arquivo '%s'\n", A);
		exit(1);
		}

	/* Produz dados para ordenação */
	Registro.Idade   = 18;
	Registro.Salario = 1000.0;

	/* Grave N registros sendo que o nome (chave) de cada
	   registro é composto por duas letras geradas em
	   ordem inversa                                      */
	for(I = 25; I >= 0; --I) {
		Registro.Nome[0] = I + 'A';
		for(J = 25; J >= 0; --J) {
			Registro.Nome[1] = J + 'a';
			if (fwrite(&Registro,sizeof(Data),1,A_In) != 1) {
				printf("Nao pode gravar registro do arquivo '%s'\n", A);
				exit(1);
				}
			Registro.Idade   = Registro.Idade + 1;
			Registro.Salario = Registro.Salario + 500.0;
			if (Registro.Idade > 69)
				Registro.Idade = 18;
			if (Registro.Salario > 5000.00)
				Registro.Salario = 1000.0;
			}
		}

	fclose(A_In);

} /* Simula_Dados */

/* Verifica se as chaves estão em ordem */
void Verifica_Ordenacao(char A[], char A2[])
{
	int  I, Tag;
	Data Registro, Registro2;
	FILE *A_In;
	FILE *A_Out;

	/* Abre o arquivo de entrada */
	A_In = fopen(A,"rb");
	if (A_In == NULL)  {
		printf("Nao pode acessar o arquivo '%s'\n", A);
		exit(1);
		}

	/* Abre o arquivo de referência */
	A_Out = fopen(A2,"rb");
	if (A_Out == NULL)  {
		printf("Nao pode acessar o arquivo '%s'\n", A2);
		exit(1);
		}

	/* Leia o tag do registro com a menor chave */
	if (fread(&Tag,sizeof(int),1,A_Out) != 1) {
		printf("Nao pode ler registro do arquivo '%s'\n", A2);
		exit(1);
		}

	/* Posicione o arquivo de entrada para ler
	   o registro associado com este tag       */
	fseek(A_In,Tag * sizeof(Data), 0L);

	/* Leia o registro completo do arquivo de entrada */
	if (fread(&Registro,sizeof(Data),1,A_In) != 1) {
		printf("Nao pode ler registro %d do arquivo '%s'\n"
				, A, Tag + 1);
		exit(1);
		}

	/* Verifica se a chave de um registro é
	   maior que a de sucessor para todos os registros */
	I = 1;
	while (I < N) {
		if (fread(&Tag,sizeof(int),1,A_Out) != 1) {
			printf("Nao pode ler registro do arquivo '%s'\n", A2);
			exit(1);
			}
		fseek(A_In,Tag * sizeof(Data), 0L);
		if (fread(&Registro,sizeof(Data),1,A_In) != 1) {
			printf("Nao pode ler registro %d do arquivo '%s'\n"
					, A, Tag + 1);
			exit(1);
			}
		if (strcmp(Registro.Nome,Registro2.Nome) > 0) {
			printf("O registro %d esta' fora de ordem...\n", I);
			printf("%s %s %d\n"
				, Registro.Nome, Registro2.Nome, Tag + 1);
			exit(1);
			}
		Registro = Registro2;
		I = I + 1;
		}

	fclose(A_In);
	fclose(A_Out);

	unlink(Saida); /* Remove o arquivo de referência */

	printf("A ordem esta' correta!\n");

} /* Verifica_Ordenacao */


void main()
{
	Simula_Dados(Entrada);

	Merge_Duas_Vias(Entrada,Saida);

	Verifica_Ordenacao(Entrada,Saida);

} /* main */