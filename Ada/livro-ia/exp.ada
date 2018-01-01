-- Arquivo fonte Exp.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Demonstra_Algumas_Expressoes is
	subtype Intervalo is Integer range 2 .. 16;
	A, B, C : Integer;
	D       : Boolean;
begin
	A := abs(-4); -- Fator de uma express�o simples

	B := 4 * A; -- Termo de uma express�o simples

	-- Express�o l�gica
	D := (A = 4) -- Rela��o
	       and then (B / 2) = 8;
	     
	Put("2 ");
	if 2 not in Intervalo then
		Put("nao ");
	end if;
	Put("pertence ao intervalo ");
	Put(A / 2, 1);
	Put(" .. ");
	Put(B,1);
	New_Line;

	if D then
		Put_Line("A = 4 e (B / 2) = 8");
	else
		Put_Line("Nao e' verdade que A = 4 e (B / 2) = 8");
	end if;
end Demonstra_Algumas_Expressoes;
