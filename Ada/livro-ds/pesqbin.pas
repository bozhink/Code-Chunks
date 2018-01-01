{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte PesqBin.Pas     }

PROGRAM PesqBin;

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

	{ Algoritmo 10.6 }
	PROCEDURE Insere(VAR T : Estrutura; K : Key);
	VAR
		I, J : INTEGER;
	BEGIN
		IF T.N = Max THEN BEGIN
			Writeln('*** overflow na tabela.');
			Halt;
			END;

		{ Encontra a posição correta para inserir K }
		I := 1;
		WHILE (I < T.N) AND (K > T.V[I]) DO
			I := I + 1;

		{ Move as chaves a direita de I - 1 uma posiçao
		  para a direita }
		FOR J := T.N DOWNTO I DO
			T.V[J+1] := T.V[J];

		T.N    := T.N + 1;
		T.V[I] := K;

	END; { Insere }

	{ Algoritmo 10.7 }
	FUNCTION Consulta(VAR T : Estrutura; K : Key) : INTEGER;
	VAR
		L, H, M : INTEGER;
	BEGIN
		Consulta := 0;

		L := 1;
		H := T.N;

		WHILE L <= H DO BEGIN

			M := (L + H) DIV 2;

			IF K = T.V[M] THEN BEGIN
				Consulta := M;
				L        := H + 1;
				END
			ELSE IF K < T.V[M] THEN
				H := M - 1
			ELSE
				L := M + 1;
			END;

	END; { Consulta }

	{ Algoritmo 10.8 }
	PROCEDURE Remove(VAR T : Estrutura; P : INTEGER);
	VAR
		I : INTEGER;
	BEGIN
		IF (P < 1) OR (P > T.N) THEN
			Writeln('*** nao pode remover na posicao '
				, P)
		ELSE BEGIN
			FOR I := P TO T.N - 1 DO
				T.V[I] := T.V[I+1];

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

END. { PesqBin }