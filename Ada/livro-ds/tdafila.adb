-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAFila.Adb
with Ada.Text_IO; use Ada.Text_IO;
package body Fila_Char is  -- Implementação da interface da Fila

	-- Implementação do algorítmo 4.2
	procedure Queue(F : in out Fila; D : Tipo_Da_Fila) is
	begin
		if F.Fim = F.Q'Last then -- Verifica overflow de Fila 
			Put_Line("*** Overflow na Fila ***");
		else
			F.Fim      := F.Fim + 1;
			F.Q(F.Fim) := D;
		end if;
	end Queue;

	-- Implementação do algorítmo 4.3
	procedure DeQueue(F : in out Fila; R : out Tipo_Da_Fila) is
	begin
		if F.Inicio > F.Fim then	-- Verifica underflow de fila
			Put_Line("*** Underflow na Fila ***");
			R := '?';
		else
			R        := F.Q(F.Inicio);
			F.Inicio := F.Inicio + 1;
		end if;
	end DeQueue;

	function Tamanho(F : Fila) return Natural is
	begin

		return F.Fim - F.Inicio + 1;

	end Tamanho;

end Fila_Char;
