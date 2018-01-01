{ (C) 1998, Arthur Vargas Lopes  }
{ Arquivo fonte SortSLO.Pas      }
PROGRAM Selecao_Linear_Otimizado;
	USES WinCrt;
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

	PROCEDURE Sort_Selecao_Linear_Opt(VAR V : Vetor; N : INTEGER);
	VAR
		IMenor    : INTEGER;
		Candidato : INTEGER;
		IndiceC   : INTEGER;
		MenorC    : Key;

	BEGIN
		FOR IMenor := 1 TO N - 1 DO BEGIN
			IndiceC := IMenor;
			MenorC  := V[IMenor];
			FOR Candidato := IMenor + 1 TO N DO
				IF MenorC > V[Candidato] THEN BEGIN
					IndiceC := Candidato;
					MenorC  := V[Candidato];
					END;
			Swap(V[IMenor],V[IndiceC]);
			END;
	END; { Sort_Selecao_Linear_Opt }

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

	Sort_Selecao_Linear_Opt(Dados,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { Selecao_Linear_Otimizado }
