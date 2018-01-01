-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SortTopo.Adb

with Ada.Integer_Text_IO;
use  Ada.Integer_Text_IO;
package body Ordenacao_Topologica is

	procedure Sort_Topologico(D : Grafo) is

		V : array(D'Range) of Boolean;

		-- Sub-algoritmo 6.25.1
		procedure Sort(D : Grafo; I : Integer) is
		begin
			V(I) := True;

			for J in D'Range loop
				if Adjacente(D,I,J) then
					if (not V(J)) then
						Sort(D,J);
					end if;
				end if;
			end loop;

			Put(I, 3);
		end Sort;
	begin
		-- Inicializa vetor de visitados 
		for I in D'Range loop
			V(I) := False;
		end loop;

		for I in D'Range loop
			if (not V(I)) then
				Sort(D,I);
			end if;
		end loop;

	end Sort_Topologico;

end Ordenacao_Topologica;