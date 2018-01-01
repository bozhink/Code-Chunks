{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Arv_Exp.Pas     }
PROGRAM Arv_Exp;
	USES Crt;
TYPE
	Key = CHAR;

	Elo = ^No;

	No = RECORD
		Esq    : Elo;
		Op_Val : Key;
		Dir    : Elo;
		Pai    : Elo;
		P      : INTEGER;
		END;
VAR
	Raiz     : Elo;

	FUNCTION Calcula(R : Elo) : INTEGER; { Algoritmo 7.3 Modificado }
	VAR
		A, B : INTEGER;
	BEGIN
		IF R <> NIL THEN
			IF (R^.Esq = NIL) AND (R^.Dir = NIL) THEN
				Calcula := Ord(R^.Op_Val) - Ord('0')
			ELSE BEGIN
				A := Calcula(R^.Esq);
				B := Calcula(R^.Dir);
				IF R^.Op_Val = '+' THEN
					Calcula := A + B
				ELSE IF R^.Op_Val = '-' THEN
					Calcula := A - B
				ELSE IF R^.Op_Val = '*' THEN
					Calcula := A * B
				ELSE IF R^.Op_Val = '/' THEN
					Calcula := A DIV B
				ELSE 
					Calcula := 0;
				END
		ELSE
			Calcula := 0;
	END; { Calcula }

	PROCEDURE Gera_Expressao(Exp : STRING; VAR Raiz : Elo);
	VAR
		I        : INTEGER;
		Fator    : INTEGER;
		Temp     : Elo;
		Corrente : Elo;

		FUNCTION Is_Terminal(Ch : Key) : BOOLEAN;
		BEGIN
			IF ((Ch >= 'A') AND (Ch <= 'Z')) OR
			   ((Ch >= 'a') AND (Ch <= 'z')) OR
			   ((Ch >= '0') AND (Ch <= '9')) THEN
				Is_Terminal := TRUE
			   ELSE
				Is_Terminal := FALSE;
		END; { Is_Terminal }

		FUNCTION Prioridade(Op : Key) : INTEGER;
		BEGIN
			IF (Op = '+') OR (Op = '-') THEN
				Prioridade := 2 * Fator
			ELSE IF (Op = '*') OR (Op = '/') THEN
				Prioridade := 3 * Fator
			ELSE
				Prioridade := 1 * Fator;
		END; { Prioridade }

		FUNCTION Novo_No(K : Key) : Elo;
		VAR
			P : Elo;
		BEGIN
			New(P);
			IF P = NIL THEN BEGIN
				Write('*** Novo_No: Memoria insufi');
				Writeln('ciente para insercao de ', K);
				Halt;
				END;

			IF Raiz = NIL THEN BEGIN
				Raiz     := P;
				Corrente := P;
				END;

			P^.Op_Val := K;
			P^.Esq    := NIL;
			P^.Dir    := NIL;
			P^.Pai    := NIL;
			P^.P      := Prioridade(K);
			Novo_No   := P;
		END; { Novo_No }

		PROCEDURE TExp_Insere(Temp : Elo);
		VAR
			Stop : BOOLEAN;
		BEGIN
			IF Temp <> Raiz THEN
				IF Is_Terminal(Temp^.Op_Val) THEN
					Corrente^.Dir := Temp
				ELSE IF Is_Terminal(Corrente^.Op_Val) THEN BEGIN
					Temp^.Esq     := Corrente;
					Corrente^.Pai := Temp;
					Raiz          := Temp;
					Corrente      := Temp;
					END
				{ É um operador }
				ELSE BEGIN
					IF Temp^.P > Corrente^.P THEN BEGIN
						Temp^.Esq     := Corrente^.Dir;
						Corrente^.Dir := Temp;
						Temp^.Pai     := Corrente;
						Corrente      := Temp;
						END
					ELSE BEGIN
						{ Encontre o nível adequado }
						Stop := FALSE;
						WHILE NOT Stop DO
							IF Corrente^.Pai = NIL THEN
								Stop := TRUE
							ELSE IF Temp^.P < Corrente^.P THEN
								IF Temp^.P > Corrente^.Pai^.P THEN
									Stop := TRUE
								ELSE
									Corrente := Corrente^.Pai
							ELSE
								Stop := TRUE;
						Temp^.Esq := Corrente;
						IF Corrente = Raiz THEN
							Raiz := Temp
						ELSE BEGIN
							IF Corrente^.Pai^.Esq = Corrente THEN
								Corrente^.Pai^.Esq:= Temp
							ELSE
								Corrente^.Pai^.Dir:= Temp;
							Temp^.Pai     := Corrente^.Pai;
							Corrente^.Pai := Temp;
							END;
						Corrente := Temp;
						END;
					END;
		END; { TExp_Insere }
	BEGIN
		Raiz  := NIL; { Inicializa árvore }
		Fator := 1;
		FOR I := 1 TO Length(Exp) DO
			IF Exp[I] = '(' THEN
				Fator := Fator * 4
			ELSE IF Exp[I] = ')' THEN
				Fator := Fator DIV 4
			ELSE BEGIN
				Temp := Novo_No(Exp[I]);
				TExp_Insere(Temp);
				END;

	END; { Gera_Expressao }

BEGIN
	Gera_Expressao('(4+5+6)*7+8*(1+2+3)', Raiz);

	Writeln('O valor de (4+5+6)*7+8*(1+2+3) e'': ', Calcula(Raiz));

END. { Arvore_De_Expressao }
