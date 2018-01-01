-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ArvoreB.Ada

with Ada.Text_IO, Ada.Integer_Text_IO, Arvore_B;
use  Ada.Text_IO, Ada.Integer_Text_IO, Arvore_b;
procedure Testa_Arvore_B is

	Header    : Elo;
	K         : Integer;
	Ativos    : Integer := 0;
	Deletados : Integer := 0;
begin
	
	Inicializa(Header);

	Insere(Header,"Fulano de Tal ",1010);
	Insere(Header,"Fulana de Tal ",1020);
	Insere(Header,"Ciclano de Tal",1030);
	Insere(Header,"Beltrano      ",1040);
	Insere(Header,"Pertrano      ",1050);
	Insere(Header,"Rulanx de Tal ",1060);
	Insere(Header,"Bulany de Tal ",1070);
	Insere(Header,"Ticlanx de Tal",1080);
	Insere(Header,"Keltranx      ",1090);
	Insere(Header,"Aertranx      ",1100);

	Imprime(Header);

	K := Consulta(Header,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	if Remove(Header,"Ciclano de Tal") then
		Put_Line("Ciclano de Tal foi removido");
	else
		Put_Line("Nao removeu Ciclano de Tal");
	end if;

	K := Consulta(Header,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	Conta(Header,Deletados,Ativos);
	Put("Nodos deletados: ");
	Put(Deletados,1);
	Put(" Nodos ativos: ");
	Put(Ativos,1);
	New_Line;
	Squash(Header);
	Deletados := 0;
	Ativos    := 0;
	Conta(Header,Deletados,Ativos);
	Put("Nodos deletados: ");
	Put(Deletados,1);
	Put(" Nodos ativos: ");
	Put(Ativos,1);
	New_Line;

	Imprime(Header);

end Testa_Arvore_B;
