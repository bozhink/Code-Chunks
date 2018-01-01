-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GCaminha.Adb
with Ada.Text_IO, Ada.Integer_Text_IO, FilaC;
with Ada.Text_IO, Ada.Integer_Text_IO;
package body Caminhamentos_Em_Grafos is

	-- Algoritmo 6.12
	procedure DFS(G : Grafo; I : Integer) is
	begin
		V(I) := True;
		Put(I,3);
		for J in G'Range loop 
			if Adjacente(G,I,J) then
				if not V(J) then
					DFS(G,J);
				end if;
			end if;
		end loop;
	end DFS;

	-- Algoritmo 6.13
	procedure BFS(G : Grafo; I : Integer) is
		package Fila_Int is new FilaC(Integer);
		use Fila_Int;

		F : Fila;
		X : Integer;		
		V : array(Grafo'Range) of Boolean := (others => False);
	begin
		Put(I,3);
		V(I) := True;
		Queue(F,I);
		while Tamanho(F) > 0 loop
			DeQueue(F,X);
			for J in Grafo'Range loop
				if Adjacente(G,X,J) then
					if not V(J) then
						Put(J,3);
						V(J) := True;
						Queue(F,J);
					end if;
				end if;
			end loop;
		end loop;
	end BFS;
end Caminhamentos_Em_Grafos;