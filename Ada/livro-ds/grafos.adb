-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoS.Adb
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
package body Grafo_Simples is

	-- Algoritmo 6.1
	procedure Inicializa(G : in out Grafo) is
	begin
		for I in G'Range loop
			for J in G'Range loop
				G(I,J) := False;
			end loop;
		end loop;
	end Inicializa;

	-- Algoritmo 6.2
	procedure Conecta(G : in out Grafo; I, J : Integer) is
	begin
		G(I,J) := True;
	end Conecta;

	-- Algoritmo 6.3
	procedure Desconecta(G : in out Grafo; I, J : Integer) is
	begin
		G(I,J) := False;
	end Desconecta;

	-- Algoritmo 6.4
	function Adjacente(G : in Grafo; I, J : Integer) return Boolean is
	begin
		return G(I,J);
	end Adjacente;

	-- Algoritmo 6.5 
	procedure Imprime(G : in Grafo) is
	begin
		Put(" ");
		for I in G'Range loop
			Put(I,2);
		end loop;
		New_Line;
		for I in G'Range loop
			Put(I,1);
			for J in G'Range loop
				if Adjacente(G,I,J) then
					Put(" 1");
				else
					Put(" 0");
				end if;
			end loop;
			New_Line;
		end loop;
	end Imprime;
end Grafo_Simples;