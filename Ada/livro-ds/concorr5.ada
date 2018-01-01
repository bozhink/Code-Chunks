-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Concorr5.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Tasks_Sincronas_2 is

	subtype Vezes is Integer range 1 .. 20;

	procedure Exibe(O_Que : Character) is
	begin
		Put(O_Que);
	end Exibe;

	task type Exibe_Letra is 
		entry Inicia(Letra : Character);
	end Exibe_Letra;

	Exibe_A : Exibe_Letra;
	Exibe_B : Exibe_Letra;

	task body Exibe_Letra is
		Qual_Letra : Character;
	begin
		accept Inicia(Letra : Character) do
			Qual_Letra := Letra;
		end Inicia;
		for I in Vezes loop
			Exibe(Qual_Letra);
		end loop;
	end Exibe_Letra;

begin
	Exibe_A.Inicia('A');
	Exibe_B.Inicia('B');
end Tasks_Sincronas_2;