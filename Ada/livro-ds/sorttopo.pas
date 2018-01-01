{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte SortTopo.Pas    }

PROGRAM SortTopo;

	USES Crt;

CONST
	First = 1;
	Last  = 9;
TYPE
	Grafo     = ARRAY[First .. Last,First .. Last] OF BOOLEAN;
	Visitados = ARRAY[First .. Last] OF BOOLEAN;
VAR
	D1 : Grafo;
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

	{ Algoritmo 6.25 }
	PROCEDURE Sort_Topologico(D     : Grafo);
	VAR
		I : INTEGER;
		V : Visitados;

		{ Sub-algoritmo 6.25.1 }
		PROCEDURE Sort(D     : Grafo;
		               I     : INTEGER;
		               VAR V : Visitados);
		VAR
			J : INTEGER;
		BEGIN
			V[I] := TRUE;

			FOR J := First TO Last DO
				IF Adjacente(D,I,J) THEN
					IF (NOT V[J]) THEN
						Sort(D,J,V);
			Write(I : 3);

		END; { Sort }
	BEGIN
		{ Inicializa vetor de visitados }
		FOR I := First TO Last DO
			V[I] := FALSE;

		FOR I := First TO Last DO
			IF (NOT V[I]) THEN
				Sort(D,I,V);
	END; { Sort_Topologico }

BEGIN
	Inicializa(D1);

	Conecta(D1,1,2);
	Conecta(D1,2,4);
	Conecta(D1,2,5);
	Conecta(D1,4,7);
	Conecta(D1,5,7);
	Conecta(D1,3,6);
	Conecta(D1,6,8);
	Conecta(D1,6,9);
	Conecta(D1,7,9);

	Writeln('Dag D1:');
	Imprime(D1);
	Writeln;

	Write('A ordenacao topologica inversa de D1 e'': ');
	Sort_Topologico(D1);
	Writeln;
END. { SortTopo }
