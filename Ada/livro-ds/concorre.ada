-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Concorre.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Tasks_Asincronas is

	subtype Vezes is Integer range 1 .. 20;

	task Exibe_B; -- Especificação de task

	task body Exibe_B is -- Corpo de task
		-- Parte declarativa
	begin
		for I in Vezes loop
			Put('B');
		end loop;
	end Exibe_B;

begin

		for I in Vezes loop
			Put('A');
		end loop;
end Tasks_Asincronas;