-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Fatorial.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Fatorial is
	Resultado : Integer;
	function Fatorial(N : Integer) return Integer is
	begin
		Put("Iniciando Fatorial(");
		Put(N,1);
		Put_Line(")");
		if N = 0 then
			Put_Line("retornando 1");


			return 1;
		else
			Put("Executando ");
			Put(N,1);
			Put(" x Fatorial(");
			Put(N,1);
			Put_Line(" - 1);");
			return N * Fatorial(N - 1);
		end if;
	end Fatorial;
begin
	Resultado := Fatorial(3);
	Put("O fatorial de 3 e': ");
	Put(Resultado,2);
	New_Line;
end Testa_Fatorial;