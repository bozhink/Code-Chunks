-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAPilha.Ads
with Ada.Text_IO; use Ada.Text_IO;
package body Pilha_Char is  -- Implementa��o da interface da pilha

	-- Implementa��o do algor�tmo 3.1 
	procedure Inicializa(P : in out Pilha) is
	begin
		P.Sp := Intervalo_Pilha'First - 1;
	end Inicializa;

	-- Implementa��o do algor�tmo 3.2
	procedure Push(P : in out Pilha; D : Tipo_Da_Pilha) is
	begin
		if P.Sp = Intervalo_Pilha'Last then	-- Verifica overflow
								-- de pilha 
			Put_Line("*** Overflow na pilha ***");
		else
			P.Sp := P.Sp + 1;
			P.V(P.Sp) := D;
		end if;
	end Push;

	-- Implementa��o do algor�tmo 3.3 
	procedure Pop(P : in out Pilha; R : out Tipo_Da_Pilha) is
	begin
		if P.Sp < Intervalo_Pilha'First then	-- Verifica underflow
		                                       -- de pilha 
			Put_Line("*** Underflow na pilha ***");
			R := '?';
		else
			R := P.V(P.Sp);
			P.Sp := P.Sp - 1;
		end if;
	end Pop;
end Pilha_Char;