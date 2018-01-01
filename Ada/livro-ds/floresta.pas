{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Floresta.Pas    }
PROGRAM Floresta;

	USES Crt;

CONST

	Floresta = 256;

	WLen	 = 30;

	WFn      = 128;

TYPE

	TKSize = RECORD
		LLink  : INTEGER;
		RLink  : INTEGER;
		Tag    : INTEGER;
		Status : CHAR;    { 'I' em uso; 'D' = deletado }
		Key    : STRING[WLen];
		END;

	FlorestaSize = RECORD
		Tfp       : FILE OF TKSize;
		Raiz      : ARRAY[1..Floresta] OF LONGINT;
		Em_uso    : INTEGER;
		Deletados : INTEGER;
		Nodos     : INTEGER;
		Compacte  : BOOLEAN;
		Tfn       : STRING[WFn];
		END;

	Florest = RECORD
		F   : FlorestaSize;
		Thp : FILE OF FlorestaSize;
		Thn : STRING[WFn];
		END;
VAR

	Header : Florest;
	K      : INTEGER;

	PROCEDURE Faz_Header(Fn : STRING; VAR H : Florest);
	VAR
		I : INTEGER;
	BEGIN
		H.Thn := Fn;
		I     := 1;

		WHILE Fn[I] <> '.' DO
			I := I + 1;

		H.Thn[I+1] := 'H';
		H.Thn[I+2] := 'D';
		H.Thn[I+3] := 'R';

	END; { Faz_Header }

	{ Algoritmo 10.15 }
	PROCEDURE Inicializa(Fn : STRING;VAR H : Florest);
	VAR
		I  : INTEGER;
	BEGIN

		{ Cria árvore }
		Faz_Header(Fn,H);
		Assign(H.Thp,H.Thn);
		ReWrite(H.Thp);

		H.F.Em_uso    := 0;
		H.F.Deletados := 0;
		H.F.Compacte  := FALSE;

		H.F.Tfn       := Fn;

		FOR I := 1 TO Floresta DO
			H.F.Raiz[I] := -2;

		Write(H.Thp,H.F);

		Close(H.Thp);

		Reset(H.Thp);

		Assign(H.F.Tfp,Fn);
		ReWrite(H.F.Tfp);

	END; { Inicializa }

	{ Algoritmo 10.16 }
	PROCEDURE Abre(Fn : STRING; VAR H : Florest);
	VAR
		Sit : REAL;
	BEGIN
		Faz_Header(Fn,H);
		Assign(H.Thp,H.Thn);
		Reset(H.Thp);

		Seek(H.Thp,1);
		Read(H.Thp,H.F);

		Assign(H.F.Tfp,Fn);
		Reset(H.F.Tfp);

		IF (H.F.Em_uso <> 0) THEN
			Sit := H.F.Deletados * 100.0 / H.F.Em_uso;

		IF (Sit > 30.0) OR (H.F.Deletados > H.F.Em_uso) THEN
			H.F.Compacte := TRUE
		ELSE
			H.F.Compacte := FALSE;

	END; { Abre }

	{ Algoritmo 10.17 }
	PROCEDURE Fecha(VAR H : Florest);
	BEGIN
		Seek(H.Thp,1);

		Close(H.F.Tfp);

		Write(H.Thp,H.F);

		Close(H.Thp);

	END; { Fecha }

	{ Algoritmo 10.18 }
	FUNCTION Hash(S : STRING) : INTEGER;
	VAR
		I   : INTEGER;
		VAL : INTEGER;
	BEGIN
		Val := 0;

		{ utilize este comando para tornar a floresta ordenada }
		{ Hash := S[1]; }

		FOR I := 1 TO Length(S) DO
			Val := Val + (Ord(S[I]) * I);

		Hash := Abs(Val MOD Floresta) + 1;

	END; { Hash }

	{ Algoritmo 10.20 }
	PROCEDURE Le(VAR H    : Florest;
		     VAR Nodo : TKSize;
		     W        : INTEGER);
	BEGIN
		Seek(H.F.Tfp,W);

		Read(H.F.Tfp,Nodo);

	END; { Le }

	{ Algoritmo 10.21 }
	PROCEDURE Grava(VAR H : Florest; Nodo : TKSize; W : INTEGER);
	BEGIN
		Seek(H.F.Tfp,W);

		Write(H.F.Tfp,Nodo);

	END; { Grava }

	{ Algoritmo 10.22 }
	FUNCTION Prepara(VAR H : Florest;
			 K     : STRING;
			 Tag   : INTEGER) : INTEGER;
	VAR
		Nodo : TKSize;
		X    : INTEGER;
	BEGIN

		X := H.F.Em_uso + 1;

		Seek(H.F.Tfp,X);

		Nodo.LLink  := -2;
		Nodo.RLink  := -2;
		Nodo.Tag    := Tag;
		Nodo.Status := 'I';

		H.F.Em_uso  := H.F.Em_uso + 1;
		Nodo.Key    := K;

		Write(H.F.Tfp,Nodo);

		Prepara := X;

	END; { Prepara }

	{ Algoritmo 10.23 }
	PROCEDURE Insere(VAR H : Florest; K : STRING; Tag : INTEGER);
	VAR
		Nodo : TKSize;
		I, W : INTEGER;
	BEGIN

		I := Hash(K);

		W := H.F.Raiz[I];

		IF W < 0 THEN BEGIN

			H.F.Raiz[I] := Prepara(H,K,Tag);

			Seek(H.Thp,1);

			Write(H.Thp,H.F);

			END
		ELSE BEGIN

			WHILE W >= 0 DO BEGIN

				Le(H,Nodo,W);

				IF K < Nodo.Key THEN
					IF Nodo.LLink < 0 THEN BEGIN
						Nodo.LLink := Prepara(H,K,Tag);
						Grava(H,Nodo,W);
						W := -1;
						END
					ELSE
						W := Nodo.LLink
				ELSE IF K = Nodo.Key THEN
					IF Nodo.Status <> 'D' THEN
						W := -1
					ELSE BEGIN
						H.F.Deletados := H.F.Deletados - 1;
						Nodo.Status   := 'I';
						Nodo.Tag      := Tag;
						Grava(H,Nodo,W);
						END
				ELSE
					IF Nodo.RLink < 0 THEN BEGIN
						Nodo.RLink := Prepara(H,K,Tag);
						Grava(H,Nodo,W);
						END
					ELSE
						W := Nodo.RLink;
				END;
			END;
	END; { Insere }

	{ Algoritmo 10.24 }
	FUNCTION Consulta(H : Florest; K : STRING) : INTEGER;
	VAR
		Nodo : TKSize;
		X    : INTEGER;
	BEGIN
		Consulta := 0;

		X := H.F.Raiz[Hash(K)];

		WHILE  X >= 1 DO BEGIN

			Le(H,Nodo,X);

			IF K < Nodo.Key THEN
				X := Nodo.LLink
			ELSE IF K = Nodo.Key THEN
				IF Nodo.Status <> 'D' THEN BEGIN
					Consulta := Nodo.Tag;
					X        := 0;
					END
				ELSE
					X := 0
			ELSE
				X := Nodo.RLink;
			END;
	END; { Consulta }

	{ Algoritmo 10.25 }
	FUNCTION Remove(VAR H : Florest; K : STRING) : BOOLEAN;
	VAR
		Nodo : TKSize;
		X    : INTEGER;
	BEGIN
		Remove := FALSE;

		X      := H.F.Raiz[Hash(K)];

		WHILE X >= 1 DO BEGIN

			Le(H,Nodo,X);

			IF K < Nodo.Key THEN
				X := Nodo.LLink
			ELSE IF K = Nodo.Key THEN
				IF Nodo.Status = 'D' THEN
					X             := 0
				ELSE BEGIN
					Nodo.Status   := 'D';
					H.F.Deletados := H.F.Deletados + 1;
					Grava(H,Nodo,X);
					Remove        := TRUE;
					X             := 0;
					END
			ELSE
				X := Nodo.RLink;
			END;
	END; { Remove }

	{ Algoritmo 10.26 }
	FUNCTION Tempo_De_Compactar(H : Florest) : BOOLEAN;
	BEGIN
		Tempo_De_Compactar := H.F.Compacte;

	END; { Tempo_De_Compactar }


	{ Algoritmo 10.27 }
	PROCEDURE Squash(Fn : STRING);
	VAR
		Tn1, Tn2 : STRING[WFn];
		Nodo     : TKSize;
		H, Temp  : Florest;
		K        : INTEGER;

	BEGIN
		Abre(Fn,H);

		Inicializa('TREEBAK.BAK',Temp);

		K := 1;
		WHILE NOT Eof(H.F.Tfp) DO BEGIN
			Le(H,Nodo,K);
			IF Nodo.Status <> 'D' THEN
				Insere(Temp,Nodo.Key,Nodo.Tag);
			K := K + 1;
		END;

		Tn1        := H.F.Tfn;
		Temp.F.Tfn := Tn1;
		Tn2        := H.Thn;

		Fecha(Temp);

		Fecha(H);

		{ Remove árvore antiga }
		Erase(H.F.Tfp);
		Erase(H.Thp);

		Rename(Temp.F.Tfp,Tn1);
		Rename(Temp.Thp,Tn2);


	END; { Squash }

	{ Algoritmo 7.2 }
	PROCEDURE Central(H : Florest; K: INTEGER);
	VAR
		Nodo : TKSize;
		I    : INTEGER;
	BEGIN

		IF K > 0 THEN BEGIN
			Le(H,Nodo,K);

			Central(H,Nodo.LLink);

			IF Nodo.Status <> 'D' THEN BEGIN
				Write(Nodo.Key);
				FOR I := Length(Nodo.Key) + 1 TO 41 DO
					Write(' ');
				Writeln(Nodo.Tag);
				END;

			Central(H,Nodo.RLink);
			END;

	END; { Central }

	{ Algoritmo 10.28 }
	PROCEDURE Imprime(H : Florest);
	VAR
		I : INTEGER;
	BEGIN
		FOR I := 1 TO Floresta DO
			Central(H,H.F.Raiz[I]);

	END; { Imprime }
BEGIN
	Inicializa('ADISCO.DAT',Header);

	Insere(Header,'Fulano de Tal',1010);
	Insere(Header,'Fulana de Tal',1020);
	Insere(Header,'Ciclano de Tal',1030);
	Insere(Header,'Beltrano',1040);
	Insere(Header,'Pertrano',1050);

	Imprime(Header);

	Fecha(Header);

	Abre('ADISCO.DAT',Header);

	K := Consulta(Header,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	IF Remove(Header,'Ciclano de Tal') THEN
		Writeln('Ciclano de Tal foi removido')
	ELSE
		Writeln('Nao removeu Ciclano de Tal');

	K := Consulta(Header,'Ciclano de Tal');
	IF K > 0 THEN
		Writeln('Ciclano de Tal tem tag ', K)
	ELSE
		Writeln('Nao encontrou Ciclano de Tal');

	Fecha(Header);

	Squash('ADISCO.DAT');

	Abre('ADISCO.DAT',Header);

	Imprime(Header);

	Fecha(Header);

END. { Floresta }
