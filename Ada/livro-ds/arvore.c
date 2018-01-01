/* Source file arvore.c */
#include <stdio.h>
#include <malloc.h>

#define COMPRIMENTO_DA_CHAVE 3
typedef struct Nodo_Arvore {
	char Chave[COMPRIMENTO_DA_CHAVE + 1];
	int  Tag;
	struct Nodo_Arvore *Esquerda;
	struct Nodo_Arvore *Direita;
	} ARVORE, *ARVORE_PTR;


ARVORE_PTR ARVORE_NOVO_NO(char *K, int T)
{
	ARVORE_PTR Temp;

	Temp = (ARVORE_PTR) calloc(1,sizeof(ARVORE));
	if (Temp == NULL)  {
		printf("*** Erro *** Faltou memoria\n");
		exit(1);
		}
	Temp -> Esquerda =
	Temp -> Direita  = NULL;
	Temp -> Tag      = T;
	strcpy(Temp -> Chave, K);
	return Temp;
}


void ARVORE_INICIALIZA(ARVORE_PTR *A)
{
	(*A) = NULL;
}


ARVORE_PTR ARVORE_INSERE(ARVORE_PTR *Raiz, char *K, int T)
{       
	int r;  
	ARVORE_PTR A, Ultimo;                   
	
	if (*Raiz == NULL)
		return *Raiz = ARVORE_NOVO_NO(K, T);
		
	A = *Raiz;		
	
	do {
		Ultimo = A;
		r = strcmp(K, A -> Chave);
		if (r == 0) 
			return A; /* Chave ja existia */
		A = (r < 0) ? A -> Esquerda : A -> Direita;
		} while (A != NULL);

	A = ARVORE_NOVO_NO(K, T);
	if (strcmp(K, Ultimo -> Chave) < 0)
		Ultimo -> Esquerda = A;
	else
		Ultimo -> Direita  = A;

	return A;
}


ARVORE_PTR ARVORE_PESQUISA(ARVORE_PTR Raiz, char *K)
{                       
	int r;
	
	while (Raiz != NULL)  {
		r = strcmp(K, Raiz -> Chave);
		if (!r) 
			return Raiz;
		Raiz = (r < 0) ? Raiz -> Esquerda : Raiz -> Direita;
		}
	
	return NULL;
}


ARVORE_PTR ARVORE_PESQUISA_COM_ANCESTRAL(ARVORE_PTR Raiz
                                        ,ARVORE_PTR *Link_Ancestral
                                        ,char *K)
{                       
	int r;
	
	*Link_Ancestral = NULL;	
	while (Raiz != NULL)  {
		r = strcmp(K, Raiz -> Chave);
		if (!r) 
			return Raiz;
		if (r < 0) {
			*Link_Ancestral = &(Raiz -> Esquerda);
			Raiz = Raiz -> Esquerda;
			}
		else {
			*Link_Ancestral = &(Raiz -> Direita);
			Raiz = Raiz -> Direita;
			}
		}

	printf("*** ERRO *** '%s' nao foi localizado\n", K);
	exit(1);
}


ARVORE_PTR TROCA_POR_MENOR(ARVORE_PTR Q)
{
	ARVORE_PTR A, *Ultimo;
	
	Ultimo = &(Q -> Direita);
	A = Q -> Direita;
	while (!(A -> Esquerda == NULL && A -> Direita == NULL))  {
		if (A -> Esquerda == NULL)  {
			Ultimo = &(A -> Direita);
			A = A -> Direita;        
			}
		else  {
			Ultimo = &(A -> Esquerda);
			A = A -> Esquerda;
			}
		}
	*Ultimo = NULL;
	return A;	
}


void ARVORE_REMOVE(ARVORE_PTR *Raiz, char *K)
{
	ARVORE_PTR *Link_Ancestral, Quem;
	
	Quem = ARVORE_PESQUISA_COM_ANCESTRAL(*Raiz,&Link_Ancestral,K);

	if (Quem -> Esquerda == NULL && Quem -> Direita == NULL) 
		if (Quem == *Raiz) /* Está removendo a raiz da árvore */
			*Raiz = NULL;  /* Que está agora vazia */
		else
			*Link_Ancestral = NULL;			
    else
    	if (Quem -> Esquerda == NULL)
    		*Link_Ancestral = Quem -> Direita;
    	else if (Quem -> Direita == NULL)
    		*Link_Ancestral = Quem -> Esquerda;
		else {	
			*Link_Ancestral = TROCA_POR_MENOR(Quem);
			(*Link_Ancestral) -> Direita  = Quem -> Direita;
			(*Link_Ancestral) -> Esquerda = Quem -> Esquerda;
			}
						
	free (Quem);
}




void ARVORE_CENTRAL(ARVORE_PTR Raiz)
{
	if (Raiz != NULL) {
		ARVORE_CENTRAL(Raiz -> Esquerda);
		printf("%8x %-4s %4d [%8x] %8x\n"
			, Raiz -> Esquerda
			, Raiz -> Chave  
			, Raiz -> Tag         
			, Raiz
			, Raiz -> Direita
			);
		ARVORE_CENTRAL(Raiz -> Direita);
		}
}
		

void main()
{
	ARVORE_PTR Raiz;
	
	ARVORE_INICIALIZA(&Raiz);

	ARVORE_INSERE(&Raiz,"G", 1);
	ARVORE_INSERE(&Raiz,"M", 2);
	ARVORE_INSERE(&Raiz,"H", 3);
	ARVORE_INSERE(&Raiz,"Z", 4);
	ARVORE_INSERE(&Raiz,"F", 5);
	ARVORE_INSERE(&Raiz,"D", 6);
	ARVORE_INSERE(&Raiz,"B", 7);
	ARVORE_INSERE(&Raiz,"A", 8);
	ARVORE_INSERE(&Raiz,"C", 9);
	ARVORE_INSERE(&Raiz,"E",10);

	ARVORE_CENTRAL(Raiz);

	printf("A esta' na posicao %x\n", ARVORE_PESQUISA(Raiz,"A"));

	ARVORE_REMOVE(&Raiz,"F");
	ARVORE_REMOVE(&Raiz,"G");

	ARVORE_CENTRAL(Raiz);

}
	