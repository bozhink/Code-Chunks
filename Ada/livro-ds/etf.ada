-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte ETF.Ada

with Ada.Text_IO, Ada.Integer_Text_IO, Eval_ETF;
use  Ada.Text_IO, Ada.Integer_Text_IO, Eval_ETF;
procedure ETF is
begin
	Inicializa("3+4*(5-1)");
	Put("O resultado de 3+4*(5-1) e': ");
	Put(E,1);
	New_Line;
end ETF;
