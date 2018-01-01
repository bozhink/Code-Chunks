-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte MergePV.Ada
with Ada.Text_IO, MergePV;
use Ada.Text_IO;
procedure Testa_Merge_P_Vias is

	subtype Key is String(1..2);  -- Chave de ordenação 

	type Data is record       -- Registro do arquivo de dados
		Nome    : Key;
		Idade   : Integer;
		Salario : Float;
		end record;

	type Rec is record         -- Registro da area de ordenação 
		Chave : Key;
		Tag   : Integer;
		end record;

	N       : constant Integer := 26 * 26;

	Entrada : constant String := "A.DAT";
	Saida   : constant String := "A2.DAT";

	function Compara(R1, R2 : Rec) return Boolean is
	begin
		return R1.Chave > R2.Chave;
	end Compara;

	procedure Faz_Rec(D : Data; I : Integer; R : out Rec) is
	begin
		R.Chave := D.Nome;
		R.Tag   := I;
	end Faz_Rec;

	function Get_Tag(T : Rec) return Integer is
	begin
		return T.Tag;
	end Get_Tag;	

	package Merge is new MergePV(N,4,Key,Rec,Data,Compara,Faz_Rec,Get_Tag);
	use Merge;

	procedure Simula_Dados is
	begin
		-- Produz dados para ordenação 
		Data_IO.Create(A_In,Data_IO.Out_File,Entrada);

		Registro.Idade   := 18;
		Registro.Salario := 1000.0;

		-- Grave N registros sendo que o nome (chave) de cada
		-- registro é composto por duas letras geradas em
		-- ordem inversa
		for I in reverse 0 .. 25 loop
			Registro.Nome(1) := 
				Character'Val(I + Character'Pos('A'));
			for J in reverse 0 .. 25 loop
				Registro.Nome(2) := 
				Character'Val(J + Character'Pos('a'));
				Data_IO.Write(A_In, Registro);
				Registro.Idade   := Registro.Idade + 1;
				Registro.Salario := Registro.Salario + 500.0;
				if Registro.Idade > 69 then
					Registro.Idade := 18;
				end if;
				if Registro.Salario > 5000.00 then
					Registro.Salario := 1000.0;
				end if;
			end loop;
		end loop;

		Data_IO.Close(A_In);

	end Simula_Dados;

	-- Verifica se as chaves estão em ordem 
	procedure Verifica_Ordenacao is
		Tag, I : Long_Integer;
	begin
		-- Abre o arquivo de entrada 
		Data_IO.Open(A_In,Data_IO.In_File,Entrada);

		-- Abre o arquivo de referência 
		Tag_IO.Open(A_Out,Tag_IO.In_File,Saida);

		-- Leia o tag do registro com a menor chave
		Tag_IO.Read(A_Out,Tag);

		-- Posicione o arquivo de entrada para ler
		-- o registro associado com este tag 
		-- Leia o registro completo do arquivo de entrada 
		Data_IO.Read(A_In,Registro,Tag);

		-- Verifica se a chave de um registro é
		-- maior que a de sucessor para todos os registros 
		I := 2;
		while I <= N loop
			Tag_IO.Read(A_Out,Tag);
			Data_IO.Read(A_In,Registro2,Tag);

			if Registro.Nome > Registro2.Nome then
				Put("O registro " & Integer'Image(I));
				Put_Line(" esta' fora de ordem...");
				Put_Line(Registro.Nome & ' ' &
                                         Registro2.Nome & 
				         Integer'Image(Tag));
				raise Program_Error;
			end if;
			Registro := Registro2;
			I := I + 1;
		end loop;

		Data_IO.Close(A_In);
		Tag_IO.Delete(A_Out);  -- Remove o arquivo de referência

		Put_Line("A ordem esta' correta!");

	end Verifica_Ordenacao;

begin

	Simula_Dados;

	Merge_P_Vias(Entrada,Saida);

	Verifica_Ordenacao;

end Testa_Merge_P_Vias;