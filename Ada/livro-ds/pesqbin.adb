-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte PesqBin.Adb
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
package body Pesquisa_Binaria is

	-- Algoritmo 10.1
	procedure Inicializa(T : in out Estrutura) is
	begin
		T.N := 0;

	end Inicializa;

	-- Algoritmo 10.6
	procedure Insere(T : in out Estrutura; K : Key) is
		I : Integer;
	begin
		if T.N = Max then
			raise Overflow_Estrutura;
		end if;

		-- Encontra a posição correta para inserir K 
		I := 1;
		while (I < T.N) and (K > T.V(I)) loop
			I := I + 1;
		end loop;

		-- Move as chaves a direita de I - 1 uma posiçao
		-- para a direita 
		for J in reverse I ..  T.N loop
			T.V(J+1) := T.V(J);
		end loop;

		T.N    := T.N + 1;
		T.V(I) := K;

	end Insere;

	-- Algoritmo 10.7
	function Consulta(T : Estrutura; K : Key) return Natural is
		L, H, M : Integer;
	begin
		L := 1;
		H := T.N;

		while L <= H loop

			M := (L + H) / 2;

			if K = T.V(M) then
				return M;
			elsif K < T.V(M) then
				H := M - 1;
			else
				L := M + 1;
			end if;
		end loop;

		return 0;

	end Consulta;

	-- Algoritmo 10.8
	procedure Remove(T : in out Estrutura; P : Positive) is
	begin
		if P > T.N then 
			raise Remocao_Invalida;
		end if;

		for I in P .. T.N - 1 loop
			T.V(I) := T.V(I+1);
		end loop;

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

end Pesquisa_Binaria;