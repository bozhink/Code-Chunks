-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte MergePV.Adb
with Ada.Direct_IO, Shell;
package body MergePV is

	-- Descritor de cada Via 
	type Via is record
		F   : Rec_IO.File_Type; -- Descritor do arquivo 
		Fn  : String(1..6);     -- Nome externo do arquivo 
		N   : Integer;          -- Número de registros da via
		Fim : Boolean;          -- True se encontrou EOF 
		R   : Rec;              -- Buffer para merge 
		end record;

	DV : array (1..P) of Via;  -- Área descritora de vias

	-- Algoritmo 9.2 
	procedure Merge_P_Vias(A : String; A2 : String) is

		I, J   : Integer;
		Pos    : Integer := 0;
		R1, R2 : Data;
		R      : Rec;

		procedure Distribui_F(Pi : Integer; Mi : Integer) is
			V : Vetor(1..Mi); -- Armazena área de ordenação 
		begin
			-- Monta o nome do arquivo de saida 
			DV(Pi).Fn    := "F .DAT";
			DV(Pi).Fn(2) := Character'Val(Pi + Character'Pos('0'));

			-- Inicializa indicador de fim de arquivo 
			DV(Pi).Fim   := False;

			DV(Pi).N := Mi;

			-- Armazena as primeiras M chaves e
			-- seus respectivos tags em V 
			for I in 1 .. DV(Pi).N loop
				Data_IO.Read(A_In, R1);
				Pos := Pos + 1;
				Faz_Rec(R1,Pos,V(I));
			end loop;

			-- Ordena as chaves de V 
			Shell_Sort(V);

			-- Grava o conteúdo de V no arquivo Fp 
			Rec_IO.Create(DV(Pi).F,Rec_IO.Out_File,DV(Pi).Fn);

			for I in 1 .. DV(Pi).N loop
				R := V(I);
				Rec_IO.Write(DV(Pi).F, R);
			end loop;

			Rec_IO.Close(DV(Pi).F);

		end Distribui_F;

		procedure Fase is
			PVia     : Integer;
			MenorVia : Integer;
			MenorKey : Rec;
			V_Ativas : Integer := P;
		begin
			-- Reabre todas as vias 
			for I in 1 .. P loop
				Rec_IO.Open(DV(I).F,Rec_IO.In_File,DV(I).Fn);
			end loop;

			-- Abre o arquivo de saída 

			Tag_IO.Create(A_Out,Tag_IO.Out_File,A2);

			-- Le um registro de cada via 
			for I in 1 .. P loop
				Rec_IO.Read(DV(I).F, R);
				DV(I).R := R;
			end loop;

			-- Grave o tag do registro que contiver
			-- a menor chave e leia um novo registro
			-- do arquivo associado com esta chave
			-- enquanto existirem registros a serem
			-- lidos em pelo menos duas vias ativas 

			while V_Ativas > 1 loop

				-- Localiza a 1a via ativa 
				PVia := 1;
				while (PVia <= P) and DV(PVia).Fim loop
					PVia := PVia + 1;
				end loop;

				-- Seleciona a menor chave 
				MenorVia := PVia;
				MenorKey := DV(PVia).R;
				PVia := PVia + 1;
				while PVia <= P loop
					if not DV(PVia).Fim then
						if not Compara(DV(PVia).R,MenorKey) then
							MenorVia := PVia;
							MenorKey := DV(PVia).R;
						end if;
					end if;
					PVia := PVia + 1;
				end loop;

				-- Grava o tag da via com a menor chave
				-- no arquivo de referência 
				Tag_IO.Write(A_Out, Get_Tag(DV(MenorVia).R));

				DV(MenorVia).N := DV(MenorVia).N - 1;

				if DV(MenorVia).N = 0 then
					DV(MenorVia).Fim := True;
					V_Ativas         := V_Ativas - 1;
				else -- Le mais um registro desta via 
					Rec_IO.Read(DV(MenorVia).F, R);
					DV(MenorVia).R := R;
				end if;
			end loop;

			-- Neste ponto apenas uma das vias
			-- contém chaves cujos tags ainda não foram
			-- transferidos para o arquivo de referência 

			-- Localiza a via com tags pendentes 
			PVia := 1;
			while (PVia <= P) and DV(PVia).Fim loop
				PVia := PVia + 1;
			end loop;

			while DV(PVia).N > 0 loop
				Tag_IO.Write(A_Out, Get_Tag(DV(PVia).R));

				DV(PVia).N := DV(PVia).N - 1;

				if DV(PVia).N > 0 then
					-- Le mais um registro desta via 
					Rec_IO.Read(DV(PVia).F, R);
					DV(PVia).R := R;
				end if;
			end loop;

			-- Fecha e remove todas as vias 
			for I in 1 .. P loop
				Rec_IO.Delete(DV(I).F);
			end loop;

			-- Fecha o arquivo de saída 
			Tag_IO.Close(A_Out);

		end Fase;

	begin
		-- Abre o arquivo de entrada 
		Data_IO.Open(A_In,Data_IO.In_File,A);

		-- Ordena e distribui N chaves em P vias  
		Pos := 0;
		for I in 1 .. P loop
			-- A última via pode ter menos
			-- que M registros 
			if I = P then
				Distribui_F(I,N - (I - 1) * M);
			else
				Distribui_F(I,M);
			end if;
		end loop;

		-- Fecha o arquivo de entrada 
		Data_IO.Close(A_In);

		-- Realiza a operação de merge com as P vias
		-- gerando o arquivo de referência 
		Fase;

	end Merge_P_Vias;

end MergePV;