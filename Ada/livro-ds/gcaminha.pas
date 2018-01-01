{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte GCaminha.Pas    }

PROGRAM GCaminha;

	USES Crt;

CONST
	First = 1;
	Last  = 7;
TYPE
	Grafo     = ARRAY[First .. Last,First .. Last] OF BOOLEAN;

	Visitados = ARRAY[First .. Last] OF BOOLEAN;
VAR
	G1 : Grafo;
	V  : Visitados;
	I  : INTEGER;

	{ Algoritmo 6.1 }
	PROCEDURE Inicializa(VAR G : Grafo);
	VAR
		I, J : INTEGER;
	BEGIN
		FOR I := First TO Last DO
			FOR J := First TO Last DO
				G[I,J] := FALSE;
	END; { Inicializa }

	{ Algoritmo 6.2 }
	PROCEDURE Conecta(VAR G : Grafo; I, J : INTEGER);
	BEGIN
		G[I,J] := TRUE;

	END; { Conecta }

	{ Algoritmo 6.3 }
	PROCEDURE Desconecta(VAR G : Grafo; I, J : INTEGER);
	BEGIN
		G[I,J] := FALSE;

	END; { Desconecta }

	{ Algoritmo 6.4 }
	FUNCTION Adjacente(G : Grafo; I, J : INTEGER) : BOOLEAN;
	BEGIN
		Adjacente := G[I,J];

	END; { Adjacente }

	{ Algoritmo 6.5 }
	PROCEDURE Imprime(G : Grafo);
	VAR
		I, J : INTEGER;
	BEGIN
		Write(' ');

		FOR I := First TO Last DO
			Write(I : 2);
		WriteLn;

		FOR I := First TO Last DO BEGIN
			Write(I);
			FOR J := First TO Last DO
				IF Adjacente(G,I,J) THEN
					Write(' 1')
				ELSE
					Write(' 0');
			Writeln;
			END;
	END; { Imprime }


	{ Algoritmo 6.12 }
	PROCEDURE DFS(G : Grafo; I : INTEGER; VAR V : Visitados);
	VAR
		J : INTEGER;
	BEGIN
		V[I] := TRUE;
		Write(I : 3);
		FOR J := First TO Last DO
			IF Adjacente(G,I,J) THEN
				IF (NOT V[J]) THEN
					DFS(G,J,V);
	END; { DFS }

	{ Algoritmo 6.13 }
	PROCEDURE BFS(G : Grafo; I : INTEGER);

	CONST Max = 10; { Define o número máximo de
	                  elementos da fila circular }

	TYPE	{ Define o tipo Fila circular }
		Fila = RECORD
			Q       : ARRAY[1 .. Max] OF INTEGER;
			Inicio  : INTEGER;
			Fim     : INTEGER;
			Tamanho : INTEGER;
			END;

		{ Implementação do  4.4 }
		PROCEDURE Inicializa(VAR F : Fila);
		BEGIN
			F.Inicio  := 1;
			F.Fim     := 0;
			F.Tamanho := 0;
		END; { Inicializa }

		{ Implementação do  4.5 }
		PROCEDURE Queue(VAR F : Fila; D : INTEGER);
		BEGIN
			{ Verifica overflow de fila circular }
			IF F.Tamanho = Max THEN BEGIN
				writeln('*** Overflow na fila ***');
				Halt;
				END
			ELSE BEGIN
				F.Fim      := F.Fim MOD Max + 1;
				F.Q[F.Fim] := D;
				F.Tamanho  := F.Tamanho + 1;
				END;
		END; { Queue }

		{ Implementação do  4.6 }
		PROCEDURE DeQueue(VAR F : Fila; VAR R : INTEGER);
		BEGIN
			{ Verifica underflow de fila circular }
			IF F.tamanho = 0 THEN BEGIN
				writeln('*** Underflow na fila ***');
				Halt;
				END
			ELSE BEGIN
				R         := F.Q[F.Inicio];
				F.Inicio  := F.Inicio MOD Max + 1;
				F.Tamanho := F.Tamanho - 1;
				END;
		END; { DeQueue }

	VAR
		V : Visitados;
		F : Fila;
		X : INTEGER;
		J : INTEGER;
	BEGIN
		{ Inicializa vetor de visitados }
		FOR X := First TO Last DO
			V[X] := FALSE;
		Inicializa(F);
		Write(I : 3);
		V[I] := TRUE;
		Queue(F,I);
		WHILE F.Tamanho > 0 DO BEGIN
			DeQueue(F,X);
			FOR J := First TO Last DO
				IF Adjacente(G,X,J) AND
				   (NOT V[J]) THEN BEGIN
					Write(J : 3);
					V[J] := TRUE;
					Queue(F,J);
					END;
			END;
	END; { BFS }

BEGIN

	Inicializa(G1);
	Conecta(G1,1,2);
	Conecta(G1,1,5);
	Conecta(G1,1,7);
	Conecta(G1,2,3);
	Conecta(G1,2,6);
	Conecta(G1,2,4);
	Conecta(G1,3,4);
	Conecta(G1,5,4);
	Conecta(G1,5,6);
	Conecta(G1,6,7);
	Conecta(G1,4,7);
	Writeln('Grafo com sete vertices:');
	Imprime(G1);
	{ Inicializa vetor de visitados }
	FOR I := First TO Last DO
		V[I] := FALSE;
	Writeln;
	Write('DFS(G1,1,V) = ');
	DFS(G1,1,V);
	Writeln;
	Writeln;
	Write('BFS(G1,1) = ');
	BFS(G1,1);
	Writeln;

END. { GCaminha }
