// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Trie.c          

#include "Trie2.h"

// Algoritmo 10.39 
void Trie::Inicializa()
{
	int I;

	Raiz = (Elo) calloc(1,sizeof(No));
	if (Raiz == NULL) {
		cout << "*** Inicializa: Memoria insuficiente\n";
		exit(1);
		} 

	for(I = 0; I < Max; ++I)
		Raiz -> C[I] = NULL;

	Raiz -> Tag = 0;

} // Inicializa 


// Algoritmo 10.40 
void Trie::Insere(char K[], int Tag)
{
	Elo  P, Q;
	int  I, J, M;
	char L;

	P = Raiz;
	for(I = 0; I < strlen(K); ++I)  {
		L = toupper(K[I]);
		if ((L >= 'A') && (L <= 'Z'))
			J = L - 'A';
		else
			J = Max - 1;

		if (P -> C[J] == NULL)  {
			Q = (Elo) calloc(1,sizeof(No));
			if (Q == NULL) {
				cout << "*** Insere: Memoria insuficiente\n";
				exit(1);
				} 
			for(M = 0; M < Max; ++M)
				Q -> C[M] = NULL;
			Q -> Tag  = 0;
			P -> C[J] = Q;
			}
		P = P -> C[J];
		}

	if (P -> Tag > 0) {
		cout << "*** Insere: Chave " << K << " ja existe\n";
		exit(1);
		}

	P -> Tag = Tag;

} // Insere 


// Algoritmo 10.41 
int Trie::Consulta(char K[])
{
	Elo  P;
	int  I, J;
	char L;

	P = Raiz;

	I = 0;
	while (I < strlen(K)) {
		L = toupper(K[I]);
		if ((L >= 'A') && (L <= 'Z'))
			J = L - 'A';
		else
			J = Max - 1;

		if (P -> C[J] == NULL)
			return 0;

		P = P -> C[J];
		I = I + 1;
		}

	if ((P -> Tag > 0) && (I == strlen(K))) 
		return P -> Tag;

	return 0;

} // Consulta 

// Algoritmo 10.42 
int Trie::Remove(char K[])
{
	Elo  P;
	int  I, J;
	char L;

	P = Raiz;

	I = 0;
	while (I < strlen(K)) {
		L = toupper(K[I]);
		if ((L >= 'A') && (L <= 'Z'))
			J = L - 'A';
		else
			J = Max - 1;

		if (P -> C[J] == NULL)
			return FALSE;

		P = P -> C[J];
		I = I + 1;
		}

	if (P -> Tag > 0) {
		P -> Tag = 0;
		return TRUE;
		}

	return FALSE;

} // Remove 


// Algoritmo 10.43 
void Trie::Imprime(Elo P, char K[])
{
	int  I;
	char Temp[256];
	char L[2];

	L[1] = '\0';

	if (P != NULL) {
		if (P -> Tag > 0)
			cout << P -> Tag << ' ' << K << '\n';

		for(I = 0; I < Max; ++I) {
			strcpy(Temp,K);
			if (I == (Max - 1)) {
				strcat(Temp," ");
				Imprime(P -> C[I],Temp);
				}
			else {
				L[0] = I + 'A';
				strcat(Temp,L);
				Imprime(P -> C[I],Temp);
				}
			}
		}

} // Imprime 
