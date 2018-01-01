-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Hash.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Hash_Aberto;
use Ada.Integer_Text_IO, Ada.Text_IO;
procedure Testa_Hash is
	package Hash_14 is new Hash_Aberto
		(Tamanho_Key=>14,Tamanho_Tabela=>81,Valor_Hash=>19);
	use Hash_14;

	Ta : Tabela;
	K  : Integer;
	Re : Boolean;
begin
	Inicializa(Ta);
	
	Insere(Ta,"Fulano de Tal ",1010);
	Insere(Ta,"Fulana de Tal ",1020);
	Insere(Ta,"Ciclano de Tal",1030);
	Insere(Ta,"Beltrano      ",1040);
	Insere(Ta,"Pertrano      ",1050);
	Insere(Ta,"Rulanx de Tal ",1060);
	Insere(Ta,"Bulany de Tal ",1070);
	Insere(Ta,"Ticlanx de Tal",1080);
	Insere(Ta,"Keltranx      ",1090);
	Insere(Ta,"Aertranx      ",1100);

	Imprime(Ta);

	K := Consulta(Ta,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	Remove(Ta,"Ciclano de Tal",Re);
	if Re then
		Put_Line("Ciclano de Tal foi removido");
	else
		Put_Line("Nao removeu Ciclano de Tal");
	end if;

	K := Consulta(Ta,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	Imprime(Ta);

end Testa_Hash;