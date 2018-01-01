{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Merge2V.Pas     }

PROGRAM Merge2V;

	USES Crt;

CONST
	N       = 26 * 26;    { N�mero de registros a serem
				ordenados }
	M       = N DIV 2;    { Comprimento do intervalo da
				�rea de ordena��o }

	Entrada = 'c:A.DAT';    { Nome do arquivo de entrada }
	Saida   = 'd:A2.DAT';   { Nome do arquivo de sa�da }

TYPE
	Key   = ARRAY[1..2] OF CHAR; { Chave de ordena��o }

	Data  = RECORD        { Registro do arquivo de dados }
		Nome    : Key;
		Idade   : INTEGER;
		Salario : REAL;
		END;

	Rec   = RECORD        { Registro da area de ordena��o }
		Chave : Key;
		Tag   : INTEGER;
		END;

	Vetor = ARRAY[1..M] OF Rec; { �rea de ordena��o }

	Arq   = FILE OF Data; { Destritor para arquivo a ser ordenado }
	Arq_T = FILE OF Rec;  { Destritor para de refer�ncia ordenado }

VAR
	I, J, K   : INTEGER;

	Registro  : Data;
	Registro2 : Data;

	A        : Arq;             { Descritor do arquivo de entrada }
	A_Out    : FILE OF INTEGER; { Descritor do arquivo de sa�da }

	V        : Vetor;           { Armazena �rea de ordena��o }

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

	{ Algoritmo 9.1 }
	PROCEDURE Merge_Duas_Vias(A : STRING;A2 : STRING);
	VAR
		A_In   : Arq;
		F1, F2 : Arq_T;
		R1, R2 : Data;
		I, J   : INTEGER;

		PROCEDURE Distribui_F1;
		VAR
			I : INTEGER;
		BEGIN
			{ Abre o arquivo de entrada }
			Assign(A_In,A);
			Reset(A_In);

			{ Armazena as primeiras M chaves e
			  seus respectivos tags em V }
			FOR I := 1 TO M DO BEGIN
				Read(A_In, R1);
				V[I].Chave := R1.Nome;
				V[I].Tag   := I;
				END;

			{ Ordena as chaves de V }
			Shell_Sort(M);

			{ Grava o conte�do de V no arquivo F1 }
			Assign(F1,'F1.DAT');
			ReWrite(F1);

			FOR I := 1 TO M DO
				Write(F1, V[I]);

			Close(F1);

		END; { Distribui_F1 }

		PROCEDURE Distribui_F2;
		VAR
			I, J : INTEGER;
		BEGIN
			{ Armazena as chaves restantes e
			  seus respectivos tags em V }
			J := 1;
			I := M + 1;
			WHILE I <= N DO BEGIN
				Read(A_In, R1);
				V[J].Chave := R1.Nome;
				V[J].Tag   := I;
				I := I + 1;
				J := J + 1;
				END;

			{ Fecha o arquivo de entrada }
			Close(A_In);

			{ Ordena as chaves de V }
			Shell_Sort(J-1);

			{ Grava o conte�do de V no arquivo F2 }
			Assign(F2,'F2.DAT');
			ReWrite(F2);

			FOR I := 1 TO N-M DO
				Write(F2, V[I]);

			Close(F2);

		END; { Distribui_F2 }

		PROCEDURE Fase;
		BEGIN
			{ Reabre F1 e F2 }
			Reset(F1);
			Reset(F2);

			{ Abre o arquivo de sa�da }
			Assign(A_Out,A2);
			ReWrite(A_Out);


			{ Le um registro de F1 e F2 }
			Read(F1, V[1]);

			Read(F2, V[2]);

			I := M;     { F1 cont�m I registros }
			J := N - M; { F2 cont�m J registros }

			{ Grave o tag do registro que contiver
			  a menor chave e leia um novo registro
			  do arquivo associado com esta chave
			  enquanto existirem registros a serem
			  lidos em ambos os arquivos F1 e F2 }
			WHILE (I > 0) AND (J > 0) DO
				IF V[1].Chave < V[2].Chave THEN BEGIN
					Write(A_Out, V[1].Tag);
					I := I - 1;
					IF I > 0 THEN
						Read(F1, V[1]);
					END
				ELSE BEGIN
					Write(A_Out, V[2].Tag);
					J := J - 1;
					IF J > 0 THEN
						Read(F2, V[2]);
					END;

			{ Neste ponto apenas um dos arquivos de entrada
			  cont�m chaves cujos tags ainda n�o foram
			  transferidos para o arquivo de refer�ncia }

			{ Grave os tags restantes do arquivo F1 }
			WHILE I > 0 DO BEGIN
				Write(A_Out, V[1].Tag);
				I := I - 1;
				IF I > 0 THEN
					Read(F1, V[1]);
				END;

			{ Grave os tags restantes do arquivo F2 }
			WHILE J > 0 DO BEGIN
				Write(A_Out, V[2].Tag);
				J := J - 1;
				IF J > 0 THEN
					Read(F2, V[2]);
				END;

			Close(F1);
			Close(F2);
			Erase(F1);
			Erase(F2);

			{ Fecha o arquivo de sa�da }
			Close(A_Out);

		END; { Fase }

	BEGIN
		{ Ordena as primeiras M chaves e gera F1 }
		Distribui_F1;

		{ Ordena as chaves restantes e gera F2 }
		Distribui_F2;

		{ Realiza a opera��o de merge com F1 e F2
		  gerando o arquivo de refer�ncia }
		Fase;

	END; { Merge_Duas_Vias }

	PROCEDURE Simula_Dados;
	BEGIN

		{ Produz dados para ordena��o }
		Assign(A,Entrada);
		ReWrite(A);

		Registro.Idade   := 18;
		Registro.Salario := 1000.0;

		{ Grave N registros sendo que o nome (chave) de cada
		  registro � composto por duas letras geradas em
		  ordem inversa }
		FOR I := 25 DOWNTO 0 DO BEGIN
			Registro.Nome[1] := Chr(I + Ord('A'));
			FOR J := 25 DOWNTO 0 DO BEGIN
				Registro.Nome[2] := Chr(J + Ord('a'));
				Write(A, Registro);
				Registro.Idade   := Registro.Idade + 1;
				Registro.Salario := Registro.Salario + 500.0;
				IF Registro.Idade > 69 THEN
					Registro.Idade := 18;
				IF Registro.Salario > 5000.00 THEN
					Registro.Salario := 1000.0;
				END;
			END;

		Close(A);

	END; { Simula_Dados }

	{ Verifica se as chaves est�o em ordem }
	PROCEDURE Verifica_Ordenacao;
	VAR
		Tag : INTEGER;
	BEGIN
		{ Abre o arquivo de entrada }
		Assign(A,Entrada);
		Reset(A);

		{ Abre o arquivo de refer�ncia }
		Assign(A_Out,Saida);
		Reset(A_Out);

		{ Leia o tag do registro com a menor chave }
		Read(A_Out,Tag);

		{ Posicione o arquivo de entrada para ler
		  o registro associado com este tag }
		Seek(A,Tag - 1);

		{ Leia o registro completo do arquivo de entrada }
		Read(A,Registro);

		{ Verifica se a chave de um registro �
		  maior que a de sucessor para todos os registros }
		I := 2;
		WHILE I <= N DO BEGIN
			Read(A_Out,Tag);
			Seek(A,Tag - 1);
			Read(A,Registro2);
			IF Registro.Nome > Registro2.Nome THEN BEGIN
				WriteLn('O registro ', I, 'esta'' fora de ordem...');
				Writeln(Registro.Nome, ' ', Registro2.Nome, Tag - 1);
				Halt;
				END;
			Registro := Registro2;
			I := I + 1;
			END;

		Close(A);
		Close(A_Out);
		Erase(A_Out);

		WriteLn('A ordem esta'' correta!');

	END; { Verifica_Ordenacao }

BEGIN

	Simula_Dados;

	Merge_Duas_Vias(Entrada,Saida);

	Verifica_Ordenacao;

END. { Merge2V }