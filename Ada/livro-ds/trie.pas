{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Trie.Pas        }
PROGRAM Trie;

	USES Crt;

CONST
	Max  = 27;

TYPE
	Elo = ^No;

	No  = RECORD
		C   : ARRAY[1..Max] OF Elo;
		Tag : INTEGER;
		END;

VAR
	Raiz      : Elo;
	K         : INTEGER;

	{ Algoritmo 10.39 }
	PROCEDURE Inicializa(VAR R : Elo);
	VAR
		I : INTEGER;
	BEGIN
		New(R);
		IF R = NIL THEN BEGIN
			Writeln('*** Inicializa: Memoria insuficiente');
			Halt;
			END;

		FOR I := 1 TO Max DO
			R^.C[I] := NIL;

		R^.Tag := 0;

	END; { Inicializa }

	{ Algoritmo 10.40 }
	PROCEDURE Insere(R : Elo; K : STRING; Tag : INTEGER);
	VAR
		P, Q    : Elo;
		I, J, M : INTEGER;
		L       : CHAR;
	BEGIN
		P := R;
		FOR I := 1 TO Length(K) DO BEGIN
			L := UpCase(K[I]);
			IF (L >= 'A') AND (L <= 'Z') THEN
				J := Ord(L) - Ord('A') + 1
			ELSE
				J := Max;

			IF P^.C[J] = NIL THEN BEGIN
				New(Q);
				IF Q = NIL THEN BEGIN
					Write('*** Insere: Memoria');
					Writeln(' insuficiente');
					Halt;
					END;
				FOR M := 1 TO Max DO
					Q^.C[M] := NIL;
				Q^.Tag  := 0;
				P^.C[J] := Q;
				END;
			P := P^.C[J];
			END;

		IF P^.Tag > 0 THEN BEGIN
			Write('*** Insere: Chave ', K, ' ja existe');
			Halt;
			END;

		P^.Tag := Tag;

	END; { Insere }

	{ Algoritmo 10.41 }
	FUNCTION Consulta(R : Elo; K : STRING) : INTEGER;
	VAR
		P    : Elo;
		I, J : INTEGER;
		L    : CHAR;
		Para : BOOLEAN;
	BEGIN
		P        := R;
		Consulta := 0;
		Para     := FALSE;

		I        := 1;
		WHILE (I <= Length(K)) AND NOT Para DO BEGIN
			L := UpCase(K[I]);
			IF (L >= 'A') AND (L <= 'Z') THEN
				J := Ord(L) - Ord('A') + 1
			ELSE
				J := Max;

			IF P^.C[J] = NIL THEN
				Para := TRUE
			ELSE
				P := P^.C[J];
			I := I + 1;
			END;

		IF (P^.Tag > 0) AND NOT Para THEN
			Consulta := P^.Tag;

	END; { Consulta }

	{ Algoritmo 10.42 }
	FUNCTION Remove(R : Elo; K : STRING) : BOOLEAN;
	VAR
		P    : Elo;
		I, J : INTEGER;
		L    : CHAR;
		Para : BOOLEAN;
	BEGIN
		P      := R;
		Remove := FALSE;
		Para   := FALSE;

		I        := 1;
		WHILE (I <= Length(K)) AND NOT Para DO BEGIN
			L := UpCase(K[I]);
			IF (L >= 'A') AND (L <= 'Z') THEN
				J := Ord(L) - Ord('A') + 1
			ELSE
				J := Max;

			IF P^.C[J] = NIL THEN
				Para := TRUE
			ELSE
				P := P^.C[J];
			I := I + 1;
			END;

		IF (P^.Tag > 0) AND NOT Para THEN BEGIN
			Remove := TRUE;
			P^.Tag := 0;
			END;

	END; { Remove }


	{ Algoritmo 10.43 }
	PROCEDURE Imprime(P : Elo; K : STRING);
	VAR
		I : INTEGER;
	BEGIN
		IF P <> NIL THEN BEGIN

			IF P^.Tag > 0 THEN
				Writeln(P^.Tag, ' ', K);

			FOR I := 1 TO Max DO
				IF I = Max THEN
					Imprime(P^.C[I],K + ' ')
				ELSE
					Imprime(P^.C[I],K + Chr(I + Ord('A') - 1));
			END;

	END; { Imprime }
BEGIN
	Inicializa(Raiz);

	Insere(Raiz,'Fulano de Tal',1010);
	Insere(Raiz,'Fulana de Tal',1020);
	Insere(Raiz,'Ciclano de Tal',1030);
	Insere(Raiz,'Beltrano',1040);
	Insere(Raiz,'Pertrano',1050);
	Insere(Raiz,'Rulanx de Tal',1060);
	Insere(Raiz,'Bulany de Tal',1070);
	Insere(Raiz,'Ticlanx de Tal',1080);
	Insere(Raiz,'Keltranx',1090);
	Insere(Raiz,'Aertranx',1100);

	Imprime(Raiz,'');

	K := Consulta(Raiz,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	IF Remove(Raiz,'Ciclano de Tal') THEN
		Writeln('Ciclano de Tal foi removido')
	ELSE
		Writeln('Nao removeu Ciclano de Tal');

	K := Consulta(Raiz,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	Imprime(Raiz,'');

END. { Trie }
