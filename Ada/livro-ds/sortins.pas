{ (C) 1999, Arthur Vargas Lopes  }
{ Arquivo fonte SortIns.Pas      }
PROGRAM SortIns;
	USES Crt;
TYPE
	Key = INTEGER;

	Vetor = ARRAY[1..10] OF Key;

VAR
	Dados : Vetor;

	PROCEDURE Sort_Insercao(VAR V : Vetor; N : INTEGER);
	VAR
		Atual       : INTEGER;
		Anterior    : INTEGER;
		Chave_Atual : Key;
	BEGIN
		FOR Atual := 2 TO N DO BEGIN
			Chave_Atual := V[Atual];
			Anterior    := Atual - 1;
			WHILE Anterior > 0 DO
				IF V[Anterior] > Chave_Atual THEN BEGIN
					V[Anterior+1] := V[Anterior];
					Anterior      := Anterior - 1;
					END;
			V[Anterior+1] := Chave_Atual;
			END;
	END; { Sort_Insercao }

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

	Sort_Insercao(Dados,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { SortIns }
