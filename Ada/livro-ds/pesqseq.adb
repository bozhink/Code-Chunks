-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte PesqSeq.Adb
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
package body Pesquisa_Sequencial is

	-- Algoritmo 10.1
	procedure Inicializa(T : in out Estrutura) is
	begin
		T.N := 0;
	end Inicializa;

	-- Algoritmo 10.2
	procedure Insere(T : in out Estrutura; K : Key) is
	begin
		if T.N = Max then
			raise Overflow_Estrutura;
		end if;

		T.N      := T.N + 1;
		T.V(T.N) := K;

	end Insere;

	-- Algoritmo 10.3
	function Consulta(T : Estrutura; K : Key) return Natural is
	begin
		for I in T.V'First .. T.N loop
			if T.V(I) = K then
				return I;
			end if;
		end loop;
	
		return T.V'First - 1;

	end Consulta;

	-- Algoritmo 10.4
	procedure Remove(T : in out Estrutura; P : Positive) is
	begin
		if P > T.N then 
			raise Remocao_Invalida;
		end if;

		T.V(P) := T.V(T.N);
		T.N    := T.N - 1;

	end Remove;

	-- Algoritmo 10.5
	procedure Imprime(Msg : String; T : Estrutura) is
	begin
		Put(Msg);

		for I in T.V'First .. T.N loop
			Put(T.V(I),1);
			if I /= T.N then
				Put(',');
			end if;
		end loop;

		New_Line;

	end Imprime;

end Pesquisa_Sequencial;