-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Trie.Ada
with Ada.Text_io, Ada.Integer_Text_IO, Trie;
use  Ada.Text_io, Ada.Integer_Text_IO, Trie;
procedure Pesquisa_Por_Trie is

	Raiz      : Elo;
	K         : Integer;
begin
	Inicializa(Raiz);

	Insere(Raiz,"Fulano de Tal",1010);
	Insere(Raiz,"Fulana de Tal",1020);
	Insere(Raiz,"Ciclano de Tal",1030);
	Insere(Raiz,"Beltrano",1040);
	Insere(Raiz,"Pertrano",1050);
	Insere(Raiz,"Rulanx de Tal",1060);
	Insere(Raiz,"Bulany de Tal",1070);
	Insere(Raiz,"Ticlanx de Tal",1080);
	Insere(Raiz,"Keltranx",1090);
	Insere(Raiz,"Aertranx",1100);

	Imprime(Raiz,"");

	K := Consulta(Raiz,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	if Remove(Raiz,"Ciclano de Tal") then
		Put_Line("Ciclano de Tal foi removido");
	else
		Put_Line("Nao removeu Ciclano de Tal");
	end if;

	K := Consulta(Raiz,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	Imprime(Raiz,"");

end Pesquisa_Por_Trie;
