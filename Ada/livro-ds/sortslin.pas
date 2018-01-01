{ (C) 1999, Arthur Vargas Lopes  }
{ Arquivo fonte SortSLin.Pas     }
PROGRAM SortSLin;
	USES Crt;
TYPE
	Key = INTEGER;

	Vetor = ARRAY[1..10] OF Key;

VAR
	Dados : Vetor;

	PROCEDURE Swap(VAR X, Y : Key);
	VAR
		Temp : Key;
	BEGIN
		Temp := X;
		X    := Y;
		Y    := Temp;
	END; { Swap }

	PROCEDURE Sort_Selecao_Linear(VAR V : Vetor; N : INTEGER);
	VAR
		IMenor    : INTEGER;
		Candidato : INTEGER;
	BEGIN
		FOR IMenor := 1 TO N - 1 DO
			FOR Candidato := IMenor + 1 TO N DO
				IF V[IMenor] > V[Candidato] THEN
					Swap(V[IMenor],V[Candidato]);
	END; { Sort_Selecao_Linear }

	PROCEDURE Imprime_Vetor(Msg : STRING; V : Vetor; N : INTEGER);
	VAR
		I : INTEGER;
	BEGIN
		Write(Msg);
		FOR I := 1 TO N DO BEGIN
			Write(V[I]);
			IF I <> N THEN
				Write(',');
			END;
		Writeln;
	END; { Imprime_Vetor }
BEGIN
	{ Inicializa Dados para ordenação }
	Dados[ 1] := 10;
	Dados[ 2] :=  9;
	Dados[ 3] :=  8;
	Dados[ 4] :=  7;
	Dados[ 5] :=  6;
	Dados[ 6] :=  5;
	Dados[ 7] :=  4;
	Dados[ 8] :=  3;
	Dados[ 9] :=  2;
	Dados[10] :=  1;

	Imprime_Vetor('Vetor antes da ordenacao:  ',Dados,10);

	Sort_Selecao_Linear(Dados,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { SortSLin }
