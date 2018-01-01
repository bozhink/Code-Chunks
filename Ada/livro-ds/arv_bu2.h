// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Arv_Bu2.h 

#ifndef ARVORE_DE_BUSCA
#define  ARVORE_DE_BUSCA
                            
#include <iostream.h>
#include <malloc.h>
#include <process.h>
                            
#define Key char

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

typedef struct no_arvore_de_busca {
	struct no_arvore_de_busca *Esq;	
	Key                       Chave;
	struct no_arvore_de_busca *Dir;	
	struct no_arvore_de_busca *Pai;	
	} No, *Elo;


class Arvore_Busca 
{
public:
	Arvore_Busca();  // Construtor

	void Pre_Fixado(Elo R); 
	void Central(Elo R); 
	void Pos_Fixado(Elo R);
	void Insere(Key K); 
	Elo Consulta(Key K);
	Elo Minimo(Elo R);
	Elo Sucessor(Elo Quem);
	void Remove(Elo Quem);  
	Elo Le_Raiz();
private:    
	void Atualiza_Sub_Arvore_Pai(Elo Quem,Elo V);
 	Elo Raiz;
};

#endif
