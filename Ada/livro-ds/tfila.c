/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TFila.C         */

#include "fila.h"

void main()
{
	Fila Fila_1, Fila_2;	/* Declara duas Filas      */
	char Estava_No_Topo;   	/* Armazena quem estava na 
	                        	   frente de uma Fila  */
	int I;					/* Auxiliar para loop      */

	Inicializa(&Fila_1);
	Inicializa(&Fila_2);

	Queue(&Fila_1,'A');
	Queue(&Fila_1,'B');
	Queue(&Fila_1,'C');
	Queue(&Fila_1,'D');
	
	Queue(&Fila_2,'A');

	/* Exibe o conteúdo de Fila_1 */
	for(I = Fila_1.Inicio; I <= Fila_1.Fim; ++I) { 
		DeQueue(&Fila_1, &Estava_No_Topo);
		printf("%d %c\n", I, Estava_No_Topo);
		}
	
	for(I = 1; I <= 4; ++I) { /* Exibe o conteúdo de Fila_2 */
		DeQueue(&Fila_2, &Estava_No_Topo);
		printf("%d %c\n", I, Estava_No_Topo);
		}
	
} /* main */
