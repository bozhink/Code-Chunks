-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Floresta.Adb

with Ada.Text_IO, Ada.Integer_Text_IO, Dos.Disk;
use  Ada.Text_IO, Ada.Integer_Text_IO, Dos.Disk;
package body Floresta_Str is

	-- Algoritmo 10.15

	procedure Copia_Fn(Fn : in String; H : in out Floresta) is
		I : Integer;
	begin
		H.THn_Len           := Fn'Last;
		H.TFn_Len           := Fn'Last;
		H.THn(1..H.THn_Len) := Fn;
		H.TFn(1..H.THn_Len) := Fn;

		I := 1;		
		while Fn(I) /= '.' loop
			I := I + 1;
		end loop;

		H.THn(I+1) := 'H';
		H.THn(I+2) := 'D';
		H.THn(I+3) := 'R';

	end Copia_Fn;

	procedure Inicializa(Fn : in String; 
	                     H  : in out Floresta) is
	begin

		-- Cria árvore
		Copia_Fn(Fn,H);
		Floresta_IO.Create(H.THp
		                  ,Floresta_IO.Out_File
		                  ,H.THn(1..H.THn_Len));

		Nodo_IO.Create(H.TFp,Nodo_IO.Out_File,Fn);

		H.Em_Uso    := 0;
		H.Deletados := 0;
		H.Compacte  := False;

		for I in 1 .. Floresta_Hash loop
			H.Raiz(I) := -2;
		end loop;

		Floresta_IO.Write(H.THp,H,1);
	
		Floresta_IO.Close(H.THp);
		Nodo_IO.Close(H.TFp);

		Floresta_IO.Open(H.THp,Floresta_IO.InOut_File,H.THn(1..H.THn_Len));

		Nodo_IO.Open(H.TFp,Nodo_IO.InOut_File,Fn);

	end Inicializa;

	-- Algoritmo 10.16
	procedure Abre(Fn : in String;
	               H  : in out Floresta) is
		Sit  : Float;
		Temp : Floresta_IO.File_Type;
	begin
		Copia_Fn(Fn,H);		
		Floresta_IO.Open(Temp
		                ,Floresta_IO.InOut_File
		                ,H.THn(1..H.THn_Len));

		Floresta_IO.Read(Temp,H,1);
		H.THp := Temp;

		Nodo_IO.Open(H.TFp,Nodo_IO.InOut_File,Fn);

		if H.Em_Uso /= 0 then
			Sit := Float(H.Deletados) * 100.0 / Float(H.Em_Uso);
		end if;

		if (Sit > 30.0 or H.Deletados > H.Em_Uso) then
			H.Compacte := True;
		else
			H.Compacte := False;
		end if;

	end Abre;

	-- Algoritmo 10.17
	procedure Fecha(H : in out Floresta) is
	begin
		Floresta_IO.Write(H.THp,H,1);

		Floresta_IO.Close(H.THp);

		Nodo_IO.Close(H.TFp);

	end Fecha;

	-- Algoritmo 10.18
	function Hash(S : in String) return Integer is
		Val : Integer := 0;
	begin
	-- utilize este comando para tornar a floresta ordenada
		--	return Character'Pos(S(1)); 

		for I in S'Range loop
			Val := Val + Character'Pos(S(I)) * I;
		end loop;

		return Abs(Val mod Floresta_Hash) + 1;

	end Hash;

	-- Algoritmo 10.20
	procedure Le(H    : in out Floresta;
	             Nodo : out TKSize; 
	             W    : in Integer) is
	begin
		Nodo_IO.Read(H.TFp,Nodo,W);
	end Le;

	-- Algoritmo 10.21
	procedure Grava(H    : in out Floresta;
	                Nodo : in TKSize; 
	                W    : in Integer) is
	begin
		Nodo_IO.Write(H.TFp,Nodo,W);

	end Grava;

	-- Algoritmo 10.22
	procedure Prepara(H   : in out Floresta; 
	                  K   : in String;
	                  Tag : in Integer;
	                  Pos : out Integer) is

		Nodo : TKSize;
	begin
		Nodo.LLink              := -2;
		Nodo.RLink              := -2;
		Nodo.Tag                := Tag;
		Nodo.Status             := 'I';
		Nodo.Len                := K'Last;
		Nodo.Chave(1..Nodo.Len) := K;

		H.Em_Uso                := H.Em_Uso + 1;
		Pos                     := H.Em_Uso;

		Nodo_IO.Write(H.TFp,Nodo,Pos);

	end Prepara;

	-- Algoritmo 10.23
	procedure Insere(H   : in out Floresta;
	                 K   : in String;
	                 Tag : in Integer) is

		Nodo     : TKSize;
		I, W , X : Integer;
	begin

		I := Hash(K);

		W := H.Raiz(I);
	
		if W < 1 then

			Prepara(H,K,Tag,W);
			H.Raiz(I) := W;
			Floresta_IO.Write(H.THp,H,1);
		else
			loop
				Le(H,Nodo,W);
	
				if K < Nodo.Chave(1..K'Last) then
					if Nodo.LLink < 1 then
						Prepara(H,K,Tag,X);
						Nodo.LLink := X;
						Grava(H,Nodo,W);
						return;
					else
						W := Nodo.LLink;
					end if;
				elsif K = Nodo.Chave(1..K'Last) then
					if Nodo.Status /= 'D' then
						raise Operacao_Invalida;
					end if;
					H.Deletados := H.Deletados - 1;
					Nodo.Status := 'I';
					Nodo.Tag    := Tag;
					Grava(H,Nodo,W);
					return;
				else
					if Nodo.RLink < 1 then
						Prepara(H,K,Tag,X);
						Nodo.RLink := X;
						Grava(H,Nodo,W);
						return;
					else
						W := Nodo.RLink;
					end if;
				end if;
			end loop;
		end if;

	end Insere;

	-- Algoritmo 10.24
	function Consulta(H : in Floresta; K : in String)
				return Integer is

		Nodo : TKSize;
		X    : Integer;
	begin
		X := H.Raiz(Hash(K));

		loop
			if  X < 1 then 
				return 0;
			end if;

			Le(H,Nodo,X);

			if K < Nodo.Chave(1..K'Last) then
				X := Nodo.LLink; 
			elsif K = Nodo.Chave(1..K'Last) then
				if Nodo.Status = 'D' then 
					return 0;
				end if;
				return Nodo.Tag;
			else
				X := Nodo.RLink; 
			end if;
		end loop;

	end Consulta;

	-- Algoritmo 10.25
	procedure Remove(H : in out Floresta; K : in String) is

		Nodo : TKSize;
		X    : Integer;
	begin
		X := H.Raiz(Hash(K));

		loop

			if X < 1 then 
				raise Operacao_Invalida;
			end if;

			Le(H,Nodo,X); 

			if K < Nodo.Chave(1..K'Last) then
				X := Nodo.LLink; 
			elsif K = Nodo.Chave(1..K'Last) then
				if Nodo.Status = 'D' then 
					raise Operacao_Invalida;
				end if;

				Nodo.Status := 'D';
				H.Deletados := H.Deletados + 1;
				Grava(H,Nodo,X);
				return;
			else 
				X := Nodo.RLink; 
			end if;
		end loop;

	end Remove;

	-- Algoritmo 10.26
	function Tempo_De_Compactar(H : in Floresta) return Boolean is
	begin
		return H.Compacte;

	end Tempo_De_Compactar;

	-- Algoritmo 10.27
	procedure Squash(Fn : in String) is

		Tn1, Tn2 : String(1..WFn);
		K, Len   : Integer;
		Nodo     : TKSize;
		Temp, H  : Floresta;
	begin
		Abre(Fn,H);

		Inicializa("TREEBAK.BAK",Temp);

		for K in 1..H.Em_Uso loop
			Nodo_IO.Read(H.TFp,Nodo,K);
			if Nodo.Status /= 'D' then
				Insere(Temp,Nodo.Chave(1..Nodo.Len),Nodo.Tag);
			end if;
		end loop;

		Len := H.THn_Len;
		Tn1 := H.THn;
		Tn2 := H.TFn;
	
		Fecha(Temp);

		-- Remove árvore antiga
		Floresta_IO.Delete(H.THp);
		Nodo_IO.Delete(H.TFp);

		if not Rename("TREEBAK.BAK",Tn2(1..Len)) then
			Put_Line("Nao pode renomear " & Tn2(1..Len));
		end if;
		if not Rename("TREEBAK.HDR",Tn1(1..Len)) then
			Put_Line("Nao pode renomear " & Tn1(1..Len));
		end if;

	end Squash;

	-- Algoritmo 7.2
	procedure Central(H : in FLoresta; K : in Integer) is

		Nodo : TKSize;
	begin
		if K < 1 then
			return;
		end if;

		Le(H,Nodo,K);

		Central(H,Nodo.LLink);

		if Nodo.Status /= 'D' then
			Put(Nodo.Chave(1..Nodo.Len));
			for I in Nodo.Len+1 .. 40 loop
				Put(' ');
			end loop;
			Put(Nodo.Tag,4);
			New_Line;
		end if;

		Central(H,Nodo.RLink);

	end Central;

	-- Algoritmo 10.28
	procedure Imprime(H : in Floresta) is
	begin
		for I in 1 .. Floresta_Hash loop
			Central(H,H.Raiz(I));
		end loop;

	end Imprime;
	
end Floresta_Str;