-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte PesqBin.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
with Pesquisa_Binaria;

procedure Testa_Pesquisa_Binaria is

	package EB_Int is new Pesquisa_Binaria(7,Integer);
	use EB_Int;

	Tab : Estrutura;
begin
	Insere(Tab,5);
	Insere(Tab,1);
	Insere(Tab,4);
	Insere(Tab,-1);
	Insere(Tab,2);

	Imprime("Tab apos a insercao de 5,1,4,-1,2: ", Tab);

	Put("Consulta(Tab,4) e' igual a ");
	Put(Consulta(Tab,4),1);
	New_Line;

	Put("Consulta(Tab,3) e' igual a ");
	Put(Consulta(Tab,3),1);
	New_Line;

	Remove(Tab,3);

	Imprime("Tab apos a remocao da terceira chave: ", Tab);

end Testa_Pesquisa_Binaria;