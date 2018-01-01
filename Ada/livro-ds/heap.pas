{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Heap.Pas        }

PROGRAM Heap;

	USES Crt;

CONST
	N      = 12;
	MValor = 99;
TYPE
	Tipo_Dado = INTEGER;
	Heap = RECORD
		V : ARRAY[0 .. N] OF Tipo_Dado;
		Q : INTEGER;
		END;

VAR
	H1 : Heap;

	{ Algoritmo 7.5 }
	PROCEDURE Inicializa(VAR H : Heap);
	BEGIN
		H.Q    := 0;
		H.V[0] := MValor;

	END; { Inicializa }

	{ Algoritmo 7.6 }
	PROCEDURE Insere(VAR H : Heap; Va : Tipo_Dado);
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
	FUNCTION Remove(VAR H : Heap) : Tipo_Dado;
	VAR
		J, K    : INTEGER;
		Va      : Tipo_Dado;
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

	{ Algoritmo 7.8 }
	PROCEDURE Imprime(H : Heap; Msg : STRING);
	VAR
		I, J  : INTEGER;
		Nivel : INTEGER;

	BEGIN
		Writeln(Msg);
		Nivel := 1;
		Writeln(H.V[1] : 39);
		I     := Nivel + 1;
		WHILE I <= H.Q DO BEGIN
			J := 1;
			WHILE (J <= Nivel * 2) AND (I <= H.Q) DO BEGIN
				Write(H.V[I] : 80 DIV (Nivel * 2 + 1));
				I := I + 1;
				J := J + 1;
				END;
			Writeln;
			Nivel := Nivel + 1;
			END;
	END; { Imprime }
BEGIN
	Inicializa(H1);
	Insere(H1,40);
	Insere(H1,12);
	Insere(H1,35);
	Insere(H1,15);
	Insere(H1,2);
	Insere(H1,20);
	Insere(H1,17);
	Insere(H1,19);
	Insere(H1,8);
	Imprime(H1,'Heap apos a insercao de 40,12,35,2,20,17,8,19,15:');
	Writeln('Remove(H1) = ', Remove(H1));
	Imprime(H1,'Heap apos remocao do maior elemento:');

END. { Heap }