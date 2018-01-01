-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Merge2V.Adb
with Ada.Direct_IO, Shell;
package body Merge2V is

	-- Algoritmo 9.1 
	procedure Merge_Duas_Vias(A : String; A2 : String) is

		I, J   : Integer;
		R1, R2 : Data;
		F1, F2 : Rec_IO.File_Type;
		V      : Vetor(1..M); -- Armazena área de ordenação 

		procedure Distribui_F1 is
			I : Integer;
			R : Rec;
		begin
			-- Abre o arquivo de entrada 
			Data_IO.Open(A_In,Data_IO.In_File,A);

			-- Armazena as primeiras M chaves e
			-- seus respectivos tags em V 
			for I in 1 .. M loop
				Data_IO.Read(A_In, R1);
				Faz_Rec(R1,I,V(I));
			end loop;

			-- Ordena as chaves de V 
			Shell_Sort(V);

			-- Grava o conteúdo de V no arquivo F1
			Rec_IO.Create(F1,Rec_IO.Out_File,"F1.DAT");

			for I in 1 .. M loop
				R := V(I);
				Rec_IO.Write(F1, R);
			end loop;

			Rec_IO.Close(F1);

		end Distribui_F1;

		procedure Distribui_F2 is
			I, J : Integer;
			V    : Vetor(1..(N-M)); -- Armazena área de ordenação 
			R    : Rec;
		begin
			-- Armazena as chaves restantes e
			-- seus respectivos tags em V 
			J := 1;
			I := M + 1;
			while I <= N loop
				Data_IO.Read(A_In, R1);
				Faz_Rec(R1,I,V(J));
				I := I + 1;
				J := J + 1;
			end loop;

			-- Fecha o arquivo de entrada 
			Data_IO.Close(A_In);

			J := J - 1;

			-- Ordena as chaves de V 
			Shell_Sort(V);

			-- Grava o conteúdo de V no arquivo F2
			Rec_IO.Create(F2,Rec_IO.Out_File,"F2.DAT");

			for I in 1 .. J loop
				R := V(I);
				Rec_IO.Write(F2, R);
			end loop;

			Rec_IO.Close(F2);

		end Distribui_F2;

		procedure Fase is
			R1, R2 : Rec;
		begin
			-- Reabre F1 e F2 
			Rec_IO.Open(F1,Rec_IO.In_File,"F1.DAT");
			Rec_IO.Open(F2,Rec_IO.In_File,"F2.DAT");

			-- Abre o arquivo de saída
			Tag_IO.Create(A_Out,Tag_IO.Out_File,A2);

			-- Le um registro de F1 e F2 
			Rec_IO.Read(F1, R1);
			Rec_IO.Read(F2, R2);

			I := M;     -- F1 contém I registros
			J := N - M; -- F2 contém J registros 

			-- Grave o tag do registro que contiver
			-- a menor chave e leia um novo registro
			-- do arquivo associado com esta chave
			-- enquanto existirem registros a serem
			-- lidos em ambos os arquivos F1 e F2 
			while (I > 0) and (J > 0) loop
				if not Compara(R1,R2) then
					Tag_IO.Write(A_Out, Get_Tag(R1));
					I := I - 1;
					if I > 0 then
						Rec_IO.Read(F1, R1);
					end if;
				else
					Tag_IO.Write(A_Out, Get_Tag(R2));
					J := J - 1;
					if J > 0 then
						Rec_IO.Read(F2, R2);
					end if;
				end if;
			end loop;

			-- Neste ponto apenas um dos arquivos de entrada
			-- contém chaves cujos tags ainda não foram
			-- transferidos para o arquivo de referência 

			-- Grave os tags restantes do arquivo F1 
			while I > 0 loop
				Tag_IO.Write(A_Out, Get_Tag(R1));
				I := I - 1;
				if I > 0 then
					Rec_IO.Read(F1, R1);
				end if;
			end loop;

			-- Grave os tags restantes do arquivo F2
			while J > 0 loop
				Tag_IO.Write(A_Out, Get_Tag(R2));
				J := J - 1;
				if J > 0 then
					Rec_IO.Read(F2, R2);
				end if;
			end loop;

			Rec_IO.Delete(F1); -- Remove os arquivos
			Rec_IO.Delete(F2); -- F1.DAT e F2.DAT

			-- Fecha o arquivo de saída
			Tag_IO.Close(A_Out);

		end Fase;

	begin
		-- Ordena as primeiras M chaves e gera F1 
		Distribui_F1;

		-- Ordena as chaves restantes e gera F2
		Distribui_F2;

		-- Realiza a operação de merge com F1 e F2
		-- gerando o arquivo de referência 
		Fase;

	end Merge_Duas_Vias;

end Merge2V;