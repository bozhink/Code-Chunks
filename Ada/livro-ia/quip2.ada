-- (C) 1996 Arthur Vargas Lopes
-- Arquivo fonte QuiP2.Ada
with Ada.Text_IO, Ada.Float_Text_IO;
procedure Quinto_Programa_2 is

	Centigrados	: Float := 20.0;
	Kelvin		: Float;

begin

	Kelvin := Centigrados + 273.15; -- Converte temperatura de centígrados
	                                --para kelvin.

	Ada.Float_Text_IO.Put(Kelvin,Aft=>2,Exp=>0); -- Exibe na tela a temperatura em graus Kelvin.

	Ada.Text_IO.New_Line; -- Move o cursor para o início da próxima 
	                      -- linha na tela.

end Quinto_Programa_2;