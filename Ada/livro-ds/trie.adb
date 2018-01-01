-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Trie.Adb
with Ada.Text_io, Ada.Integer_Text_IO, Ada.Characters.Handling;
use  Ada.Text_io, Ada.Integer_Text_IO, Ada.Characters.Handling;
package body Trie is

	PA : Integer := Character'Pos('A');

	-- Algoritmo 10.39 
	procedure Inicializa(R : in out Elo) is
	begin
		R := new No;
		if R = null then
			raise Storage_Error;
		end if;

		for I in 1 .. Max loop
			R.C(I) := null;
		end loop;

		R.Tag := 0;

	end Inicializa; 

	-- Algoritmo 10.40 
	procedure Insere(R : Elo; K : String; Tag : Integer) is
		P, Q : Elo;
		J    : Integer;
		L    : Character;
	begin
		P := R;
		for I in K'Range loop
			L := To_Upper(K(I));
			if (L >= 'A') and (L <= 'Z') then
				J := Character'Pos(L) - Pa + 1;
			else
				J := Max;
			end if;

			if P.C(J) = null then
				Q := new No;
				if Q = null then
					raise Storage_Error;
				end if;
				for M in 1 .. Max loop
					Q.C(M) := null;
				end loop;
				Q.Tag  := 0;
				P.C(J) := Q;
			end if;
			P := P.C(J);
		end loop;

		if P.Tag > 0 then
			raise Operacao_Invalida;
		end if;

		P.Tag := Tag;

	end Insere; 

	-- Algoritmo 10.41 
	function Consulta(R : Elo; K : String) return Integer is
		P    : Elo;
		I, J : Integer;
		L    : Character;
	begin
		P        := R;

		I        := K'First;
		while I <= K'Last loop
			L := To_Upper(K(I));
			if (L >= 'A') and (L <= 'Z') then
				J := Character'Pos(L) - PA + 1;
			else
				J := Max;
			end if;

			if P.C(J) = null then
				return 0;
			end if;

			P := P.C(J);
			I := I + 1;
		end loop;

		if (P.Tag > 0) and I = (K'Last + 1) then
			return P.Tag;
		else
			return 0;
		end if;

	end Consulta; 

	-- Algoritmo 10.42 
	function Remove(R : Elo; K : String) return Boolean is
		P    : Elo;
		I, J : Integer;
		L    : Character;
	begin
		P        := R;

		I        := K'First;
		while I <= K'Last loop
			L := To_Upper(K(I));
			if (L >= 'A') and (L <= 'Z') then
				J := Character'Pos(L) - PA + 1;
			else
				J := Max;
			end if;

			if P.C(J) = null then
				return False;
			end if;

			P := P.C(J);
			I := I + 1;
		end loop;

		if P.Tag > 0 then
			P.Tag := 0;
			return True;
		end if;

		return False;

	end Remove; 


	-- Algoritmo 10.43 
	procedure Imprime(P : Elo; K : String) is
	begin
		if P /= null then

			if P.Tag > 0 then
				Put(P.Tag,4);
				Put(' ');
				Put_Line(K);
			end if;

			for I in 1 .. Max loop
				if I = Max then
					Imprime(P.C(I),K & ' ');
				else
					Imprime(P.C(I),K & 
					    Character'Val(I + PA - 1));
				end if;
			end loop;
		end if;

	end Imprime;

end Trie;
