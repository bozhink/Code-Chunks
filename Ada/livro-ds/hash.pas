{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Hash.Ads        }

PROGRAM Hash;

	USES Crt;

CONST

	Tamanho_Chave  = 14;
	Tamanho_Tabela = 81;
	Valor_Hash     = 19;

TYPE
	Key = STRING[Tamanho_Chave];

	Rec_Tabela = RECORD
		Id   : Key;
		Tag  : INTEGER;
		Next : INTEGER;
		END;

	Array_Bucket = ARRAY[0 .. (Valor_Hash - 1)] OF INTEGER;
	Array_Tab    = ARRAY[1..Tamanho_Tabela] OF Rec_Tabela;
	Tabela       = RECORD
		N      : INTEGER;
		Livre  : INTEGER;
		Bucket : Array_Bucket;
		Tab    : Array_Tab;
		END;

VAR
	Ta : Tabela;
	K  : INTEGER;
	Re : BOOLEAN;

	{  Algoritmo 10.44 }
	PROCEDURE Inicializa(VAR T : Tabela);
	VAR
		I : INTEGER;
	BEGIN
		T.N := 0;

		FOR I := 1 TO (Valor_Hash - 1) DO
			T.Bucket[I] := -1;

		FOR I := 1 TO Tamanho_Tabela - 1 DO
			T.Tab[I].Next := I + 1;

		T.Tab[Tamanho_Tabela].Next := 0;

		T.Livre := 1;

	END; { Inicializa }

	{  Algoritmo 10.45 }
	FUNCTION Hash(K : STRING) : INTEGER;
	VAR
		I, V : INTEGER;
	BEGIN
		V := 0;

		FOR I := 1 TO Length(K) DO
			V := V + (Ord(K[I]) * I);

		Hash := V MOD Valor_Hash;

	END; { Hash }

	{  Algoritmo 10.46 }
	PROCEDURE Insere_Tab(VAR T  : Tabela;
			     K      : STRING;
			     Tag    : INTEGER;
			     Colide : INTEGER;
			     VAR B  : INTEGER);
	VAR
		Pos : INTEGER;
	BEGIN
		IF T.N >= Tamanho_Tabela THEN BEGIN
			Writeln('*** Overflow na Tabela');
			Halt;
			END;
		T.N             := T.N + 1;
		Pos             := T.Livre;
		T.Livre         := T.Tab[Pos].Next;

		T.Tab[Pos].Id   := K;
		T.Tab[Pos].Tag  := Tag;
		T.Tab[Pos].Next := Colide;
		B               := Pos;

	END; { Insere_Tab }

	{  Algoritmo 10.47 }
	FUNCTION Consulta(T : Tabela; K : STRING) : INTEGER;
	VAR
		P : INTEGER;
	BEGIN
		P        := T.Bucket[Hash(K)];

		Consulta := 0;

		WHILE P >= 1 DO
			IF T.Tab[P].Id = K THEN BEGIN
				Consulta := T.Tab[P].Tag;
				P        := 0;
				END
			ELSE
				P := T.Tab[P].Next;

	END; { Consulta }

	{  Algoritmo 10.48 }
	PROCEDURE Remove(VAR T : Tabela; K : STRING;
			 VAR R : BOOLEAN);
	VAR
		P, L : INTEGER;
	BEGIN
		R := FALSE;

		P := T.Bucket[Hash(K)];

		IF T.Tab[P].Id = K THEN BEGIN
			T.Bucket[Hash(K)] := T.Tab[P].Next;
			T.Tab[P].Next     := T.Livre;
			T.Livre           := P;
			T.N               := T.N - 1;
			R                 := TRUE;
			END
		ELSE

			WHILE (P >= 1) AND NOT R  DO

				IF T.Tab[P].Id = K THEN BEGIN
					T.Tab[L].Next := T.Tab[P].Next;
					T.Tab[P].Next := T.Livre;
					T.Livre       := P;
					R             := TRUE;
					T.N           := T.N - 1;
					END
				ELSE BEGIN
					L := P;
					P := T.Tab[P].Next;
					END;


	END; { Remove }

	{  Algoritmo 10.49 }
	PROCEDURE Insere(VAR T : Tabela; K : STRING;
			 Tag   : INTEGER);
	VAR
		P, Onde : INTEGER;
	BEGIN
		Onde := Hash(K);

		IF T.Bucket[Onde] < 1 THEN
			Insere_Tab(T,K,Tag,-1,T.Bucket[Onde])

		ELSE BEGIN
			P := T.Bucket[Onde];
			WHILE P > 0 DO
				IF T.Tab[P].Next < 1 THEN BEGIN
					Insere_Tab(T
						  ,K
						  ,Tag
						  ,T.Bucket[Onde]
						  ,T.Bucket[Onde]);
					P := 0;
					END
				ELSE
					P := T.Tab[P].Next;
			END;

	END; { Insere }

	{  Algoritmo 10.50 }
	FUNCTION Quantidade(T : Tabela) : INTEGER;
	BEGIN
		Quantidade := T.N;

	END; { Quantidade }

	{  Algoritmo 10.51 }
	PROCEDURE Imprime(T : Tabela);
	VAR
		I, J : INTEGER;
	BEGIN
		Writeln('Tabela com ', T.N, ' elementos:');

		FOR I := 0 TO (Valor_Hash - 1) DO BEGIN
			J := T.Bucket[I];
			WHILE J > 0 DO BEGIN
				Write(J :3, ' ');
				Write(T.Tab[J].Id, ' ');
				Write(T.Tab[J].Tag : 4, ' ');
				Writeln(T.Tab[J].Next);
				J := T.Tab[J].Next;
				END;
			END;

	END; { Imprime }

BEGIN
	Inicializa(Ta);

	Insere(Ta,'Fulano de Tal ',1010);
	Insere(Ta,'Fulana de Tal ',1020);
	Insere(Ta,'Ciclano de Tal',1030);
	Insere(Ta,'Beltrano      ',1040);
	Insere(Ta,'Pertrano      ',1050);
	Insere(Ta,'Rulanx de Tal ',1060);
	Insere(Ta,'Bulany de Tal ',1070);
	Insere(Ta,'Ticlanx de Tal',1080);
	Insere(Ta,'Keltranx      ',1090);
	Insere(Ta,'Aertranx      ',1100);

	Imprime(Ta);

	K := Consulta(Ta,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	Remove(Ta,'Ciclano de Tal',Re);
	IF Re THEN
		Writeln('Ciclano de Tal foi removido')
	ELSE
		Writeln('Nao removeu Ciclano de Tal');

	K := Consulta(Ta,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ',K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	Imprime(Ta);

END. { Hash }
