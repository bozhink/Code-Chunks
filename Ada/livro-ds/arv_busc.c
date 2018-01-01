/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Arv_Busc.c      */

#include "arv_busc.h"

void Pre_Fixado(Elo R) /* Algoritmo 7.1 */
{
		if (R != NULL) {
			putchar(R -> Chave);
			Pre_Fixado(R -> Esq);
			Pre_Fixado(R -> Dir);
			} 
} /* Pre_Fixado */
        
        
void Central(Elo R) /* Algoritmo 7.2 */
{
	if (R != NULL)  {
		Central(R -> Esq);
		putchar(R -> Chave);
		Central(R -> Dir);
		}
} /* Central */
        
        
void Pos_Fixado(Elo R)  /* Algoritmo 7.3 */
{ 
		if (R != NULL) {
			Pos_Fixado(R -> Esq);
			Pos_Fixado(R -> Dir);
			putchar(R -> Chave);
			} 
} /* Pos_Fixado */
        
        
void Inicializa(Elo *R) /* Algoritmo 10.9 */
{
		*R = NULL;

} /* Inicializa */
        
        
void Insere(Elo *R, Key K)  /* Algoritmo 10.10 */
{
		Elo P, Q;
		int Itere;

		P = calloc(1,sizeof(No));
		if (P == NULL) {
			printf("*** Insere: Memoria insuficiente");
			printf(" para insercao de %c\n", K);
			exit(1);
			} 

		P -> Chave = K;
		P -> Esq   = NULL;
		P -> Dir   = NULL;
		P -> Pai   = NULL;

		if (*R == NULL)
			*R = P;
		else  {
			Itere = TRUE;
			Q     = *R;
			while (Itere)  
				if (Q -> Chave > K)
					if (Q -> Esq == NULL) {
						Q -> Esq = P;
						P -> Pai = Q;
						Itere = FALSE;
						}
					else
						Q = Q -> Esq;
				else  /* Chave de Q é <= K */
					if (Q -> Dir == NULL) {
						Q -> Dir = P;
						P -> Pai = Q;
						Itere  = FALSE;
						}
					else
						Q = Q -> Dir;
			} 
} /* Insere */


/* Algoritmo 10.11 */
Elo Consulta(Elo R, Key K) 
{
	Elo Q;

	Q = R;
	while (Q != NULL)  
		if (Q -> Chave == K)
			return Q;
		else if (Q -> Chave > K)
			Q = Q -> Esq;
		else
			Q = Q -> Dir;
	return NULL;
} /* Consulta */
        
        
/* Algoritmo 10.12 */
Elo Minimo(Elo R)
{  
	Elo M;
	
	M = R;
	while (M -> Esq != NULL) 
		M = M -> Esq;
	return M;
} /* Minimo */


/* Algoritmo 10.13 */
Elo Sucessor(Elo Quem)
{                         
	Elo S;
	
	if (Quem -> Dir != NULL)
		S = Minimo(Quem -> Dir);
	else { 
		S = Quem -> Pai;
		while (S != NULL)
			if (Quem == S -> Dir) {
				Quem = S;
				S = S -> Pai;
				} 
		}   
	return S;
} /* Sucessor */


/* Tendo em vista o endereço de um nó, Quem, o campo de ligação de seu
   ancestral é atualizado com um novo endereço contido em V */
void Atualiza_Sub_Arvore_Pai(Elo *R,Elo Quem,Elo V)
{
		if (Quem -> Pai == NULL || Quem == *R)
			*R = V;
		else if (Quem -> Pai -> Esq == Quem)
			Quem -> Pai -> Esq = V;
		else
			Quem -> Pai -> Dir = V;

		if (*R != NULL)
			(*R) -> Pai = NULL;
} /* Atualiza_Sub_Arvore_Pai */


/* Algoritmo 10.14 */
void Remove(Elo *R, Elo Quem)
{
	Elo T;

	if (Quem -> Esq == NULL && Quem -> Dir == NULL)
		/* Quem é uma folha */
		Atualiza_Sub_Arvore_Pai(R,Quem,NULL);
	else if (Quem -> Esq == NULL)
		Atualiza_Sub_Arvore_Pai(R,Quem,Quem -> Dir);
	else if (Quem -> Dir == NULL)
		Atualiza_Sub_Arvore_Pai(R,Quem,Quem -> Esq);
	else  {
		T = Sucessor(Quem);
		Atualiza_Sub_Arvore_Pai(R,T,NULL);
		if ((T -> Esq == NULL) && (T -> Dir == NULL))    {
			Atualiza_Sub_Arvore_Pai(R,Quem,T);
			T -> Pai = Quem -> Pai;
			T -> Esq = Quem -> Esq;
			T -> Dir = Quem -> Dir;
			if (T -> Dir == T)
				T -> Dir = NULL;
			if (T -> Esq == T)
				T -> Esq = NULL;
			} 
		else {
			Quem -> Dir   = T -> Dir;
			Quem -> Chave = T -> Chave;
			Quem        = T;
			} 
		}

	free(Quem);

} /* Remove */


