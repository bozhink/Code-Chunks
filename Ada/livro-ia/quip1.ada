-- (C) 1996 Arthur Vargas Lopes
-- Arquivo fonte QuiP1.Ada
with Ada.Text_IO, Ada.Float_Text_IO;
procedure Quinto_Programa_1 is

	Centigrados	: Float;
	Kelvin		: Float;

begin
	Kelvin := Centigrados + 273.15; -- Converte temperatura de centígrados
	                                -- para Kelvin.

	Ada.Float_Text_IO.Put(Kelvin,Aft=>2,Exp=>0); -- Exibe na tela a temperatura em graus kelvin.

	Ada.Text_IO.New_Line; -- Move o cursor para o início da próxima 
	                      -- linha na tela.

end Quinto_Programa_1;