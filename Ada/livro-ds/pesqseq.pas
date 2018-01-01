{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte PesqSeq.Pas     }

PROGRAM PesqSeq;

	USES Crt;

CONST
	Max = 10;
TYPE
	Key = INTEGER;
	Estrutura = RECORD
		V : ARRAY[1 .. Max] OF Key;
		N : INTEGER;
		END;

VAR
	Tab : Estrutura;

	{ Algoritmo 10.1 }
	PROCEDURE Inicializa(VAR T : Estrutura);
	BEGIN
		T.N := 0;

	END; { Inicializa }

	{ Algoritmo 10.2 }
	PROCEDURE Insere(VAR T : Estrutura; K : Key);
	BEGIN
		IF T.N = Max THEN BEGIN
			Writeln('*** overflow na tabela.');
			Halt;
			END;

		T.N      := T.N + 1;
		T.V[T.N] := K;

	END; { Insere }

	{ Algoritmo 10.3 }
	FUNCTION Consulta(VAR T : Estrutura; K : Key) : INTEGER;
	VAR
		I : INTEGER;
	BEGIN
		Consulta := 0;

		I := 1;
		WHILE I <= T.N DO
			IF T.V[I] = K THEN BEGIN
				Consulta := I;
				I        := T.N + 1;
				END
			ELSE
				I := I + 1;
	END; { Consulta }

	{ Algoritmo 10.4 }
	PROCEDURE Remove(VAR T : Estrutura; P : INTEGER);
	BEGIN
		IF (P < 1) OR (P > T.N) THEN
			Writeln('*** nao pode remover na posicao '
				, P)
		ELSE BEGIN
			T.V[P] := T.V[T.N];
			T.N    := T.N - 1;
			END;

	END; { Remove }

	{ Algoritmo 10.5 }
	PROCEDURE Imprime(Msg : STRING; T : Estrutura);
	VAR
		I : INTEGER;
	BEGIN
		Write(Msg);
		FOR I := 1 TO T.N DO BEGIN
			Write(T.V[I]);
			IF I <> T.N THEN
				Write(',');
			END;
		Writeln;
	END; { Imprime }

BEGIN
	Inicializa(Tab);

	Insere(Tab,5);
	Insere(Tab,1);
	Insere(Tab,4);
	Insere(Tab,-1);
	Insere(Tab,2);

	Imprime('Tab apos a insercao de 5,1,4,-1,2: ', Tab);

	Writeln('Consulta(Tab,4) e'' igual a ', Consulta(Tab,4));

	Writeln('Consulta(Tab,3) e'' igual a ', Consulta(Tab,3));

	Remove(Tab,3);

	Imprime('Tab apos a remocao da terceira chave: ', Tab);

END. { PesqSeq }