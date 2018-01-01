// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TArvoreB.cp

#include "ArvoreB2.H"

void main()
{
	Arvore_B AB;
	int K, Deletados = 0, Ativos = 0;

	AB.Inicializa();

	AB.Insere(&(AB.Raiz),"Fulano de Tal",1010);
	AB.Insere(&(AB.Raiz),"Fulana de Tal",1020);
	AB.Insere(&(AB.Raiz),"Ciclano de Tal",1030);
	AB.Insere(&(AB.Raiz),"Beltrano",1040);
	AB.Insere(&(AB.Raiz),"Pertrano",1050);
	AB.Insere(&(AB.Raiz),"Rulanx de Tal",1060);
	AB.Insere(&(AB.Raiz),"Bulany de Tal",1070);
	AB.Insere(&(AB.Raiz),"Ticlanx de Tal",1080);
	AB.Insere(&(AB.Raiz),"Keltranx",1090);
	AB.Insere(&(AB.Raiz),"Aertranx",1100);

	AB.Imprime(AB.Raiz);

	K = AB.Consulta(AB.Raiz,"Ciclano de Tal");
	if (K > 0)
		cout << "Ciclano de Tal tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	if (AB.Remove(AB.Raiz,"Ciclano de Tal"))
		cout << "Ciclano de Tal foi removido\n";
	else
		cout << "Nao removeu Ciclano de Tal\n";

	AB.Conta(AB.Raiz,&Deletados,&Ativos);
	cout << "Nodos deletados: " << Deletados << 
	        " Nodos ativos: " << Ativos << '\n';
	AB.Squash();
	Deletados = 0;
	Ativos    = 0;
	AB.Conta(AB.Raiz,&Deletados,&Ativos);
	AB.Conta(AB.Raiz,&Deletados,&Ativos);
	cout << "Nodos deletados: " << Deletados << 
	        " Nodos ativos: " << Ativos << '\n';

	K = AB.Consulta(AB.Raiz,"Ciclano de Tal");
	if (K > 0)
		cout << "Ciclano de Tal tem tag " << K << '\n';
	else
		cout << "Nao encontrou Ciclano de Tal\n";

	AB.Imprime(AB.Raiz);

} // main 