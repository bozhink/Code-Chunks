{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte GrafoA.Pas      }

PROGRAM GrafoA;

	USES Crt;

CONST
	First = 1;
	Last  = 4;
TYPE
	Tipo = INTEGER;
	Elo = ^No;         { Define um tipo ponteiro para No }

	No = RECORD  { Define o lay-out de um no da lista }
		Dado : Tipo;
		Link : Elo;
		END;

	Grafo = ARRAY[First .. Last] OF Elo;

VAR
	G1 : Grafo;

	{ Algoritmo 6.6 }
	PROCEDURE Inicializa(VAR G : Grafo);
	VAR
		I : Tipo;
	BEGIN
		FOR I := First TO Last DO
			G[I] := NIL;
	END; { Inicializa }

	{ Algoritmo 6.7 }
	PROCEDURE Conecta(VAR G : Grafo; I, J : Tipo);
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Conecta');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado := J;
		P^.Link := G[I];
		G[I]    := P;
	END; { Conecta }

	{ Algoritmo 6.8 }
	PROCEDURE Desconecta(VAR G : Grafo; I, J : Tipo);
	VAR
		P, Q    : Elo;
		Mais_Um : BOOLEAN;
	BEGIN
		Mais_Um := TRUE;
		P       := G[I];
		WHILE Mais_Um AND (P <> NIL) DO
			IF P^.Dado = J THEN
				Mais_Um := FALSE
			ELSE BEGIN
				Q := P;
				P := P^.Link;
				END;
		IF P = NIL THEN BEGIN
			Write(' nao tem elementos adjacencia');		
			Halt;
			END;
		IF G[I] = P THEN
			G[I] := P^.Link
		ELSE
			Q^.Link := P^.Link;
		Dispose(P);
	END; { Desconecta }

	{ Algoritmo 6.9 }
	FUNCTION Adjacente(G : Grafo; I, J : Tipo) : BOOLEAN;
	VAR
		P : Elo;
	BEGIN
		Adjacente := FALSE;
		P := G[I];
		WHILE P <> NIL DO
			IF P^.Dado = J THEN BEGIN
				Adjacente := TRUE;
				P         := NIL;
				END
			ELSE
				P := P^.Link;
	END; { Adjacente }

	{ Algoritmo 6.10 }
	PROCEDURE Libera_Memoria(G : Grafo);
	VAR
		P, Q : Elo;
		I    : Tipo;
	BEGIN
		FOR I := First TO Last DO BEGIN
			P    := G[I];
			G[I] := NIL;
			WHILE P <> NIL DO BEGIN
				Q := P;
				P := P^.Link;
				Dispose(Q);
				END;
			END;
	END; { Libera_Memoria }

	{ Algoritmo 6.11 }
	PROCEDURE Imprime(G : Grafo);
	VAR
		I : Tipo;
		P : Elo;
	BEGIN
		FOR I := First TO Last DO BEGIN
			Write(I, ' : ');
			P := G[I];
			WHILE P <> NIL DO BEGIN
				Write(P^.Dado);
				P := P^.Link;
				IF P <> NIL THEN
					Write(', ');
				END;
			IF G[I] = NIL THEN
				Write(I, ' nao tem adjacencia');
			Writeln('.');
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
	Libera_Memoria(G1);
END. { Testa_Grafo_Lista_Adjacencia }
