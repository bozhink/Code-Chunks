// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte THash.cpp         

#include "hash2.h"

Hash_Aberto<14,81,19> HA;

void main()
{
	int K;
	int Re;

	HA.Inicializa();

	HA.Insere("Fulano de Tal ",1010);
	HA.Insere("Fulana de Tal ",1020);
	HA.Insere("Ciclano de Tal",1030);
	HA.Insere("Beltrano      ",1040);
	HA.Insere("Pertrano      ",1050);
	HA.Insere("Rulanx de Tal ",1060);
	HA.Insere("Bulany de Tal ",1070);
	HA.Insere("Ticlanx de Tal",1080);
	HA.Insere("Keltranx      ",1090);
	HA.Insere("Aertranx      ",1100);

	HA.Imprime();

	K = HA.Consulta("Ciclano de Tal");
	if (K > 0)
		cout << "Ciclano de Tal tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	HA.Remove("Ciclano de Tal",&Re);
	if (Re)
		cout << "Ciclano de Tal foi removido\n";
	else
		cout << "Nao removeu Ciclano de Tal\n";

	K = HA.Consulta("Ciclano de Tal");
	if (K > 0)
		cout << "Ciclano de Tal tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	HA.Imprime();

} // main 
