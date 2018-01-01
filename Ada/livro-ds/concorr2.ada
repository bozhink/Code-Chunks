-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Concorr2.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Tasks_Asincronas_2 is

	subtype Vezes is Integer range 1 .. 20;

	procedure Exibe(O_Que : Character) is
	begin
		Put(O_Que);
	end Exibe;

	task Exibe_B;

	task Exibe_A;

	task body Exibe_B is
	begin
		for I in Vezes loop
			Exibe('B');
		end loop;
	end Exibe_B;

	task body Exibe_A is 
	begin
		for I in Vezes loop
			Exibe('A');
		end loop;
	end Exibe_A;
begin
	null;
end Tasks_Asincronas_2;