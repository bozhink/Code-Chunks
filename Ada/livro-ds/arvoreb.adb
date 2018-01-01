-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ArvoreB.Adb

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Unchecked_Deallocation;
use  Ada.Text_IO, Ada.Integer_Text_IO;
package body Arvore_B is

	-- Cria a procedure Free para liberar memória para tipos "Elo"
	procedure Free is new
			Ada.Unchecked_Deallocation(No,Elo);

	-- Algoritmo 10.29 
	procedure Init_C(X : Elo) is
	begin
		for I in 1 .. Sons loop
			X.C(I) := null;
		end loop;

		for I in 1 .. Keys loop
			X.Status(I) := False;
		end loop;

	end  Init_C; 

	-- Algoritmo 10.30 
	procedure Inicializa(R : in out Elo) is
	begin
		R := new No;
		if R = null then
			raise Storage_Error;
		end if;

		Init_C(R);

		R.N     := 0;
		R.Folha := True;

	end  Inicializa; 

	-- Algoritmo 10.31 
	procedure Divide_Filho(X : Elo; I : Integer; FI : Elo) is
		FI2 : Elo;
		J   : Integer;
	begin
		FI2 := new No;
		if FI2 = null then
			raise Storage_Error;
		end if;

		Init_C(FI2);

		FI2.Folha  := FI.Folha;
		FI2.N      := T - 1;

		for J in 1 .. T - 1 loop
			FI2.Chave(J)   := FI.Chave(J+T);
			FI2.Tag(J)     := FI.Tag(J+T);
			FI2.Status(J)  := FI.Status(J+T);
			FI.Status(J+T) := False;
		end loop;

		if not FI.Folha then
			for J in 1 .. T loop
				FI2.C(J) := FI.C(J+T);
			end loop;
		end if;

		FI.N := T - 1;

		for J in reverse I + 1 .. X.N + 1 loop
			X.C(J+1) := X.C(J);
		end loop;

		X.C(I+1) := FI2;

		for J in reverse I .. X.N loop
			X.Chave(J+1)  := X.Chave(J);
			X.Tag(J+1)    := X.Tag(J);
			X.Status(J+1) := X.Status(J);
			X.Status(J)   := False;
		end loop;

		X.Chave(I)   := FI.Chave(T);
		X.Tag(I)     := FI.Tag(T);
		X.Status(I)  := True;
		FI.Status(T) := False;
		X.N          := X.N + 1;

	end  Divide_Filho; 

	-- Algoritmo 10.32 
	procedure Insere_Nao_Cheio(X : Elo; K : String; Tag : Integer) is
		I : Integer;
		P : Elo;
	begin
		I := X.N;

		if X.Folha then
			while (I > 0) and then K < X.Chave(I) loop
				X.Chave(I+1)  := X.Chave(I);
				X.Tag(I+1)    := X.Tag(I);
				X.Status(I+1) := X.Status(I);
				I             := I - 1;
			end loop;

			X.Chave(I+1)  := K;
			X.Tag(I+1)    := Tag;
			X.Status(I+1) := True;
			X.N           := X.N + 1;
		else
			while (I > 0) and then K < X.Chave(I) loop
				I    := I - 1;
			end loop;

			I := I + 1;

			P := X.C(I);
			if P.N = Keys then
				Divide_Filho(X,I,X.C(I));
				if K > X.Chave(I) then
					I := I + 1;
				end if;
			end if;

			Insere_Nao_Cheio(X.C(I),K,Tag);
		end if;

	end  Insere_Nao_Cheio; 

	-- Algoritmo 10.33 
	procedure Insere(Ra : in out Elo; K : in String; Tag : Integer) is
		R, S : Elo;
		I    : Integer;

		procedure Consulta_Insere(R : in Elo;
		                          K : in String;
		                          X : in out Elo;
		                          P : in out Integer) is
			J    : Integer;
		begin
			X               := null;
			J               := 1;

			while (J <= R.N) and then K > R.Chave(J) loop
				J    := J + 1;
			end loop;

			if J <= R.N and then K = R.Chave(J) then
				X := R;
				P := J;
			elsif not R.Folha then
				Consulta_Insere(R.C(J),K,X,P);
			end if;

			return;
			

		end  Consulta_Insere; 
	begin
		-- Primeiro verifica se K já está na árvore B 
		Consulta_Insere(Ra,K,R,I);
		if R /= null then
			if R.Status(I) then
				raise Chave_Ja_Existe;
			end if;

			-- Se K estava inativo reutilize o seu local 
			R.Status(I) := True;
			R.Tag(I)    := Tag;
		else
			R := Ra;
			if R.N = Keys then
				S := new No;
				if S = null then
					raise Storage_Error;
				end if;

				Init_C(S);

				Ra       := S;
				S.Folha := False;
				S.N     := 0;
				S.C(1)  := R;
				Divide_Filho(S,1,R);
				Insere_Nao_Cheio(S,K,Tag);
			else
				Insere_Nao_Cheio(R,K,Tag);
			end if;
		end if;
	end  Insere; 

	-- Algoritmo 10.34 
	function Consulta(R : Elo; K : String) return Integer is
		I : Integer := 1;
	begin
		while (I <= R.N) and then K > R.Chave(I) loop
			I := I + 1;
		end loop;

		if I <= R.N and then K = R.Chave(I) then
			if R.Status(I) then
				return R.Tag(I);
				
			elsif not R.Folha then
				return Consulta(R.C(I),K);
			end if;
		elsif not R.Folha then
			return Consulta(R.C(I),K);
		end if;

		return 0;

	end  Consulta; 

	-- Algoritmo 10.35 
	function Remove(R : Elo; K : String) return Boolean is

		I : Integer := 1;
	begin
		while (I <= R.N) and then K > R.Chave(I) loop
			I    := I + 1;
		end loop;

		if I <= R.N and then K = R.Chave(I) then
			R.Status(I) := False;
			return True;

		elsif not R.Folha then
			return Remove(R.C(I),K);
		end if;

		return False;

	end  Remove; 

	-- Sub-algoritmo 10.36.1 
	procedure Squash_2(Ra : Elo; Nova : in out Elo) is
	begin
		if Ra /= null then
			for I in 1 .. Ra.N loop

				Squash_2(Ra.C(I),Nova);

				if Ra.Status(I) then
					Insere(Nova,Ra.Chave(I),Ra.Tag(I));
				end if;
			end loop;

			squash_2(Ra.C(Ra.N+1),Nova);

			if Ra.Folha then
				Free(Ra);
			end if;
		end if;

	end  Squash_2; 

	-- Algoritmo 10.36 
	procedure Squash(Ra : in out Elo) is
		R : Elo;
	begin
		Inicializa(R);

		Squash_2(Ra,R);

		Ra := R;

	end  Squash;

	-- Algoritmo 10.37 
	procedure Conta(R : Elo; Deletados, Ativos : in out Integer) is
	begin
		if R /= null then
			for I in 1 .. R.N loop

				Conta(R.C(I),Deletados,Ativos);

				if R.Status(I) then
					Ativos    := Ativos + 1;
				else
					Deletados := Deletados + 1;
				end if;
			end loop;

			Conta(R.C(R.N+1),Deletados,Ativos);
		end if;

	end  Conta; 

	-- Algoritmo 10.38 
	procedure Imprime(Ra : Elo) is
	begin
		if Ra /= null then
			for I in 1 .. Ra.N loop

				Imprime(Ra.C(I));

				if Ra.Status(I) then
					Put(Ra.Tag(I), 4);
					Put_Line(" " & Ra.Chave(I));
				end if;
			end loop;

			Imprime(Ra.C(Ra.N+1));
		end if;

	end  Imprime;
	
end Arvore_B;