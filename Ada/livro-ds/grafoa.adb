-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoA.Adb
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Unchecked_Deallocation;
use  Ada.Text_IO, Ada.Integer_Text_IO;
package body Grafo_Lista_Adjacencia is

	-- Cria uma procedure Free para liberar memória para tipos "Elo"
	procedure Free is new
			Ada.Unchecked_Deallocation(No,Elo);

	-- Algoritmo 6.6
	procedure Inicializa(G : in out Grafo) is
	begin
		for I in G'Range loop
			G(I) := null;
		end loop;
	end Inicializa;

	-- Algoritmo 6.7
	procedure Conecta(G : in out Grafo; I, J : Tipo_Dado) is
		P : Elo;
	begin
		P := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado := J;
		P.Link := G(I);
		G(I)    := P;
	end Conecta;

	-- Algoritmo 6.8
	procedure Desconecta(G : in out Grafo; I, J : Tipo_Dado) is
		P, Q : Elo;
	begin
		P := G(I);
		while P /= null loop
			if P.Dado = J then
				exit;
			else
				Q := P;
				P := P.Link;
			end if;
		end loop;
		if P = null then
			raise Operacao_Invalida;
		end if;
		if G(I) = P then
			G(I) := P.Link;
		else
			Q.Link := P.Link;
		end if;
		Free(P);
	end Desconecta;

	-- Algoritmo 6.9
	function Adjacente(G : in Grafo; I, J : Tipo_Dado) return Boolean is
		P : Elo;
	begin
		P := G(I);
		while P /= null loop
			if P.Dado = J then
				return True;
			else
				P := P.Link;
			end if;
		end loop;
		return False;
	end Adjacente;

	-- Algoritmo 6.10 
	procedure Libera_Memoria(G : in out Grafo) is
		P, Q : Elo;
	begin
		for I in G'Range loop
			P    := G(I);
			G(I) := null;
			while P /= null loop
				Q := P;
				P := P.Link;
				Free(Q);
			end loop;
		end loop;
	end Libera_Memoria;

	-- Algoritmo 6.11
	procedure Imprime(G : in Grafo) is
		P : Elo;
	begin
		for I in G'Range loop
			Put(I,1);
			Put(" : ");
			P := G(I);
			while P /= null loop
				put(P.Dado,1);
				P := P.Link;
				if P /= null then
					Put(", ");
				end if;
			end loop;
			if G(I) = null then
				Put("nao tem adjacencia");
			end if;
			Put_Line(".");
		end loop;
	end Imprime;
end Grafo_Lista_Adjacencia;