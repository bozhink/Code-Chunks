// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte TFlorest.cpp

#include "Florest2.h"

void main()
{
	Florest F;
	long    K;

	F.Inicializa("ADISCO.DAT");

	F.Insere("Fulano de Tal",1010);
	F.Insere("Fulana de Tal",1020);
	F.Insere("Ciclano de Tal",1030);
	F.Insere("Beltrano",1040);
	F.Insere("Pertrano",1050);

	F.Fecha();

	F.Abre("ADISCO.DAT");

	F.Imprime();
	
	if ((K = F.Consulta("Ciclano de Tal")) >= 0L) 
		cout << "Ciclano de Tal" << " tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	if (F.Remove("Ciclano de Tal") == 0) 
		cout << "Ciclano de Tal" << " foi removido\n";
	else
		cout << "Nao removeu Ciclano de Tal\n";

	if ((K = F.Consulta("Ciclano de Tal")) >= 0L) 
		cout << "Ciclano de Tal" << " tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	F.Fecha();

	F.Squash("ADISCO.DAT");

	F.Abre("ADISCO.DAT");

	F.Imprime();

	F.Fecha();
}