-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoV.Adb
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
package body Grafo_Valorado is

	-- Algoritmo 6.14
	procedure Inicializa(G : in out Grafo) is
	begin
		for I in G'Range loop
			for J in G'Range loop
				G(I,J) := Tipo_Dado(0);
			end loop;
		end loop;
	end Inicializa;

	-- Algoritmo 6.15
	procedure Conecta(G : in out Grafo; I, J : Integer; V : Tipo_Dado) is
	begin
		G(I,J) := V;

	end Conecta;

	-- Algoritmo 6.16
	procedure Desconecta(G : in out Grafo; I, J : Integer) is
	begin
		G(I,J) := Tipo_Dado(0);

	end Desconecta;

	-- Algoritmo 6.17
	function Adjacente(G : in Grafo; I, J : Integer) return Tipo_Dado is
	begin
		return G(I,J);

	end Adjacente;

	-- Algoritmo 6.18
	procedure Imprime(G : in Grafo) is
	begin
		Put(" ");
		for I in G'Range loop
			Put(I,3);
		end loop;
		New_Line;
		for I in G'Range loop
			Put(I,1);
			for J in G'Range loop
				Put(Adjacente(G,I,J),3);
			end loop;
			New_Line;
		end loop;
	end Imprime;

	-- Algoritmo 6.19 
	procedure Menores_Custos(G : Grafo; C : in out Grafo) is
	begin
		for I in G'Range loop
			for J in G'Range loop
				if G(I,J) /= Tipo_Dado(0) then
					C(I,J) := G(I,J);
				else
					C(I,J) := MValor;
				end if;
			end loop;
		end loop;

		for I in G'Range loop
			C(I,I) := Tipo_Dado(0);
		end loop;

		for K in G'Range loop
			for I in G'Range loop
				for J in G'Range loop
					if (C(I,K) + C(K,J)) < C(I,J) then
						C(I,J) := C(I,K) + C(K,J);
					end if;
				end loop;
			end loop;
		end loop;

	end Menores_Custos;

	-- Algoritmo 6.20 
	procedure Gera_Caminhos(G : Grafo; P : in out Grafo) is

		C       : Grafo;
	begin
		for I in G'Range loop
			for J in G'Range loop 
				P(I,J) := Tipo_Dado(0);
				if G(I,J) /= Tipo_Dado(0) then
					C(I,J) := G(I,J);
				else
					C(I,J) := MValor;
				end if;
			end loop;
		end loop;

		for I in G'Range loop
			C(I,I) := Tipo_Dado(0);
		end loop;

		for K in G'Range loop
			for I in G'Range loop
				for J in G'Range loop
					if (C(I,K) + C(K,J)) < C(I,J) then
						C(I,J) := C(I,K) + C(K,J);
						P(I,J) := K;
					end if;
				end loop;
			end loop;
		end loop;

	end Gera_Caminhos;

	-- Algoritmo 6.21 
	procedure Exibe_Caminho(P : Grafo; I, J, F : Integer := 1) is

		K : Tipo_Dado;
	begin
		if F = 1 then -- Exibe o vértice inicial 
			Put(I, 3);
		end if;

		K := P(I,J);

		if K /= 0 then 
			Exibe_Caminho(P,I,K,F+1);
			Put(K, 3);
			Exibe_Caminho(P,K,J,F+1);
		end if;

		if F = 1 then -- Exibe o vértice final
			Put(J, 3);
			New_Line;
		end if;

	end Exibe_Caminho;

	-- Algoritmo 6.22 
	procedure Menor_Caminho(G : Grafo; I, J : Integer) is

		P : Grafo;
	begin
		Put("O menor caminho entre ");
		Put(I,1);
		Put(" e ");
		Put(J,1);
		Put(" e': ");

		Gera_Caminhos(G,P);

		Exibe_Caminho(P,I,J);

	end Menor_Caminho;

	-- Algoritmo 6.23
	procedure Gera_Conectividade(G : Grafo; Cd : in out Grafo) is
	begin
		Put_Line("Matriz de conectividade:");

		for I in G'Range loop
			for J in G'Range loop
				if G(I,J) > 0 then
					Cd(I,J) := Tipo_Dado(1);
				else
					Cd(I,J) := Tipo_Dado(0);
				end if;
			end loop;
		end loop;

		for K in G'Range loop
			for I in G'Range loop
				for J in G'Range loop
					if Cd(I,J) = Tipo_Dado(0) then
						if (Cd(I,K) > Tipo_Dado(0)) and
						   (Cd(K,J) > Tipo_Dado(0)) then
							Cd(I,J) := Tipo_Dado(1);
						end if;
					end if;
				end loop;
			end loop;
		end loop;

	end Gera_Conectividade;

	-- Algoritmo 6.24 
	function Centro(G : Grafo) return Integer is
		C    : Grafo;
		E    : array(Grafo'Range) of Tipo_Dado;
		X    : Tipo_Dado;
	begin
		Menores_Custos(G,C);

		for I in G'Range loop
			E(I) := Tipo_Dado(0);
		end loop;

		for J in G'Range loop
			for I in G'Range loop
				if C(I,J) > E(J) then
					E(J) := C(I,J);
				end if;
			end loop;
		end loop;

		X := MValor;

		for I in G'Range loop 
			Put("          E(");
			Put(I,1);
			Put(") = ");
			Put(E(I),1);
			New_Line;
			if E(I) < X then
				X := E(I);
			end if;
		end loop;

		return X;

	end Centro;

	procedure Put(Item : Float; Fore : Positive; Aft : Positive := 2) is
	begin
		Ada.Float_Text_IO.Put(Item,Fore,Aft);
	end Put;

end Grafo_Valorado;