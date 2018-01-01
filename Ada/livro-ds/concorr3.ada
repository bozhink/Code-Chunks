-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Concorr3.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Tasks_Asincronas_3 is

	subtype Vezes is Integer range 1 .. 20;

	procedure Exibe(O_Que : Character) is
	begin
		Put(O_Que);
	end Exibe;

	task type Exibe_Letra(Qual_Letra : Character);

	Exibe_A : Exibe_Letra('A');
	Exibe_B : Exibe_Letra('B');

	task body Exibe_Letra is
	begin
		for I in Vezes loop
			Exibe(Qual_Letra);
		end loop;
	end Exibe_Letra;

begin
	null;
end Tasks_Asincronas_3;