-- Arquivo fonte Pesquis2.Ada
with Ada.Text_IO, Ada.Integer_Text_IO
                , Ada.Float_Text_IO; 
use  Ada.Text_IO, Ada.Integer_Text_IO
                , Ada.Float_Text_IO; 
procedure Pesquisa_2 is
	subtype Chave_De_Pesquisa is Integer;
	type Elemento is record
		Codigo : Chave_De_Pesquisa;
		Saldo  : Float;
		end record;
	type Tabela is array(Integer range <>) 
		of Elemento;
	T   : Tabela(1..4);
	C   : Chave_De_Pesquisa;
	Pos : Integer;
begin	
	T := ((1010,  20.00)
	     ,(1030, 300.21)
	     ,(1050,  50.80)
	     ,(1070,1007.59));
	
	Put("Entre com o codigo de uma conta: ");
	Get(C);
	Pos := 0;
	for I in T'Range loop
		if T(I).Codigo = C then
			Pos := I;
			exit;
		end if;
	end loop;
		
	Put("A conta ");
	Put(Item=>C,Width=>1);
	if Pos = 0 then
		Put_Line(" nao foi encontrada.");
	else
		Put(" tem saldo ");
		Put(T(Pos).Saldo,Fore=>5,Aft=>2,Exp=>0);
		New_Line;
	end if;
end Pesquisa_2;