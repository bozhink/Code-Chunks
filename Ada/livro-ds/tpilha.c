/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte tpilha.c        */

#include "pilha.h"

void main()
{
	Pilha Pilha_1, Pilha_2;	/* Declara duas pilhas     */
	char Estava_No_Topo;   	/* Armazena quem estava no 
	                        	   topo de uma pilha   */
	int I;					/* Auxiliar para loop      */

	Inicializa(&Pilha_1);
	Inicializa(&Pilha_2);

	Push(&Pilha_1,'A');
	Push(&Pilha_1,'B');
	Push(&Pilha_1,'C');
	Push(&Pilha_1,'D');
	
	Push(&Pilha_2,'A');

	for(I = 1; I <= 4; ++I) { /* Exibe o conteúdo de Pilha_1 */
		Pop(&Pilha_1, &Estava_No_Topo);
		printf("%d %c\n",5 - I, Estava_No_Topo);
		}
	
	for(I = 1; I <= 4; ++I) { /* Exibe o conteúdo de Pilha_2 */
		Pop(&Pilha_2, &Estava_No_Topo);
		printf("%d %c\n",5 - I, Estava_No_Topo);
		}
	
} /* main */
