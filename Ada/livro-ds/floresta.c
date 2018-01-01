/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Floresta.c      */

#include "Floresta.h"

/* Algoritmo 10.15 */
Floresta Inicializa(char Fn[])
{
	int      I;
	Floresta F;

	if ((F = (Floresta) calloc(1,sizeof(FlorestaSIZE))) == NULL)  
		return NULL;

	/* Cria árvore */
	if ((F->Tfp = fopen(Fn,"wb+")) == NULL)  
		return NULL;

	F->Em_uso    = 0;
	F->Deletados = 0;
	F->Compacte  = 0;

	strcpy(F->Tfn,Fn);

	for(I = 0; I < FLORESTA; ++I) 
		F->Raiz[I] = -2L;

	if (fwrite(F,sizeof(FlorestaSIZE),1,F->Tfp) != 1)  
		return NULL;
	
	if (fclose(F->Tfp) != 0)
		return NULL;

	if ((F->Tfp = fopen(Fn,"rb+")) == NULL)  
		return NULL;

	return F;

} /* Inicializa */

/* Algoritmo 10.16 */
Floresta Abre(char Fn[])
{
	double   Sit;
	Floresta F;
	FILE     *Ftemp;

	if ((F = (Floresta) calloc(1,sizeof(FlorestaSIZE))) == NULL)  
		return NULL;

	if ((Ftemp = fopen(Fn,"rb+")) == NULL)  
		return NULL;

	rewind(Ftemp);

	if (fread(F,sizeof(FlorestaSIZE),1,Ftemp) != 1)  
		return NULL;

	F->Tfp = Ftemp;

	if (F->Em_uso != 0)
		Sit = F->Deletados * 100.0 / F->Em_uso;

	if (Sit > 30.0 || F->Deletados > F->Em_uso)  
		F->Compacte = 1;
	else
		F->Compacte = 0;

	return F;

} /* Abre */

/* Algoritmo 10.17 */
int Fecha(Floresta F)
{
	rewind(F->Tfp);

	if (fwrite(F,sizeof(FlorestaSIZE),1,F->Tfp) != 1)  
		return 1;

	fflush(F->Tfp);

	if (fclose(F->Tfp) != 0)
		return 2;

	free(F);

	return 0;

} /* Fecha */

/* Algoritmo 10.18 */
int Hash(char *S)
{
	int          I;
	unsigned int Val = 0;

/* utilize este comando para tornar a floresta ordenada */
	/*	return *S; */

	for(I = 1; I <= strlen(S); ++I)
		Val = Val + (*S++ * I);

	return Val % FLORESTA;

} /* Hash */

/* Algoritmo 10.19 */
long Seek(Floresta F, long O, int M)
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

} /* Seek */

/* Algoritmo 10.20 */
int Le(Floresta F, TKPTR Nodo, long W)
{
	if (Seek(F,W,0) < 0L)
		return 1;

	if (fread(Nodo,TREESIZE,1,F->Tfp) != 1)   
		return 2;

	if (fread(Nodo->Key, Nodo->Len,1,F->Tfp) != 1)  
		return 3;

	Nodo->Key[Nodo->Len] = '\0';

	return 0;

} /* Le */

/* Algoritmo 10.21 */
int Grava(Floresta F, TKPTR Nodo, long W)
{
	if (Seek(F,W,0) < 0L)
		return 1;

	Nodo->Len = strlen(Nodo->Key);

	if (fwrite(Nodo,TREESIZE,1,F->Tfp) != 1)   
		return 2;

	if (fwrite(Nodo->Key,(int) Nodo->Len,1,F->Tfp) != 1)  
		return 3;

	return 0;

} /* Grava */

/* Algoritmo 10.22 */
long Prepara(Floresta F, char *K, long Tag)
{
	TKSIZE Nodo;
	long   X;

	if ((X = Seek(F,0L,2)) < 0L)
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

} /* Prepara */

/* Algoritmo 10.23 */
long Insere(Floresta F, char *K, long Tag)
{
	TKSIZE Nodo;
	long   W , X;
	int    I;

	I = Hash(K);

	if ((W = F->Raiz[I]) < 0L)  {

		F->Raiz[I] = Prepara(F,K,Tag);
		if (F->Raiz[I] < 0L) 
			return -4L;

		if (Seek(F,0L,0) < 0L)
			return -3L;

		if (fwrite(F,sizeof(FlorestaSIZE),1,F->Tfp) != 1)  
			return -1L;

		fflush(F->Tfp);

		return(F->Raiz[I]);
		}

	while ( 1 )  {

		if (Le(F,&Nodo,W) != 0)
			return -5L;

		switch(strcmp(K,Nodo.Key))  {
			case -1 : 
				if (Nodo.LLink < 0L)  {
					X = Nodo.LLink = Prepara(F,K,Tag);
					if (X < 0L)
						return -4L;
					if (Grava(F,&Nodo,W) != 0)
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
				if (Grava(F,&Nodo,W) != 0)
					return -6L;
				return W;

			default :
				if (Nodo.RLink < 0L)  {
					X = Nodo.RLink = Prepara(F,K,Tag);
					if (X < 0L)
						return -4L;
					if (Grava(F,&Nodo,W) != 0)
						return -6L;
					return X;
					}
				W = Nodo.RLink;
				break;
			}
		}
} /* Insere */

/* Algoritmo 10.24 */
long Consulta(Floresta F, char *K)
{
	TKSIZE Nodo;
	long   X;

	X = F->Raiz[Hash(K)];

	while ( 1 )  {
		if ( X < 0L) 
			return -1L;

		if (Le(F,&Nodo,X))
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
} /* Consulta */

/* Algoritmo 10.25 */
int Remove(Floresta F, char *K)
{
	TKSIZE Nodo;
	long   X;

	X = F->Raiz[Hash(K)];

	while ( 1 )  {

		if (X < 0L) 
			return 1;

		if (Le(F,&Nodo,X)) 
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
				if (Grava(F,&Nodo,X) != 0)
					return 4;
				return 0;

			default : 
				X = Nodo.RLink; 
				break;
			}
		}
} /* Remove */

/* Algoritmo 10.26 */
int Tempo_De_Compactar(Floresta F)
{
	return F->Compacte;

} /* Tempo_De_Compactar */

/* Algoritmo 10.27 */
int Squash(char Fn[])
{
	char     Tn[101];
	long     K, Fim;
	TKSIZE   Nodo;
	Floresta F;
	Floresta Temp;

	if ((F = Abre(Fn)) == NULL)
		return 1;

	if ((Temp = Inicializa("TREEBAK.BAK")) == NULL)
		return 1;

	K = sizeof(FlorestaSIZE);
	if (fseek(F->Tfp, 0L, 2) != 0)
		return 2;

	Fim = ftell(F->Tfp);

	while ( K < Fim )   {
		if (Le(F,&Nodo,K) != 0)
			return 2;
		if (Nodo.Status != 'D')
			if (Insere(Temp,Nodo.Key,Nodo.Tag) < 0L)
				return 3;
		K = ftell(F->Tfp);
		}

	strcpy(Tn,F->Tfn);
	strcpy(Temp->Tfn,Tn);
	
	if (Fecha(Temp))
		return 4;

	if (Fecha(F))
		return 4;

	/* Remove árvore antiga */
	unlink(Tn);

	if (rename("TREEBAK.BAK",Tn) != 0)  
		return 5;

	return 0;

} /* Squash */

/* Algoritmo 10.28 */
void Imprime(Floresta F)
{ 
	int I;

	for(I = 0; I < FLORESTA; ++I)
		Central(F,F->Raiz[I]);

} /* Imprime */

/* Algoritmo 7.2 */
void Central(Floresta F, long K)
{ 
	TKSIZE Nodo;
	int    E;

	if (K <= 0L)
		return;

	if ((E = Le(F,&Nodo,K)) != 0) {
		printf("*** Erro em Central(%ld) E = %d\n", K, E);
		exit(1);
		}

	Central(F,Nodo.LLink);

	if (Nodo.Status != 'D')
		printf("%-40s %ld\n", Nodo.Key, Nodo.Tag);

	Central(F,Nodo.RLink);

} /* Central */
