// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte THeap.c         

#include "Heap2.H"

Heap <int,12,99> H1;

void main()
{
	try {
		H1.Insere(40);
		H1.Insere(12);
		H1.Insere(35);
		H1.Insere(15);
		H1.Insere(2);
		H1.Insere(20);
		H1.Insere(17);
		H1.Insere(19);
		H1.Insere(8);
		}
	catch(char *msg) {
		cout << "Erro com operacao da heap: " << msg << '\n';
		}

	H1.Imprime("Heap apos a insercao de 40,12,35,2,20,17,8,19,15:");

	try {
		cout << "Remove(H1) = " << H1.Remove() << '\n';
		}
	catch(char *msg) {
		cout << "Erro com operacao da heap: " << msg << '\n';
		}

	H1.Imprime("Heap apos remocao do maior elemento:");

} // Testa_Heap
