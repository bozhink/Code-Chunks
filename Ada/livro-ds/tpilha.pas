{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte TPilha.pas      }
PROGRAM TPilha;	{ Demonstra o uso de uma pilha de
	           	  até 10 caracteres }
	USES Crt;

	CONST Max = 10; { Define o número máximo de
	                  elementos da pilha }

	TYPE	
		{ Define o tipo dos valores da pilha }
		Tipo = CHAR;

		{ Define o tipo Pilha }
		Pilha = RECORD
			V  : ARRAY[1 .. Max] OF Tipo;
			Sp : INTEGER;
			END;

	VAR
		Pilha_1, Pilha_2 : Pilha;   	{ Declara duas pilhas }
		Estava_No_Topo   : Tipo;		{ Armazena quem estava
		                             	  no topo de uma pilha }
		I                : INTEGER;	{ Auxilia nos loops }

	{ Implementação do algoritmo 3.1 }
	PROCEDURE Inicializa(VAR P : Pilha);
	BEGIN
		P.Sp := 0;
	END; { Inicializa }

	{ Implementação do algoritmo 3.2 }
	PROCEDURE Push(VAR P : Pilha; D : Tipo);
	BEGIN
		IF P.Sp = Max THEN  { Verifica overflow de pilha }
			Writeln('*** Overflow na pilha ***')
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
			R := '?';
			END
		ELSE BEGIN
			R := P.V[P.Sp];
			P.Sp := P.Sp - 1;
			END;
	END; { pop }

BEGIN
	Inicializa(Pilha_1);
	Inicializa(Pilha_2);

	Push(Pilha_1,'A');
	Push(Pilha_1,'B');
	Push(Pilha_1,'C');
	Push(Pilha_1,'D');

	Push(Pilha_2,'A');

	FOR I := 1 TO 4 DO BEGIN  { Exibe o conteúdo de Pilha_1 }
		Pop(Pilha_1, Estava_No_Topo);
		Writeln(5 - I, ' ', Estava_No_Topo);
		END;

	FOR I := 1 TO 4 DO BEGIN  { Exibe o conteúdo de Pilha_2 }
		Pop(Pilha_2, Estava_No_Topo);
		Writeln(5 - I, ' ', Estava_No_Topo);
		END;
END. { Testa_Pilha }
