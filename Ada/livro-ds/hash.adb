-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Hash.Adb
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
package body Hash_Aberto is

	-- Algoritmo 10.44
	procedure Inicializa(T : in out Tabela) is
	begin
		T.N := 0;
		for I in T.Bucket'Range loop
			T.Bucket(I) := T.Tab'First - 1;
		end loop;

		for I in 1 .. Tamanho_Tabela -  1 loop
			T.Tab(I).Next := I + 1;
		end loop;
		T.Tab(Tamanho_Tabela).Next := 0;
		
		T.Livre := 1;

	end Inicializa;

	-- Algoritmo 10.45
	function Hash(K : in String) return Integer is
		V : Integer := 0;
	begin
		for I in K'First .. K'Last loop
			V := V + (Character'Pos(K(I)) * I);
		end loop;

		return V mod Valor_Hash;
	
	end Hash;

	-- Algoritmo 10.46
	procedure Insere_Tab(T      : in out Tabela; 
	                     K      : in String; 
	                     Tag    : in Integer; 
	                     Colide : in Integer;
	                     B      : out Integer) is
		Pos : Integer;
	begin
		if T.N >= T.Tab'Last then
			raise Tabela_Overflow;
		end if;

		T.N             := T.N + 1;
		Pos             := T.Livre;
		T.Livre         := T.Tab(Pos).Next;

		T.Tab(Pos).Id   := K;
		T.Tab(Pos).Tag  := Tag;
		T.Tab(Pos).Next := Colide;
		B               := Pos;

	end Insere_Tab;		

	-- Algoritmo 10.47
	function Consulta(T : in Tabela; K : in String) return Integer is
		P : Integer;
	begin
		P := T.Bucket(Hash(K));

		while P >= T.Tab'First loop
			if T.Tab(P).Id = K then
				return T.Tab(P).Tag;
			else
				P := T.Tab(P).Next;
			end if;
		end loop;

		return T.Tab'First - 1;

	end Consulta;

	-- Algoritmo 10.48
	procedure Remove(T : in out Tabela; K : in String; 
	                 R : out Boolean) is
		P, L : Integer;
	begin
		R := True;

		P := T.Bucket(Hash(K));

		if T.Tab(P).Id = K then
			T.Bucket(Hash(K)) := T.Tab(P).Next;
			T.Tab(P).Next     := T.Livre;
			T.Livre           := P;
			T.N               := T.N - 1;
			return;
		end if;
		
		while P >= T.Tab'First loop
		
			if T.Tab(P).Id = K then
				T.Tab(L).Next := T.Tab(P).Next;
				T.Tab(P).Next := T.Livre;
				T.Livre       := P;
				T.N           := T.N - 1;
				return;
			else
				L := P;
				P := T.Tab(P).Next;
			end if;
		end loop;

		R := False;

	end Remove;
	
	-- Algoritmo 10.49
	procedure Insere(T   : in out Tabela; K : in String; 
	                 Tag : in Integer) is
		P, Onde : Integer;
	begin
		Onde := Hash(K);
		if T.Bucket(Onde) < T.Tab'First then
			Insere_Tab(T,K,Tag,-1,T.Bucket(Onde));
		else
			P := T.Bucket(Onde);
			loop
				if T.Tab(P).Next < T.Tab'First then 
					Insere_Tab(T,K,Tag,T.Bucket(Onde),T.Bucket(Onde));
					exit;
				else
					P := T.Tab(P).Next;
				end if;
			end loop;
		end if;

	end Insere;

	-- Algoritmo 10.50
	function Quantidade(T : in Tabela) return Integer is
	begin
		return T.N;

	end Quantidade;

	-- Algoritmo 10.51
	procedure Imprime(T : in Tabela) is
		J : Integer;
	begin
		Put_Line("Tabela com " & Integer'Image(T.N) & " elementos:");

		for I in T.Bucket'Range loop
			J := T.Bucket(I);
			while J > 0 loop
				Put(J,3);
				Put(' ');
				Put(T.Tab(J).Id & ' ');
				Put(T.Tab(J).Tag,6);
				Put(T.Tab(J).Next,6);
				New_Line;
				J := T.Tab(J).Next;
			end loop;
		end loop;

	end Imprime;

end Hash_Aberto;