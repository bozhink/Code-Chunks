// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Merge2v2.h       

#ifndef MERGE2V
#define MERGE2V

#include <stdio.h>
#include <string.h>
#include <iostream.h>
#include <process.h>	

#define NOME_SIZE      2

typedef struct {
	char  Nome[NOME_SIZE+1];
	int   Idade;
	float Salario;
	} Data;

typedef struct {
	char Chave[NOME_SIZE+1];
	int  Tag;
	} Rec;

template <int N> class Merge2V
{
public:
	Merge2V(char *A, char *A2);  // Construtor

	int M;

	char *Entrada, *Saida;

	void Merge_Duas_Vias();

	FILE *F1, *F2;
	FILE *A_In, *A_Out;

private:
	Rec V[N/2];

	void Swap(Rec *X, Rec *Y);
	void Shell_Sort(int n);
	void Distribui_F1();
	void Distribui_F2();
	void Fase();

};

template <int N> 
Merge2V<N>::Merge2V(char *A, char *A2)
{
	M       = N / 2;
	Entrada = A;
	Saida   = A2;
};


template <int M> 
void Merge2V<M>::Swap(Rec *X, Rec *Y)
{
	Rec Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

}; // Swap 

// Algoritmo 8.5 
template <int N> 
void Merge2V<N>::Shell_Sort(int n)
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

}; // Sort_Shell 

template <int N> 
void Merge2V<N>::Distribui_F1()
{
	int  I;
	Data R1;

	// Armazena as primeiras M chaves e
	// seus respectivos tags em V       
	for(I = 0; I < M; ++I) {
		if (fread(&R1,sizeof(Data),1,A_In) != 1) {
			cout << "Nao pode ler o registro " << I + 1 <<
			        " do arquivo " << Entrada << '\n';
			exit(1);
			}
		strcpy(V[I].Chave,R1.Nome);
		V[I].Tag   = I;
		}

	// Ordena as chaves de V 
	Shell_Sort(M);

	// Grava o conteúdo de V no arquivo F1 
	F1 = fopen("F1.DAT","wb");
	if (F1 == NULL)  {
		cout << "Nao pode criar o arquivo 'F1.DAT'\n";
		exit(1);
		}

	for(I = 0; I < M; ++I) 
		if (fwrite(&V[I],sizeof(Rec),1,F1) != 1) {
			cout << "Nao pode gravar o registro " << I + 1 <<
			        " do arquivo 'F1.DAT'\n";
			exit(1);
			}

	fclose(F1);

}; // Distribui_F1 

template <int N> 
void Merge2V<N>::Distribui_F2()
{
	int  I, J;
	Data R2;

	// Armazena as chaves restantes e
	// seus respectivos tags em V     
	J = 0;
	I = M;
	while (I < N)  {
		if (fread(&R2,sizeof(Data),1,A_In) != 1) {
			cout << "Nao pode ler o registro " << I + 1 <<
			        " do arquivo " << Entrada << '\n';
			exit(1);
			}
		strcpy(V[J].Chave,R2.Nome);
		V[J].Tag   = I;
		I          = I + 1;
		J          = J + 1;
		}

	// Fecha o arquivo de entrada 
	fclose(A_In);

	// Ordena as chaves de V 
	Shell_Sort(N-M);

	F2 = fopen("F2.DAT","wb");
	if (F2 == NULL)  {
		cout << "Nao pode criar o arquivo 'F2.DAT'\n";
		exit(1);
		}

	for(I = 0; I < (N - M); ++I) 
		if (fwrite(&V[I],sizeof(Rec),1,F2) != 1) {
			cout << "Nao pode gravar o registro " << I + 1 <<
			        " do arquivo 'F2.DAT'\n";
			exit(1);
			}

	fclose(F2);

}; // Distribui_F2 


template <int N> 
void Merge2V<N>::Fase()
{
	int  I, J;
	Rec  V1, V2;

	// Reabre F1 e F2 
	F1 = fopen("F1.DAT","rb");
	if (F1 == NULL)  {
		cout << "Nao pode encontar o arquivo 'F1.DAT'\n";
		exit(1);
		}
	F2 = fopen("F2.DAT","rb");
	if (F2 == NULL)  {
		cout << "Nao pode encontar o arquivo 'F2.DAT'\n";
		exit(1);
		}

	// Abre o arquivo de saída 
	A_Out = fopen(Saida,"wb");
	if (A_Out == NULL)  {
		cout << "Nao pode criar o arquivo " << Saida << '\n';
		exit(1);
		}

	// Le um registro de F1 e F2 
	if (fread(&V1,sizeof(Rec),1,F1) != 1) {
		cout << "Nao pode ler o registro 1 do arquivo 'F1.DAT'\n";
		exit(1);
		}
	if (fread(&V2,sizeof(Rec),1,F2) != 1) {
		cout << "Nao pode ler o registro 1 do arquivo 'F2.DAT'\n";
		exit(1);
		}

	I = M - 1;     // F1 contém I registros 
	J = N - M - 1; // F2 contém J registros 

	// Grave o tag do registro que contiver
	// a menor chave e leia um novo registro
	// do arquivo associado com esta chave
	// enquanto existirem registros a serem
	// lidos em ambos os arquivos F1 e F2    
	while((I >= 0) && (J >= 0))  
		if (strcmp(V1.Chave,V2.Chave) < 0) {
			if (fwrite(&V1.Tag,sizeof(int),1,A_Out) != 1) {
				cout << "Nao pode gravar registro do arquivo " <<
				        Saida << '\n';
				exit(1);
				}
			I = I - 1;
			if (I >= 0)
				if (fread(&V1,sizeof(Rec),1,F1) != 1) {
					cout << "Nao pode ler o registro " << M - I <<
					        " do arquivo 'F1.DAT'\n";
					exit(1);
					}
			}
		else {
			if (fwrite(&V2.Tag,sizeof(int),1,A_Out) != 1) {
				cout << "Nao pode gravar registro do arquivo " <<
				        Saida << '\n';
				exit(1);
				}
			J = J - 1;
			if (J >= 0)
				if (fread(&V2,sizeof(Rec),1,F2) != 1) {
					cout << "Nao pode ler o registro " << M - J <<
					        " do arquivo 'F2.DAT'\n";
					exit(1);
					}
			}


	// Neste ponto apenas um dos arquivos de entrada
	// contém chaves cujos tags ainda não foram
	// transferidos para o arquivo de referência     

	// Grave os tags restantes do arquivo F1 
	while(I >= 0) {
		if (fwrite(&V1.Tag,sizeof(int),1,A_Out) != 1) {
			cout << "Nao pode gravar registro do arquivo " <<
			        Saida << '\n';
			exit(1);
			}
		I = I - 1;
		if (I >= 0)
			if (fread(&V1,sizeof(Rec),1,F1) != 1) {
				cout << "Nao pode ler o registro " << M - I <<
				        " do arquivo 'F1.DAT'\n";
				exit(1);
				}
		}

	// Grave os tags restantes do arquivo F2 
	while(J >= 0) {
		if (fwrite(&V2.Tag,sizeof(int),1,A_Out) != 1) {
			cout << "Nao pode gravar registro do arquivo " <<
			        Saida << '\n';
			exit(1);
			}
		J = J - 1;
		if (J >= 0)
			if (fread(&V2,sizeof(Rec),1,F2) != 1) {
				cout << "Nao pode ler o registro " << M - J <<
				        " do arquivo 'F2.DAT'\n";
				exit(1);
				}
		}
	
	fclose(F1);
	fclose(F2);

	unlink("F1.DAT"); // Remove os arquivos 
	unlink("F2.DAT"); // F1.DAT e F2.DAT    

	// Fecha o arquivo de saída 
	fclose(A_Out);

} // Fase 


// Algoritmo 9.1 
template <int N> 
void Merge2V<N>::Merge_Duas_Vias()
{
	// Abre o arquivo de entrada 
	A_In = fopen(Entrada,"rb");
	if (A_In == NULL)  {
		cout << "Nao pode encontar o arquivo " << Entrada << '\n';
		exit(1);
		}

	// Ordena as primeiras M chaves e gera F1 
	Distribui_F1();

	// Ordena as chaves restantes e gera F2   
	Distribui_F2();

	// Realiza a operação de merge com F1 e F2
	// gerando o arquivo de referência         
	Fase();

} // Merge_Duas_Vias 

#endif
