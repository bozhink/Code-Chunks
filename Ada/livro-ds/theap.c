/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte THeap.c         */

#include "Heap.H"

void main()
{
	Heap H1;

	Inicializa(&H1);
	Insere(&H1,40);
	Insere(&H1,12);
	Insere(&H1,35);
	Insere(&H1,15);
	Insere(&H1,2);
	Insere(&H1,20);
	Insere(&H1,17);
	Insere(&H1,19);
	Insere(&H1,8);
	Imprime(&H1,"Heap apos a insercao de 40,12,35,2,20,17,8,19,15:");
	printf("Remove(H1) = %d\n", Remove(&H1));
	Imprime(&H1,"Heap apos remocao do maior elemento:");

} /* Testa_Heap */
