// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Floresta.cpp

#include "Florest2.h"

// Algoritmo 10.15
int Florest::Inicializa(char Fn[])
{
	int      I;

	if ((F = (Floresta) calloc(1,sizeof(FlorestaSIZE))) == NULL)  
		return 0;

	// Cria árvore
	if ((F->Tfp = fopen(Fn,"wb+")) == NULL)  
		return 0;

	F->Em_uso    = 0;
	F->Deletados = 0;
	F->Compacte  = 0;

	strcpy(F->Tfn,Fn);

	for(I = 0; I < FLORESTA; ++I) 
		F->Raiz[I] = -2L;

	if (fwrite(F,sizeof(FlorestaSIZE),1,F->Tfp) != 1)  
		return 0;
	
	if (fclose(F->Tfp) != 0)
		return 0;

	if ((F->Tfp = fopen(Fn,"rb+")) == NULL)  
		return 0;

	return 1;

} // Inicializa

// Algoritmo 10.16
int Florest::Abre(char Fn[])
{
	double   Sit;
	Floresta F;
	FILE     *Ftemp;

	if ((F = (Floresta) calloc(1,sizeof(FlorestaSIZE))) == NULL)  
		return 0;

	if ((Ftemp = fopen(Fn,"rb+")) == NULL)  
		return 0;

	rewind(Ftemp);

	if (fread(F,sizeof(FlorestaSIZE),1,Ftemp) != 1)  
		return 0;

	F->Tfp = Ftemp;

	if (F->Em_uso != 0)
		Sit = F->Deletados * 100.0 / F->Em_uso;

	if (Sit > 30.0 || F->Deletados > F->Em_uso)  
		F->Compacte = 1;
	else
		F->Compacte = 0;

	return 1;

} // Abre

// Algoritmo 10.17
int Florest::Fecha()
{
	rewind(F->Tfp);

	if (fwrite(F,sizeof(FlorestaSIZE),1,F->Tfp) != 1)  
		return 1;

	fflush(F->Tfp);

	if (fclose(F->Tfp) != 0)
		return 2;

	free(F);

	return 0;

} // Fecha

// Algoritmo 10.18
int Florest::Hash(char *S)
{
	int          I;
	unsigned int Val = 0;

// utilize este comando para tornar a floresta ordenada
	//	return *S; 

	for(I = 1; I <= strlen(S); ++I)
		Val = Val + (*S++ * I);

	return Val % FLORESTA;

} // Hash

// Algoritmo 10.19
long Florest::Seek(long O, int M)
{
	long K;

	switch(M)  {
		case 0 : 
			if (fseek(F->Tfp, O, M) != 0) 
				break;
			if (ftell(F->Tfp) != O)
				break;
			return O;
		case 1 :
		case 2 :
			K = fseek(F->Tfp, O, M);
			if (K != 0) 
				break;
			return ftell(F->Tfp);
		default:
			return -1L;
		}

	return -2L;

} // Seek

// Algoritmo 10.20
int Florest::Le(TKPTR Nodo, long W)
{
	if (Seek(W,0) < 0L)
		return 1;

	if (fread(Nodo,TREESIZE,1,F->Tfp) != 1)   
		return 2;

	if (fread(Nodo->Key, Nodo->Len,1,F->Tfp) != 1)  
		return 3;

	Nodo->Key[Nodo->Len] = '\0';

	return 0;

} // Le

// Algoritmo 10.21
int Florest::Grava(TKPTR Nodo, long W)
{
	if (Seek(W,0) < 0L)
		return 1;

	Nodo->Len = strlen(Nodo->Key);

	if (fwrite(Nodo,TREESIZE,1,F->Tfp) != 1)   
		return 2;

	if (fwrite(Nodo->Key,(int) Nodo->Len,1,F->Tfp) != 1)  
		return 3;

	return 0;

} // Grava

// Algoritmo 10.22
long Florest::Prepara(char *K, long Tag)
{
	TKSIZE Nodo;
	long   X;

	if ((X = Seek(0L,2)) < 0L)
		return -1L;

	Nodo.LLink  = -2L;
	Nodo.RLink  = -2L;
	Nodo.Tag    = Tag;
	Nodo.Status = 'I';
	Nodo.Len    = strlen(K);

	F->Em_uso += 1;
	strcpy(Nodo.Key,K);

	if (fwrite(&Nodo,TREESIZE,1, F->Tfp) != 1)  
		return -2L;

	if (fwrite(Nodo.Key, (int) Nodo.Len,1,F->Tfp) != 1)  
		return -3L;

	return X;

} // Prepara

// Algoritmo 10.23
long Florest::Insere(char *K, long Tag)
{
	TKSIZE Nodo;
	long   W , X;
	int    I;

	I = Hash(K);

	if ((W = F->Raiz[I]) < 0L)  {

		F->Raiz[I] = Prepara(K,Tag);
		if (F->Raiz[I] < 0L) 
			return -4L;

		if (Seek(0L,0) < 0L)
			return -3L;

		if (fwrite(F,sizeof(FlorestaSIZE),1,F->Tfp) != 1)  
			return -1L;

		fflush(F->Tfp);

		return(F->Raiz[I]);
		}

	while ( 1 )  {

		if (Le(&Nodo,W) != 0)
			return -5L;

		switch(strcmp(K,Nodo.Key))  {
			case -1 : 
				if (Nodo.LLink < 0L)  {
					X = Nodo.LLink = Prepara(K,Tag);
					if (X < 0L)
						return -4L;
					if (Grava(&Nodo,W) != 0)
						return -6L;
					return X;
					}
				W = Nodo.LLink;
				break;

			case  0 :
				if (Nodo.Status != 'D')  
					return -2L;
				F->Deletados     -= 1;
				Nodo.Status          = 'I';
				Nodo.Tag             = Tag;
				if (Grava(&Nodo,W) != 0)
					return -6L;
				return W;

			default :
				if (Nodo.RLink < 0L)  {
					X = Nodo.RLink = Prepara(K,Tag);
					if (X < 0L)
						return -4L;
					if (Grava(&Nodo,W) != 0)
						return -6L;
					return X;
					}
				W = Nodo.RLink;
				break;
			}
		}
} // Insere

// Algoritmo 10.24
long Florest::Consulta(char *K)
{
	TKSIZE Nodo;
	long   X;

	X = F->Raiz[Hash(K)];

	while ( 1 )  {
		if ( X < 0L) 
			return -1L;

		if (Le(&Nodo,X))
			return -2L;

		switch(strcmp(K,Nodo.Key))  {
			case -1 : 
				X = Nodo.LLink; 
				break;
			case  0 : 
				if (Nodo.Status == 'D') 
					return -1L;
				return(Nodo.Tag);
			default : 
				X = Nodo.RLink; 
				break;
			}
		}
} // Consulta

// Algoritmo 10.25
int Florest::Remove(char *K)
{
	TKSIZE Nodo;
	long   X;

	X = F->Raiz[Hash(K)];

	while ( 1 )  {

		if (X < 0L) 
			return 1;

		if (Le(&Nodo,X)) 
			return 2;

		switch(strcmp(K,Nodo.Key))  {
			case -1 : 
				X = Nodo.LLink; 
				break;

			case  0 : 
				if (Nodo.Status == 'D') 
					return 3;

				Nodo.Status      = 'D';
				F->Deletados += 1;
				if (Grava(&Nodo,X) != 0)
					return 4;
				return 0;

			default : 
				X = Nodo.RLink; 
				break;
			}
		}
} // Remove

// Algoritmo 10.26
int Florest::Tempo_De_Compactar()
{
	return F->Compacte;

} // Tempo_De_Compactar

// Algoritmo 10.27
int Florest::Squash(char Fn[])
{
	char     Tn[101];
	long     K, Fim;
	TKSIZE   Nodo;
	Florest  Temp;

	if (Abre(Fn) == 0)
		return 1;

	if (Temp.Inicializa("TREEBAK.BAK") == 0)
		return 1;

	K = sizeof(FlorestaSIZE);
	if (fseek(F->Tfp, 0L, 2) != 0)
		return 2;

	Fim = ftell(F->Tfp);

	while ( K < Fim )   {
		if (Le(&Nodo,K) != 0)
			return 2;
		if (Nodo.Status != 'D')
			if (Temp.Insere(Nodo.Key,Nodo.Tag) < 0L)
				return 3;
		K = ftell(F->Tfp);
		}

	strcpy(Tn,F->Tfn);
	strcpy(Temp.F->Tfn,Tn);
	
	if (Temp.Fecha())
		return 4;

	if (Fecha())
		return 4;

	// Remove árvore antiga
	unlink(Tn);

	if (rename("TREEBAK.BAK",Tn) != 0)  
		return 5;

	return 0;

} // Squash

// Algoritmo 10.28
void Florest::Imprime()
{ 
	int I;

	for(I = 0; I < FLORESTA; ++I)
		Central(F->Raiz[I]);

} // Imprime

// Algoritmo 7.2
void Florest::Central(long K)
{ 
	TKSIZE Nodo;
	int    E;
	char   Linha[101];

	if (K <= 0L)
		return;

	if ((E = Le(&Nodo,K)) != 0) {
		cout << "*** Erro em Central(" << K << 
		        ") E = " << E << '\n';
		exit(1);
		}

	Central(Nodo.LLink);

	if (Nodo.Status != 'D') {
		sprintf(Linha,"%-40s %ld\n", Nodo.Key, Nodo.Tag);
		cout << Linha;
		}

	Central(Nodo.RLink);

} // Central
