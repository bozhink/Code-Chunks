// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Arv_Bu2.cpp  

#include "arv_bu2.h"

void Arvore_Busca::Pre_Fixado(Elo R) // Algoritmo 7.1  
{
		if (R != NULL) {
			cout << R -> Chave;
			Pre_Fixado(R -> Esq);
			Pre_Fixado(R -> Dir);
			} 
} // Pre_Fixado  
        
        
void Arvore_Busca::Central(Elo R) // Algoritmo 7.2  
{
	if (R != NULL)  {
		Central(R -> Esq);
		cout << R -> Chave;
		Central(R -> Dir);
		}
} // Central  
        
        
void Arvore_Busca::Pos_Fixado(Elo R)  // Algoritmo 7.3  
{ 
		if (R != NULL) {
			Pos_Fixado(R -> Esq);
			Pos_Fixado(R -> Dir);
			cout << R -> Chave;
			} 
} // Pos_Fixado  
        
        
Arvore_Busca::Arvore_Busca() // Algoritmo 10.9
{
		Raiz = NULL;
} 
        
        
void Arvore_Busca::Insere(Key K)  // Algoritmo 10.10
{
		Elo P, Q;      
		int Itere;

		P = (Elo) calloc(1,sizeof(No));
		if (P == NULL) {
			cout << "*** Insere: Memoria insuficiente";
			cout << " para insercao de " << K << '\n';
			exit(1);
			} 

		P -> Chave = K;
		P -> Esq   = NULL;
		P -> Dir   = NULL;
		P -> Pai   = NULL;

		if (Raiz == NULL)
			Raiz = P;
		else  {
			Itere = TRUE;
			Q     = Raiz;
			while (Itere)  
				if (Q -> Chave > K)
					if (Q -> Esq == NULL) {
						Q -> Esq = P;
						P -> Pai = Q;
						Itere = FALSE;
						}
					else
						Q = Q -> Esq;
				else  // Chave de Q é <= K  
					if (Q -> Dir == NULL) {
						Q -> Dir = P;
						P -> Pai = Q;
						Itere  = FALSE;
						}
					else
						Q = Q -> Dir;
			} 
} // Insere  


// Algoritmo 10.11
Elo Arvore_Busca::Consulta(Key K) 
{
	Elo Q;

	Q = Raiz;
	while (Q != NULL)  
		if (Q -> Chave == K)
			return Q;
		else if (Q -> Chave > K)
			Q = Q -> Esq;
		else
			Q = Q -> Dir;
	return NULL;
} // Consulta  
        
        
// Algoritmo 10.12
Elo Arvore_Busca::Minimo(Elo R)
{  
	Elo M;
	
	M = R;
	while (M -> Esq != NULL) 
		M = M -> Esq;
	return M;
} // Minimo  


// Algoritmo 10.13
Elo Arvore_Busca::Sucessor(Elo Quem)
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
} // Sucessor  


//  Tendo em vista o endereço de um nó, Quem, o campo de ligação de seu
//  ancestral é atualizado com um novo endereço contido em V  
void Arvore_Busca::Atualiza_Sub_Arvore_Pai(Elo Quem,Elo V)
{
		if (Quem -> Pai == NULL || Quem == Raiz)
			Raiz = V;
		else if (Quem -> Pai -> Esq == Quem)
			Quem -> Pai -> Esq = V;
		else
			Quem -> Pai -> Dir = V;

		if (Raiz != NULL)
			Raiz -> Pai = NULL;
} // Atualiza_Sub_Arvore_Pai  


// Algoritmo 10.14
void Arvore_Busca::Remove(Elo Quem)
{
	Elo T;

	if (Quem -> Esq == NULL && Quem -> Dir == NULL)
		// Quem é uma folha  
		Atualiza_Sub_Arvore_Pai(Quem,NULL);
	else if (Quem -> Esq == NULL)
		Atualiza_Sub_Arvore_Pai(Quem,Quem -> Dir);
	else if (Quem -> Dir == NULL)
		Atualiza_Sub_Arvore_Pai(Quem,Quem -> Esq);
	else  {
		T = Sucessor(Quem);
		Atualiza_Sub_Arvore_Pai(T,NULL);
		if ((T -> Esq == NULL) && (T -> Dir == NULL))    {
			Atualiza_Sub_Arvore_Pai(Quem,T);
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

} // Remove  


Elo Arvore_Busca::Le_Raiz()
{
	return Raiz;
}




