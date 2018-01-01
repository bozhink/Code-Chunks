{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte ArvoreB.Pas     }
PROGRAM ArvoreB;

	USES Crt;

CONST
	T    = 2;
	Keys = 2 * T - 1;
	Sons = 2 * T;

	WLen = 15;

TYPE
	Key = STRING[WLen];

	Elo = ^No;

	No  = RECORD
		N      : INTEGER;
		Folha  : BOOLEAN;
		C      : ARRAY[1..Sons] OF Elo;
		Chave  : ARRAY[1..Keys] OF Key;
		Tag    : ARRAY[1..Keys] OF INTEGER;
		Status : ARRAY[1..Keys] OF BOOLEAN;
		END;

VAR
	Raiz      : Elo;
	K         : INTEGER;
	Deletados : INTEGER;
	Ativos    : INTEGER;

	{ Algoritmo 10.29 }
	PROCEDURE Init_C(X : Elo);
	VAR
		I : INTEGER;
	BEGIN
		FOR I := 1 TO Sons DO
			X^.C[I] := NIL;

		FOR I := 1 TO Keys DO
			X^.Status[I] := FALSE;

	END; { Init_C }

	{ Algoritmo 10.30 }
	PROCEDURE Inicializa(VAR R : Elo);
	BEGIN
		New(R);
		IF R = NIL THEN BEGIN
			Writeln('*** Inicializa: Memoria insuficiente');
			Halt;
			END;

		Init_C(R);

		R^.N     := 0;
		R^.Folha := TRUE;

	END; { Inicializa }

	{ Algoritmo 10.31 }
	PROCEDURE Divide_Filho(VAR X : Elo; I : INTEGER; VAR FI : Elo);
	VAR
		FI2 : Elo;
		J   : INTEGER;
	BEGIN
		New(FI2);
		IF FI2 = NIL THEN BEGIN
			Write('*** Divide_Filho: Memoria');
			Writeln(' insuficiente');
			Halt;
			END;

		Init_C(FI2);

		FI2^.Folha  := FI^.Folha;
		FI2^.N      := T - 1;

		FOR J := 1 TO T - 1 DO BEGIN
			FI2^.Chave[J]   := FI^.Chave[J+T];
			FI2^.Tag[J]     := FI^.Tag[J+T];
			FI2^.Status[J]  := FI^.Status[J+T];
			FI^.Chave[J+T]  := '';
			FI^.Status[J+T] := FALSE;
			END;

		IF NOT FI^.Folha THEN
			FOR J := 1 TO T DO
				FI2^.C[J] := FI^.C[J+T];

		FI^.N := T - 1;

		FOR J := X^.N + 1 DOWNTO I + 1 DO
			X^.C[J+1] := X^.C[J];

		X^.C[I+1] := FI2;

		FOR J := X^.N DOWNTO I DO BEGIN
			X^.Chave[J+1]  := X^.Chave[J];
			X^.Tag[J+1]    := X^.Tag[J];
			X^.Status[J+1] := X^.Status[J];
			X^.Status[J]   := FALSE;
			END;

		X^.Chave[I]   := FI^.Chave[T];
		X^.Tag[I]     := FI^.Tag[T];
		X^.Status[I]  := TRUE;
		FI^.Status[T] := FALSE;
		X^.N          := X^.N + 1;

	END; { Divide_Filho }

	{ Algoritmo 10.32 }
	PROCEDURE Insere_Nao_Cheio(VAR X : Elo; K : STRING; Tag : INTEGER);
	VAR
		I    : INTEGER;
		Para : BOOLEAN;
	BEGIN
		I := X^.N;

		IF X^.Folha THEN BEGIN
			Para := FALSE;
			WHILE (I > 0) AND NOT Para DO
				IF K < X^.Chave[I] THEN BEGIN
					X^.Chave[I+1]  := X^.Chave[I];
					X^.Tag[I+1]    := X^.Tag[I];
					X^.Status[I+1] := X^.Status[I];
					I              := I - 1;
					END
				ELSE
					Para := TRUE;

			X^.Chave[I+1]  := K;
			X^.Tag[I+1]    := Tag;
			X^.Status[I+1] := TRUE;
			X^.N           := X^.N + 1;
			END
		ELSE BEGIN
			Para := FALSE;
			WHILE (I > 0) AND NOT Para DO
				IF K < X^.Chave[I] THEN
					I    := I - 1
				ELSE
					Para := TRUE;
			I := I + 1;

			IF X^.C[I]^.N = Keys THEN BEGIN
				Divide_Filho(X,I,X^.C[I]);
				IF K > X^.Chave[I] THEN
					I := I + 1;
				END;

			Insere_Nao_Cheio(X^.C[I],K,Tag);
			END;

	END; { Insere_Nao_Cheio }

	{ Algoritmo 10.33 }
	PROCEDURE Insere(VAR Ra : Elo; K : STRING; Tag : INTEGER);
	VAR
		R, S : Elo;
		I    : INTEGER;

		FUNCTION Consulta_Insere(R     : Elo;
					 K     : STRING;
					 VAR X : Elo) : INTEGER;
		VAR
			Para : BOOLEAN;
			J    : INTEGER;
		BEGIN
			Consulta_Insere := 0;
			X               := NIL;
			J               := 1;
			Para            := FALSE;

			WHILE (J <= R^.N) AND NOT Para DO
				IF K > R^.Chave[J] THEN
					J    := J + 1
				ELSE
					Para := TRUE;

			Para := FALSE;

			IF J <= R^.N THEN BEGIN
				IF K = R^.Chave[J] THEN BEGIN
						Consulta_Insere := J;
						X               := R;
						END
				ELSE
					IF NOT R^.Folha THEN
						Consulta_Insere :=
						Consulta_Insere(R^.C[J],K,X);
				END
			ELSE
				IF NOT R^.Folha THEN
					Consulta_Insere :=
					Consulta_Insere(R^.C[J],K,X);
		END; { Consulta_Insere }
	BEGIN
		{ Primeiro verifica se K já está na árvore B }
		I := Consulta_Insere(Ra,K,R);
		IF R <> NIL THEN BEGIN
			IF R^.Status[I] THEN BEGIN
				Writeln('*** A chave ', K, ' ja  existe');
				Halt;
				END;

			{ Se K estava inativo reutilize o seu local }
			R^.Status[I] := TRUE;
			R^.Tag[I]    := Tag;
			END
		ELSE BEGIN

			R := Ra;

			IF R^.N = Keys THEN BEGIN
				New(S);
				IF S = NIL THEN BEGIN
					Write('*** Insere: Memoria');
					Write(' insuficiente para');
					writeln(' insercao de ', K);
					Halt;
					END;

				Init_C(S);

				Ra       := S;
				S^.Folha := FALSE;
				S^.N     := 0;
				S^.C[1]  := R;
				Divide_Filho(S,1,R);
				Insere_Nao_Cheio(S,K,Tag);
				END
			ELSE
				Insere_Nao_Cheio(R,K,Tag);
			END;

	END; { Insere }

	{ Algoritmo 10.34 }
	FUNCTION Consulta(R : Elo; K : STRING) : INTEGER;
	VAR
		I    : INTEGER;
		Para : BOOLEAN;
	BEGIN
		Consulta := 0;
		I        := 1;
		Para     := FALSE;

		WHILE (I <= R^.N) AND NOT Para DO
			IF K > R^.Chave[I] THEN
				I    := I + 1
			ELSE
				Para := TRUE;

		IF I <= R^.N THEN BEGIN
			IF K = R^.Chave[I] THEN BEGIN
				IF R^.Status[I] THEN
					Consulta := R^.Tag[I];
				END
			ELSE
				IF NOT R^.Folha THEN
					Consulta := Consulta(R^.C[I],K);
			END
		ELSE
			IF NOT R^.Folha THEN
				Consulta := Consulta(R^.C[I],K);
	END; { Consulta }

	{ Algoritmo 10.35 }
	FUNCTION Remove(R : Elo; K : STRING) : BOOLEAN;
	VAR
		I    : INTEGER;
		Para : BOOLEAN;
	BEGIN

		I      := 1;
		Para   := FALSE;
		Remove := FALSE;

		WHILE (I <= R^.N) AND NOT Para DO
			IF K > R^.Chave[I] THEN
				I    := I + 1
			ELSE
				Para := TRUE;

		Para := FALSE;

		IF I <= R^.N THEN BEGIN
			IF K = R^.Chave[I] THEN BEGIN
				R^.Status[I] := FALSE;
				Remove       := TRUE;
				END
			ELSE
				IF NOT R^.Folha THEN
					Remove := Remove(R^.C[I],K);
			END
		ELSE
			IF NOT R^.Folha THEN
				Remove := Remove(R^.C[I],K);
	END; { Remove }

	{ Sub-algoritmo 10.36.1 }
	PROCEDURE Squash_2(Ra : Elo; VAR Nova : Elo);
	VAR
		I : INTEGER;
	BEGIN
		IF Ra <> NIL THEN BEGIN
			FOR I := 1 TO Ra^.N DO BEGIN
				Squash_2(Ra^.C[I],Nova);
				IF Ra^.Status[I] THEN
					Insere(Nova,Ra^.Chave[I],Ra^.Tag[I]);
				END;
			squash_2(Ra^.C[Ra^.N+1],Nova);
			IF Ra^.Folha THEN
				Dispose(Ra);
			END;

	END; { Squash_2 }

	{ Algoritmo 10.36 }
	PROCEDURE Squash(VAR Ra : Elo);
	VAR
		R : Elo;
	BEGIN
		Inicializa(R);

		Squash_2(Ra,R);

		Ra := R;

	END; { Squash_2 }

	{ Algoritmo 10.37 }
	PROCEDURE Conta(R : Elo; VAR Deletados, Ativos : INTEGER);
	VAR
		I : INTEGER;
	BEGIN
		IF R <> NIL THEN BEGIN
			FOR I := 1 TO R^.N DO BEGIN
				Conta(R^.C[I],Deletados,Ativos);
				IF R^.Status[I] THEN
					Ativos    := Ativos + 1
				ELSE
					Deletados := Deletados + 1;
				END;
			Conta(R^.C[R^.N+1],Deletados,Ativos);
			END;

	END; { Conta }

	{ Algoritmo 10.38 }
	PROCEDURE Imprime(Ra : Elo);
	VAR
		I : INTEGER;
	BEGIN
		IF Ra <> NIL THEN BEGIN
			FOR I := 1 TO Ra^.N DO BEGIN
				Imprime(Ra^.C[I]);
				IF Ra^.Status[I] THEN
					Writeln(Ra^.Tag[I] : 4, ' ', Ra^.Chave[I]);
				END;
			Imprime(Ra^.C[Ra^.N+1]);
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

	Imprime(Raiz);

	K := Consulta(Raiz,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	IF Remove(Raiz,'Ciclano de Tal') THEN
		Writeln('Ciclano de Tal foi removido')
	ELSE
		Writeln('Nao removeu Ciclano de Tal');

	Deletados := 0;
	Ativos    := 0;
	Conta(Raiz,Deletados,Ativos);
	Writeln('Nodos deletados: ', Deletados, ' Nodos ativos: ', Ativos);
	Squash(Raiz);
	Deletados := 0;
	Ativos    := 0;
	Conta(Raiz,Deletados,Ativos);
	Writeln('Nodos deletados: ', Deletados, ' Nodos ativos: ', Ativos);

	K := Consulta(Raiz,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	Imprime(Raiz);

END. { ArvoreB }
