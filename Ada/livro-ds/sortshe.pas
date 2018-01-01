{ (C) 1999, Arthur Vargas Lopes  }
{ Arquivo fonte SortShe.Pas      }
PROGRAM SortShe;
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

	{ Algoritmo 8.5 }
	PROCEDURE Shell_Sort(VAR V : Vetor; N : INTEGER);
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
					IF V[Base] > V[Base+D] THEN BEGIN
						Swap(V[Base],V[Base+D]);
						Base := Base - D;
						END
					ELSE
						Base := 0;
				END;
			D := D DIV 2;
			END;
	END; { Shell_Sort }

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

	Shell_Sort(Dados,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { SortShe }
