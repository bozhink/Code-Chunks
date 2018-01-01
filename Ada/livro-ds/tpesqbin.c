/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TPesqBin.C      */

/* Utiliza as mesmas definições da pesq. seqüêncial */
#include "pesqseq.h" 

void main()
{
	Estrutura Tab;

	Inicializa(&Tab);

	Insere(&Tab,5);
	Insere(&Tab,1);
	Insere(&Tab,4);
	Insere(&Tab,-1);
	Insere(&Tab,2);

	Imprime("Tab apos a insercao de 5,1,4,-1,2: ", &Tab);

	printf("Consulta(Tab,4) e' igual a %d\n" , Consulta(&Tab,4));

	printf("Consulta(Tab,3) e' igual a %d\n", Consulta(&Tab,3));

	Remove(&Tab,3);

	Imprime("Tab apos a remocao da terceira chave: ", &Tab);

} /* main */