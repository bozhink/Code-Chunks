{ (C) 1999, Arthur Vargas Lopes  }
{ Arquivo fonte SortBol.Pas      }
PROGRAM SortBol;
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

	PROCEDURE Sort_Bolha(VAR V : Vetor; N : INTEGER);
	VAR
		Atual       : INTEGER;
		Ultimo      : INTEGER;
		Outro_Ciclo : BOOLEAN;
	BEGIN
		Ultimo      := N;
		Outro_Ciclo := TRUE;
		WHILE Outro_Ciclo DO BEGIN
			Outro_Ciclo := FALSE;
			FOR Atual := 1 TO Ultimo - 1 DO
				IF V[Atual] > V[Atual+1] THEN BEGIN
					Swap(V[Atual],V[Atual+1]);
					Outro_Ciclo := TRUE;
					END;
			Ultimo := Ultimo - 1;
			END;
	END; { Sort_Bolha }

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

	Sort_Bolha(Dados,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { SortBol }
