-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Imp_Vet.Adb
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Imp_Vet(Msg : String; V : Vetor) is

	-- para o caso quando V armazena valores Float
	procedure Put(Item : Float; Width : Positive) is
	begin
		Ada.Float_Text_IO.Put(Item,Width,2,0);
	end Put;
begin
	Put(Msg);
	for I in V'Range loop
		Put(V(I),1);
		if I /= V'Last then
			Put(',');
		end if;
	end loop;
	New_Line;
end Imp_Vet;
