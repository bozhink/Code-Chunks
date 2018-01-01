// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Hash2.h          

#ifndef HASH
#define HASH

#include <iostream.h>
#include <string.h>
#include <process.h>
#include <ctype.h>                            

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
	class Hash_Aberto
{
public:
	void Inicializa();
	int Consulta(char K[]);
	void Remove(char K[], int *R);
	void Insere(char K[], int Tag);
	int Quantidade();
	void Imprime();

private:
	typedef struct {
		char Id[Tamanho_Chave+1];
		int  Tag;
		int  Next;
		} Rec_Tabela;

	int        N;
	int        Livre;
	int        Bucket[Valor_Hash];
	Rec_Tabela Tab[Tamanho_Tabela];

	int Hash(char K[]);
	void Insere_Tab(char K[], int Tag, int Colide, int *B);
};


//  Algoritmo 10.44 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
void Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Inicializa()
{
	int I;

	N = 0;

	for(I = 0; I < Valor_Hash; ++I)
		Bucket[I] = -1;

	for(I = 0; I < (Tamanho_Tabela - 1); ++I)
		Tab[I].Next = I + 1;

	Tab[Tamanho_Tabela - 1].Next = -1;

	Livre = 0;

}; // Inicializa 

//  Algoritmo 10.45 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
int Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Hash(char K[])
{
	int I, V;

	V = 0;

	for(I = 0; I < strlen(K); ++I)
		V = V + (K[I] * (I + 1));

	return V % Valor_Hash;

} // Hash 

//  Algoritmo 10.46 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
void Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Insere_Tab
		(char K[], int Tag, int Colide, int *B)
{
	int Pos;

	if (N >= Tamanho_Tabela) {
		cout << "*** Overflow na Tabela\n";
		exit(1);
		}

	N     = N + 1;
	Pos   = Livre;
	Livre = Tab[Pos].Next;

	strcpy(Tab[Pos].Id,K);
	Tab[Pos].Tag  = Tag;
	Tab[Pos].Next = Colide;
	*B            = Pos;

}; // Insere_Tab 

//  Algoritmo 10.47 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
int Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Consulta
		(char K[])
{
	int P;

	P = Bucket[Hash(K)];

	while (P >= 0)
		if (!strcmp(Tab[P].Id,K))  
			return Tab[P].Tag;
		else
			P = Tab[P].Next;

	return 0;

}; // Consulta 

//  Algoritmo 10.48 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
void Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Remove
		(char K[], int *R)
{
	int P, L;

	*R = FALSE;

	P  = Bucket[Hash(K)];

	if (!strcmp(Tab[P].Id,K)) {
		Bucket[Hash(K)] = Tab[P].Next;
		Tab[P].Next     = Livre;
		Livre           = P;
		N               = N - 1;
		*R              = TRUE;
		}
	else

		while(P >= 0)

			if (!strcmp(Tab[P].Id,K)) {
				Tab[L].Next = Tab[P].Next;
				Tab[P].Next = Livre;
				Livre       = P;
				N           = N - 1;
				*R          = TRUE;
				return;
				}
			else {
				L = P;
				P = Tab[P].Next;
				}

}; // Remove 

//  Algoritmo 10.49 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
void Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Insere
		(char K[], int Tag)
{
	int P, Onde;

	Onde = Hash(K);

	if (Bucket[Onde] < 0)
		Insere_Tab(K,Tag,-1,&(Bucket[Onde]));

	else {
		P = Bucket[Onde];
		while ( 1 )
			if (Tab[P].Next < 0) {
				Insere_Tab(K
				          ,Tag
				          ,Bucket[Onde]
				          ,&(Bucket[Onde]));
				return;
				}
			else
				P = Tab[P].Next;
		}

}; // Insere 

//  Algoritmo 10.50 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
int Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Quantidade()
{
	return N;

}; // Quantidade 

//  Algoritmo 10.51 
template <int Tamanho_Chave,int Tamanho_Tabela,int Valor_Hash> 
void Hash_Aberto<Tamanho_Chave,Tamanho_Tabela,Valor_Hash>::Imprime()
{
	int I, J;

	cout << "Tabela com " << N << " elementos:\n";

	for(I = 0; I < Valor_Hash; ++I) {
		J = Bucket[I];
		while (J >= 0) {
			cout << J << ' ';
			cout << Tab[J].Id << ' ';
			cout << Tab[J].Tag << ' ';
			cout << Tab[J].Next << '\n';
			J = Tab[J].Next;
			}
		}

}; // Imprime 

#endif
