pragma List(On); -- Arquivo fonte ErroTipo.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
procedure Demonstra_Falta_De_Conversao is
	Numero_Inteiro : Integer;
	Numero_Float  : Float := 10.1;
begin
	Numero_Inteiro := Numero_Float;
	Ada.Integer_Text_IO.Put(Numero_Inteiro);
	Ada.Text_IO.New_Line;
end Demonstra_Falta_De_Conversao;