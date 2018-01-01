-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GFilaC.Adb
with Ada.Text_IO; use Ada.Text_IO;
package body FilaC is  -- Implementa‡ao da interface da fila circular

	-- Implementa‡ao do algor¡tmo 4.5
	procedure Queue(F : in out Fila; D : Tipo_Da_Fila) is
	begin
		-- Verifica overflow de fila circular
		if F.Fim = F.Q'Last then	
			raise Overflow_Na_Fila;
		else
			F.Fim      := F.Fim mod F.Q'Last + 1;
			F.Q(F.Fim) := D;
			F.Tamanho := F.Tamanho + 1;
		end if;
	end Queue;

	-- Implementa‡ao do algor¡tmo 4.6 
	procedure DeQueue(F : in out Fila; R : out Tipo_Da_Fila) is
	begin
		-- Verifica underflow de fila circular
		if F.Tamanho = 0 then
			raise Underflow_Na_Fila;
		else
			R         := F.Q(F.Inicio);
			F.Inicio  := F.Inicio mod F.Q'Last + 1;
			F.Tamanho := F.Tamanho - 1;
		end if;
	end DeQueue;

	function Tamanho(F : Fila) return Natural is
	begin

		return F.Tamanho;

	end Tamanho;

end FilaC;