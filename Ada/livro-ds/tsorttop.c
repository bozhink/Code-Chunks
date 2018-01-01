/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte SortTopo.Ada    */


/* Alterar o header GrafoDS.h associando 9 a N */

#include "SortTopo.H"

void main()
{
	Grafo (D1);

	Inicializa(D1);

	Conecta(D1,1,2);
	Conecta(D1,2,4);
	Conecta(D1,2,5);
	Conecta(D1,4,7);
	Conecta(D1,5,7);
	Conecta(D1,3,6);
	Conecta(D1,6,8);
	Conecta(D1,6,9);
	Conecta(D1,7,9);

	printf("Dag D1:\n");
	Imprime(D1);
	putchar('\n');

	printf("A ordenacao topologica inversa de D1 e': ");
	Sort_Topologico(D1);
	putchar('\n');

} /* Testa_Ordenacao_Topologica */
