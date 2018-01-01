// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TTrie.cpp         

#include "Trie2.h"

void main()
{
	Trie T;
	int K;

	T.Inicializa();

	T.Insere("Fulano de Tal",1010);
	T.Insere("Fulana de Tal",1020);
	T.Insere("Ciclano de Tal",1030);
	T.Insere("Beltrano",1040);
	T.Insere("Pertrano",1050);
	T.Insere("Rulanx de Tal",1060);
	T.Insere("Bulany de Tal",1070);
	T.Insere("Ticlanx de Tal",1080);
	T.Insere("Keltranx",1090);
	T.Insere("Aertranx",1100);

	T.Imprime(T.Raiz,"");

	K = T.Consulta("Ciclano de Tal");
	if (K > 0)
		cout << "Ciclano de Tal tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	if (T.Remove("Ciclano de Tal"))
		cout << "Ciclano de Tal foi removido\n";
	else
		cout << "Nao removeu Ciclano de Tal\n";

	T.Imprime(T.Raiz,"");

} // main 