{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte MergePV.Pas     }

PROGRAM MergePV;

	USES Crt;

CONST
	N       = 26 * 26;     { Número de registros a serem
				 ordenados }

	Pv	= 4;           { Número de vias -- sub-arquivos }

	M       = N DIV Pv;    { Comprimento do intervalo da
				 área de ordenação }

	Entrada = 'c:A.DAT';    { Nome do arquivo de entrada }
	Saida   = 'd:A2.DAT';   { Nome do arquivo de saída }

TYPE
	Key   = ARRAY[1..2] OF CHAR; { Chave de ordenação }

	Data  = RECORD        { Registro do arquivo de dados }
		Nome    : Key;
		Idade   : INTEGER;
		Salario : REAL;
		END;

	Rec   = RECORD        { Registro da area de ordenação }
		Chave : Key;
		Tag   : INTEGER;
		END;

	Arq   = FILE OF Data; { Destritor para arquivo a ser ordenado }
	Arq_T = FILE OF Rec;  { Destritor para de referência ordenado }

	{ Descritor de cada Via }
	Via   = RECORD
		R   : Rec;        { Buffer para merge }
		F   : Arq_T;      { Descritor do arquivo }
		N   : INTEGER;    { Número de registros da via}
		Fn  : STRING[12]; { Nome externo do arquivo }
		Fim : BOOLEAN;    { TRUE se encontrou EOF }
		END;

	Vetor = ARRAY[1..M] OF Rec;  { Área de ordenação }

	Vias  = ARRAY[1..Pv] OF Via; { Área de controle de vias }

VAR
	I, J, K   : INTEGER;

	Registro  : Data;
	Registro2 : Data;

	A_In      : Arq;             { Descritor do arquivo de entrada }
	A_Out     : FILE OF INTEGER; { Descritor do arquivo de saída }

	V         : Vetor;           { Armazena área de ordenação }

	DV        : Vias;            { Área descritora de vias }

	PROCEDURE Swap(VAR X, Y : Rec);
	VAR
		Temp : Rec;
	BEGIN
		Temp := X;
		X    := Y;
		Y    := Temp;
	END; { Swap }

	{ Algoritmo 8.5 }
	PROCEDURE Shell_Sort(N : INTEGER);
	VAR
		D    : INTEGER;
		Ref  : INTEGER;
		Base : INTEGER;
	BEGIN
		D := N DIV 2;

		WHILE D > 0 DO BEGIN
			FOR Ref := D + 1 TO N DO BEGIN
				Base := Ref - D;
				WHILE Base > 0 DO
					IF V[Base].Chave > V[Base+D].Chave THEN BEGIN
						Swap(V[Base],V[Base+D]);
						Base := Base - D;
						END
					ELSE
						Base := 0;
				END;
			D := D DIV 2;
			END;

	END; { Shell_Sort }

	{ Algoritmo 9.2 }
	PROCEDURE Merge_P_Vias(A : STRING;A2 : STRING);
	VAR
		I, J : INTEGER;
		R    : Data;
		Pos  : INTEGER;

		PROCEDURE Distribui_F(P : INTEGER);
		VAR
			I : INTEGER;
		BEGIN
			{ Monta o nome do arquivo de saida }
			DV[P].FN    := 'F .DAT';
			DV[P].FN[2] := Chr(P + Ord('0'));

			{ Inicializa indicador de fim de arquivo }
			DV[P].Fim   := FALSE;

			{ A última via pode ter menos
			  que M registros }
			IF P = Pv THEN
				DV[P].N := N - ((P - 1) * M)
			ELSE
				DV[P].N := M;

			{ Armazena as primeiras M chaves e
			  seus respectivos tags em V }
			FOR I := 1 TO DV[P].N DO BEGIN
				Read(A_In, R);
				V[I].Chave := R.Nome;
				Pos        := Pos + 1;
				V[I].Tag   := Pos;
				END;

			{ Ordena as chaves de V }
			Shell_Sort(DV[P].N);

			{ Grava o conteúdo de V no arquivo Fp }
			Assign(DV[P].F, DV[P].Fn);
			ReWrite(DV[P].F);

			FOR I := 1 TO DV[P].N DO
				Write(DV[P].F, V[I]);

			Close(DV[P].F);

		END; { Distribui_F }

		PROCEDURE Fase;
		VAR
			I        : INTEGER;
			PVia     : INTEGER;
			MenorVia : INTEGER;
			MenorKey : Key;
			V_Ativas : INTEGER;
		BEGIN
			{ Reabre todas as vias }
			FOR I := 1 TO Pv DO
				Reset(DV[I].F);

			{ Abre o arquivo de saída }
			Assign(A_Out,A2);
			ReWrite(A_Out);


			{ Le um registro de cada via }
			FOR I := 1 TO Pv DO
				Read(DV[I].F, DV[I].R);

			V_Ativas := Pv;

			{ Grave o tag do registro que contiver
			  a menor chave e leia um novo registro
			  do arquivo associado com esta chave
			  enquanto existirem registros a serem
			  lidos em pelo menos duas vias ativas }

			WHILE(V_Ativas > 1) DO BEGIN

				{ Localiza a 1a via ativa }
				PVia := 1;
				WHILE (PVia <= Pv) AND (DV[PVia].Fim) DO
					PVia := PVia + 1;

				{ Seleciona a menor chave }
				MenorVia := PVia;
				MenorKey := DV[PVia].R.Chave;
				PVia := PVia + 1;
				WHILE PVia <= Pv DO BEGIN
					IF NOT DV[PVia].Fim THEN
						IF DV[PVia].R.Chave < MenorKey THEN BEGIN
							MenorVia := PVia;
							MenorKey := DV[PVia].R.Chave;
							END;
					PVia := PVia + 1;
					END;

				{ Grava o tag da via com a menor chave
				  no arquivo de referência }
				Write(A_Out, DV[MenorVia].R.Tag);

				DV[MenorVia].N := DV[MenorVia].N - 1;

				IF DV[MenorVia].N = 0 THEN BEGIN
					DV[MenorVia].Fim := TRUE;
					V_Ativas         := V_Ativas - 1;
					END
				ELSE { Le mais um registro desta via }
					Read(DV[MenorVia].F, DV[MenorVia].R);
				END;

			{ Neste ponto apenas uma das vias
			  contém chaves cujos tags ainda não foram
			  transferidos para o arquivo de referência }

			{ Localiza a via com tags pendentes }
			PVia := 1;
			WHILE (PVia <= Pv) AND (DV[PVia].Fim) DO
				PVia := PVia + 1;

			WHILE(DV[PVia].N > 0) DO BEGIN
				Write(A_Out, DV[PVia].R.Tag);

				DV[PVia].N := DV[PVia].N - 1;

				IF DV[PVia].N > 0 THEN
					{ Le mais um registro desta via }
					Read(DV[PVia].F, DV[PVia].R);
				END;

			{ Fecha e remove todas as vias }
			FOR I := 1 TO Pv DO BEGIN
				Close(DV[I].F);
				Erase(DV[I].F);
				END;

			{ Fecha o arquivo de saída }
			Close(A_Out);

		END; { Fase }

	BEGIN
		{ Abre o arquivo de entrada }
		Assign(A_In,A);
		Reset(A_In);

		{ Ordena e distribui N chaves em P vias  }
		Pos := 0;
		FOR I := 1 TO Pv DO
			Distribui_F(I);

		{ Fecha o arquivo de entrada }
		Close(A_In);

		{ Realiza a operação de merge com as P vias
		  gerando o arquivo de referência }
		Fase;

	END; { Merge_P_Vias }

	PROCEDURE Simula_Dados;
	BEGIN

		{ Produz dados para ordenação }
		Assign(A_In,Entrada);
		ReWrite(A_In);

		Registro.Idade   := 18;
		Registro.Salario := 1000.0;

		{ Grave N registros sendo que o nome (chave) de cada
		  registro é composto por duas letras geradas em
		  ordem inversa }
		FOR I := 25 DOWNTO 0 DO BEGIN
			Registro.Nome[1] := Chr(I + Ord('A'));
			FOR J := 25 DOWNTO 0 DO BEGIN
				Registro.Nome[2] := Chr(J + Ord('a'));
				Write(A_In, Registro);
				Registro.Idade   := Registro.Idade + 1;
				Registro.Salario := Registro.Salario + 500.0;
				IF Registro.Idade > 69 THEN
					Registro.Idade := 18;
				IF Registro.Salario > 5000.00 THEN
					Registro.Salario := 1000.0;
				END;
			END;

		Close(A_In);

	END; { Simula_Dados }

	{ Verifica se as chaves estão em ordem }
	PROCEDURE Verifica_Ordenacao;
	VAR
		Tag : INTEGER;
	BEGIN
		{ Abre o arquivo de entrada }
		Assign(A_In,Entrada);
		Reset(A_In);

		{ Abre o arquivo de referência }
		Assign(A_Out,Saida);
		Reset(A_Out);

		{ Leia o tag do registro com a menor chave }
		Read(A_Out,Tag);

		{ Posicione o arquivo de entrada para ler
		  o registro associado com este tag }
		Seek(A_In,Tag - 1);

		{ Leia o registro completo do arquivo de entrada }
		Read(A_In,Registro);

		{ Verifica se a chave de um registro é
		  maior que a de sucessor para todos os registros }
		I := 2;
		WHILE I <= N DO BEGIN
			Read(A_Out,Tag);
			Seek(A_In,Tag - 1);
			Read(A_In,Registro2);
			IF Registro.Nome > Registro2.Nome THEN BEGIN
				WriteLn('O registro ', I, 'esta'' fora de ordem...');
				Writeln(Registro.Nome, ' ', Registro2.Nome, Tag - 1);
				Halt;
				END;
			Registro := Registro2;
			I := I + 1;
			END;

		Close(A_In);
		Close(A_Out);
		Erase(A_Out);

		WriteLn('A ordem esta'' correta!');

	END; { Verifica_Ordenacao }

BEGIN

	Simula_Dados;

	Merge_P_Vias(Entrada,Saida);

	Verifica_Ordenacao;

END. { MergePV }