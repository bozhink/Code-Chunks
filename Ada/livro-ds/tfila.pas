{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte TFila.pas        }
PROGRAM TFila;	{ Demonstra o uso de uma fila de
	          	  até 10 caracteres }

	USES Crt;

	CONST Max = 10; { Define o número máximo de
	                  elementos da fila }

	TYPE	{ Define o tipo Fila }
		Fila = RECORD
			Q  : ARRAY[1 .. Max] OF CHAR;
			Inicio : INTEGER;
			Fim    : INTEGER;
			END;

	VAR
		Fila_1, Fila_2 : Fila;   	{ Declara duas filas }
		Estava_No_Topo : CHAR;		{ Armazena quem estava
						  na frente de uma fila }
		I              : INTEGER;	{ Auxilia nos loops }

	{ Implementação do algoritmo 4.1 }
	PROCEDURE Inicializa(VAR F : Fila);
	BEGIN
		F.Inicio := 1;
		F.Fim    := 0;
	END;

	{ Implementação do algoritmo 4.2 }
	PROCEDURE Queue(VAR F : Fila; D : CHAR);
	BEGIN
		IF F.Fim = Max THEN { Verifica overflow de fila }
			writeln('*** Overflow na fila ***')
		ELSE BEGIN
			F.Fim := F.Fim + 1;
			F.Q[F.Fim] := D;
			END;
	END;

	{ Implementação do algoritmo 4.3 }
	PROCEDURE DeQueue(VAR F : Fila; VAR R : CHAR);
	BEGIN
		IF F.Inicio > F.Fim THEN BEGIN { Verifica underflow de fila }
			Writeln('*** Underflow na fila ***');
			R := '?';
			END
		ELSE BEGIN
			R := F.Q[F.Inicio];
			F.Inicio := F.Inicio + 1;
			END;
	END;

BEGIN
	Inicializa(Fila_1);
	Inicializa(Fila_2);

	Queue(Fila_1,'A');
	Queue(Fila_1,'B');
	Queue(Fila_1,'C');
	Queue(Fila_1,'D');

	Queue(Fila_2,'A');

	{ Exibe o conteúdo de Fila_1 }
	FOR I := Fila_1.Inicio TO Fila_1.Fim DO BEGIN  
		DeQueue(Fila_1, Estava_No_Topo);
		Writeln(I, ' ', Estava_No_Topo);
		END;

	FOR I := 1 TO 4 DO BEGIN  { Exibe o conteúdo de Fila_2 }
		DeQueue(Fila_2, Estava_No_Topo);
		Writeln(I, ' ', Estava_No_Topo);
		END;
END. { Testa_Fila }
