{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte MergeSor.Pas    }

PROGRAM MergeSor;

	USES Crt;

CONST
	N     = 10;
TYPE
	Key   = INTEGER;
	Vetor = ARRAY[1..N] OF Key;

VAR
	Dados : Vetor;

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

	{ Algoritmo 8.7 }
	PROCEDURE Merge_Sort(VAR V : Vetor; Esq, Dir, N : INTEGER);
	VAR
		Temp    : Vetor;
		I, J, K : INTEGER;
		Metade  : INTEGER;
	BEGIN
		IF (Dir - Esq) > 0 THEN BEGIN
			Metade := (Dir + Esq) DIV 2;
			Merge_Sort(V,Esq,Metade,N);
			Merge_Sort(V,Metade+1,Dir,N);

			FOR I := Esq TO Metade DO
				Temp[I] := V[I];
			FOR I := Metade+1 TO Dir DO
				Temp[Dir+Metade+1-I] := V[I];

			I := Esq;
			J := Dir;

			FOR K := Esq TO Dir DO
				IF Temp[I] < Temp[J] THEN BEGIN
					V[K] := Temp[I];
					I := I + 1;
					END
				ELSE BEGIN
					V[K] := Temp[J];
					J := J - 1;
					END;
			END;
	END; { Merge_Sort }

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

	Merge_Sort(Dados,1,10,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { MergeSor }