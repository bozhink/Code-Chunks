{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte HeapSort.Pas    }

PROGRAM HeapSort;

	USES Crt;

CONST
	N      = 10;
	MValor = 99;
TYPE
	Key = INTEGER;
	Heap = RECORD
		V : ARRAY[0 .. N] OF Key;
		Q : INTEGER;
		END;
	Vetor = ARRAY[1..N] OF Key;

VAR
	Dados : Vetor;

	{ Algoritmo 7.5 }
	PROCEDURE Inicializa(VAR H : Heap);
	BEGIN
		H.Q    := 0;
		H.V[0] := MValor;

	END; { Inicializa }

	{ Algoritmo 7.6 }
	PROCEDURE Insere(VAR H : Heap; Va : Key);
	VAR
		I : INTEGER;
	BEGIN
		IF H.Q = N THEN BEGIN
			Writeln('*** Heap overflow.');
			Halt;
			END;
		H.Q      := H.Q + 1;
		H.V[H.Q] := Va;
		I        := H.Q;
		WHILE H.V[I DIV 2] <= Va DO BEGIN
			H.V[I] := H.V[I DIV 2];
			I      := I DIV 2
			END;
		H.V[I] := Va;

	END; { Insere }

	{ Algoritmo 7.7 }
	FUNCTION Remove(VAR H : Heap) : Key;
	VAR
		J, K    : INTEGER;
		Va      : Key;
		Termina : BOOLEAN;
	BEGIN
		IF H.Q = 0 THEN BEGIN
			Writeln('*** Heap underflow.');
			Halt;
			END;
		Remove  := H.V[1];
		H.V[1]  := H.V[H.Q];
		H.Q     := H.Q - 1;
		Termina := FALSE;
		Va      := H.V[1];
		K       := 1;
		WHILE (K <= (H.Q DIV 2)) AND
		      (NOT Termina) DO BEGIN
			J := K + K;
			IF J < H.Q THEN
				IF H.V[J] < H.V[J+1] THEN
					J := J + 1;
			IF Va >= H.V[J] THEN
				Termina := TRUE
			ELSE BEGIN
				H.V[K] := H.V[J];
				K      := J;
				END;
			END;
		H.V[K] := Va;
	END; { Remove }

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

	{ Algoritmo 8.6 }
	PROCEDURE Heap_Sort(VAR V : Vetor; N : INTEGER);
	VAR
		H1 : Heap;
		I  : INTEGER;
		X  : Key;
	BEGIN
		Inicializa(H1);

		FOR I := 1 TO N DO
			Insere(H1,V[I]);

		FOR I := 1 TO N DO BEGIN
			X := Remove(H1);
			V[N - I + 1] := X;
			END;
	END; { Heap_Sort }

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

	Heap_Sort(Dados,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { HeapSort }