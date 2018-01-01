{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte APosfix.Pas }
PROGRAM APosFix;
	USES Crt;

	CONST Max = 10; { Define o número máximo de
		  	     elementos da pilha }

	TYPE
		{ Define o tipo dos valores da pilha }
		Tipo = INTEGER;

		{ Define o tipo Pilha }
		Pilha = RECORD
			V  : ARRAY[1 .. Max] OF Tipo;
			Sp : INTEGER;
			END;

	VAR
		Exp            : STRING[100];    { Expressão posfix }
		Resultado      : Tipo;		{ Resultado da avaliação }

	{ Implementação do algoritmo 3.1 }
	PROCEDURE Inicializa(VAR P : Pilha);
	BEGIN
		P.Sp := 0;
	END; { Inicializa }

	{ Implementação do algoritmo 3.2 }
	PROCEDURE Push(VAR P : Pilha; D : Tipo);
	BEGIN
		IF P.Sp = Max THEN BEGIN { Verifica overflow de pilha }
			Writeln('*** Overflow na pilha ***');
			Halt;
			END
		ELSE BEGIN
			P.Sp := P.Sp + 1;
			P.V[P.Sp] := D;
			END;
	END; { Push }

	{ Implementação do algoritmo 3.3 }
	PROCEDURE Pop(VAR P : Pilha; VAR R : Tipo);
	BEGIN
		IF P.Sp = 0 THEN BEGIN { Verifica underflow de pilha }
			Writeln('*** Underflow na pilha ***');
			Halt;
			END
		ELSE BEGIN
			R := P.V[P.Sp];
			P.Sp := P.Sp - 1;
			END;
	END; { Pop }

	{ Implementação do algoritmo 3.4 }
	PROCEDURE Avalia_Posfix(E : STRING; VAR R : Tipo);
	VAR
		I              : INTEGER;	{ Auxilia no loop }
		P              : Pilha;   	{ Declara uma pilha }
		Op1            : Tipo;
		Op2            : Tipo;
	BEGIN
		Inicializa(P);
		FOR I := 1 TO LENGTH(E) DO
			IF E[I] IN ['0'.. '9'] THEN
				Push(P,Ord(E[I]) - Ord('0'))
			ELSE BEGIN
				Pop(P,Op1);
				Pop(P,Op2);
				CASE E[I] OF
					'+' : Push(P,Op1 + Op2);
					'-' : Push(P,Op1 - Op2);
					'*' : Push(P,Op1 * Op2);
					'/' : Push(P,Op1 Div Op2);
					END; { CASE }
				END;
		Pop(P,R);
	END; { Avalia_Posfix }

BEGIN
	Exp := '45+6+7*812+3+*+';
	Avalia_Posfix(Exp,Resultado);
	Writeln('O resultado da avaliacao de '''
	       , Exp, ' e'': ', Resultado);
END. { Testa_Avalia_PosFix }
