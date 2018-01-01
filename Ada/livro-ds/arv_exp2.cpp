// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Arv_Exp2.c       

#include "arv_exp2.h"


int Arvore_De_Expressao::Calcula(Elo R) // Algoritmo 7.3 Modificado 
{
	int A, B;
	
	if (R != NULL) 
		if ((R -> Esq == NULL) && (R -> Dir == NULL))
			return  R -> Op_Val - '0';
		else {
			A = Calcula(R -> Esq);
			B = Calcula(R -> Dir);
			if (R -> Op_Val == '+')
				return A + B;
			else if (R -> Op_Val == '-')
				return A - B;
			else if (R -> Op_Val == '*')
				return A * B;
			else if (R -> Op_Val == '/') 
				return A / B;
			}
	return 0;
} // Calcula 

int Arvore_De_Expressao::Is_Terminal(Key Ch)
{
	if (((Ch >= 'A') && (Ch <= 'Z')) ||
	    ((Ch >= 'a') && (Ch <= 'z')) ||
	    ((Ch >= '0') && (Ch <= '9'))) 
		return TRUE;
	else
		return FALSE;
} // Is_Terminal 


int Arvore_De_Expressao::Prioridade(Key Op)
{
	if ((Op == '+') || (Op == '-'))
		return 2 * Fator;
	else if ((Op == '*') || (Op == '/'))
		return 3 * Fator;
	else
		return 1 * Fator;
} // Prioridade 


Elo Arvore_De_Expressao::Novo_No(Key K)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL)  {
		cout << "*** Novo_No: Memoria insufi";
		cout << "ciente para insercao de " << K << '\n';
		exit(1);
		}

	if (Raiz == NULL)  {
		Raiz     = P;
		Corrente = P;
		}

	P -> Op_Val = K;
	P -> Esq    = NULL;
	P -> Dir    = NULL;
	P -> Pai    = NULL;
	P -> P      = Prioridade(K);
	return P;
} // Novo_No


void Arvore_De_Expressao::TExp_Insere(Elo Temp)
{
	if (Temp == Raiz)
		return;
		
	if (Is_Terminal(Temp -> Op_Val)) {
		Corrente -> Dir = Temp;
		return;
		}

	if (Is_Terminal(Corrente -> Op_Val))  {
		Temp -> Esq     = Corrente;
		Corrente -> Pai = Temp;
		Raiz            = Temp;
		Corrente        = Temp;
		}
	// É um operador 
	else {
		if (Temp -> P > Corrente -> P)  {
			Temp -> Esq     = Corrente -> Dir;
			Corrente -> Dir = Temp;
			Temp -> Pai     = Corrente;
			Corrente        = Temp;
			}
		else {
			// Encontre o nível adequado 
			while ( 1 )
				if (Corrente -> Pai == NULL)
					break;
				else 
					if (Temp -> P < Corrente -> P) 
						if (Temp -> P > Corrente -> Pai -> P)
							break;
						else
							Corrente = Corrente -> Pai;
					else
						break;
			Temp -> Esq = Corrente;
			if (Corrente == Raiz) 
				Raiz = Temp;
			else {
				if (Corrente -> Pai -> Esq == Corrente)
					Corrente -> Pai -> Esq = Temp;
				else
					Corrente -> Pai -> Dir = Temp;
				Temp -> Pai     = Corrente -> Pai;
				Corrente -> Pai = Temp;
				}
			Corrente = Temp;
			}
	}
} // TExp_Insere 


void Arvore_De_Expressao::Gera_Expressao(char *Exp)
{
	int I;
	Elo Temp;

	Raiz  = NULL; // Inicializa árvore
	Fator = 1;
	for(I = 0; I < strlen(Exp); ++I)
		if (Exp[I] == '(') 
			Fator = Fator * 4;
		else if (Exp[I] == ')') 
			Fator = Fator / 4;
		else {
			Temp = Novo_No(Exp[I]);
			TExp_Insere(Temp);
			}

} // Gera_Expressao 

