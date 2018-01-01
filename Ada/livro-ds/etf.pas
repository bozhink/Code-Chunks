{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte ETF.Pas         }
PROGRAM ETF;
	USES Crt;
TYPE
	Token = CHAR;
VAR
	Source  : STRING[200]; { Armazena uma expressão }
	ISource : INTEGER;     { Índice do próximo caractere }
	Ultima  : Token;       { Caractere look ahead }
	LAhead  : BOOLEAN;     { Sinaliza look ahead ativo }

	PROCEDURE Inicializa(S : STRING);
	BEGIN
		Source  := S;
		Isource := 1;
		LAhead  := FALSE;

	END; { Inicializa }

	{ Obtém um símbolo de Source }
	FUNCTION Scanner : Token;
	VAR
		Tk : Token;
	BEGIN
		IF LAhead THEN BEGIN { Retorna a token recebida
					  por Back }
			Tk      := Ultima;
			LAhead  := FALSE;
			END
		ELSE BEGIN
			Tk      := Source[ISource];
			ISource := ISource + 1;
			{ Ignora brancos }
			WHILE (Tk = ' ') DO BEGIN
				Tk      := Source[ISource];
				ISource := ISource + 1;
				END;
			END;

		Scanner := Tk;

	END; { Scanner }

	{ Salva Tk no buffer de look ahead }
	PROCEDURE Back(Tk : Token);
	BEGIN
		LAhead := TRUE;
		Ultima := Tk;
	END; { Back }

	FUNCTION E : INTEGER; FORWARD;

	{ Obtém um fator }
	FUNCTION F : INTEGER;
	VAR
		Tk : Token;
		R  : INTEGER;
	BEGIN
		Tk := Scanner;
		IF Tk = '(' THEN BEGIN { Processa ( E ) }
			R:= E;
			Tk := Scanner;
			IF Tk <> ')' THEN BEGIN
				WriteLn('Expressao invalida ==> ', Tk);
				Halt;
				END;
			END
		ELSE IF NOT (Tk IN ['0' .. '9']) THEN BEGIN
			WriteLn('Expressao invalida ==> ', Tk);
			Halt;
			END
		ELSE	{ Converte um dígito para seu
			  valor decimal }
			R := Ord(Tk) - Ord('0');
		F := R;
	END; { F }

	{ Obtém um termo }
	FUNCTION T : INTEGER;
	VAR
		Tk  : Token;
		Op1 : INTEGER;
		Op2 : INTEGER;
	BEGIN
		Op1 := F;
		Tk := Scanner;
		WHILE (Tk = '*') OR (Tk = '/') DO BEGIN
			Op2 := F;
			{ Avalia a sub-expressão }
			IF Tk = '*' THEN
				Op1 := Op1 * Op2
			ELSE  { Testar divisão por zero }
				Op1 := Op1 DIV Op2;
			Tk := Scanner;
			END;
		Back(Tk);
		T := Op1;
	END; { T }

	{ Obtém uma expressão }
	FUNCTION E : INTEGER;
	VAR
		Tk  : Token;
		Op1 : INTEGER;
		Op2 : INTEGER;
	BEGIN
		Op1 := T;
		Tk := Scanner;
		WHILE (Tk = '+') OR (Tk = '-') DO BEGIN
			Op2 := T;
			{ Avalia a sub-expressão }
			IF Tk = '+' THEN
				Op1 := Op1 + Op2
			ELSE
				Op1 := Op1 - Op2;
			Tk := Scanner;
			END;
		Back(Tk);
		E := Op1;
	END; { E }

BEGIN
	Inicializa('3+4*(5-1)');
	WriteLn('O resultado de 3+4*(5-1) e'': ', E);
END. { Testa_ETF }
