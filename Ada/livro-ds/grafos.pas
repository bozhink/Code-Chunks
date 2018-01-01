{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte GrafoS.Pas      }

PROGRAM GrafoS;

	USES Crt;

CONST
	First = 1;
	Last  = 4;
TYPE
	Grafo = ARRAY[First .. Last,First .. Last] OF BOOLEAN;

VAR
	G1 : Grafo;

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

BEGIN

	Inicializa(G1);
	Conecta(G1,1,2);
	Conecta(G1,1,3);
	Conecta(G1,4,4);
	Writeln('Grafo com arcos {1,2}, {1,3}, {4,4}');
	Imprime(G1);
	Conecta(G1,3,2);
	Desconecta(G1,1,3);
	Writeln;
	Writeln;
	Writeln('Grafo com arcos {1,2}, {3,2}, {4,4}');
	Imprime(G1);
END. { GrafoS }
