{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte FilaC.pas       }

PROGRAM FilaC;	{ Demonstra o uso de uma fila circular de
			   	  até 10 caracteres }
	USES Crt;

	CONST Max = 10; { Define o número máximo de
	                  elementos da fila circular }

	TYPE	{ Define o tipo Fila circular }
		Fila = RECORD
			Q  : ARRAY[1 .. Max] OF CHAR;
			Inicio  : INTEGER;
			Fim     : INTEGER;
			Tamanho : INTEGER;
			END;

	VAR
		Fila_1, Fila_2 : Fila;   	{ Declara duas filas circulares }
		Estava_No_Topo : CHAR;	{ Armazena quem estava
		                          	  na frente de uma fila circular }
		I              : INTEGER;	{ Auxilia nos loops }

	{ Implementação do algoritmo 4.4 }
	PROCEDURE Inicializa(VAR F : Fila);
	BEGIN
		F.Inicio  := 1;
		F.Fim     := 0;
		F.Tamanho := 0;
	END;

	{ Implementação do algoritmo 4.5 }
	PROCEDURE Queue(VAR F : Fila; D : CHAR);
	BEGIN
		{ Verifica overflow de fila circular }
		IF F.Tamanho = Max THEN 
			Writeln('*** Overflow na fila ***')
		ELSE BEGIN
			F.Fim      := F.Fim MOD Max + 1;
			F.Q[F.Fim] := D;
			F.Tamanho  := F.Tamanho + 1;
			END;
	END;

	{ Implementação do algoritmo 4.6 }
	PROCEDURE DeQueue(VAR F : Fila; VAR R : CHAR);
	BEGIN
		{ Verifica underflow de fila circular }
		IF F.tamanho = 0 THEN BEGIN 
			Writeln('*** Underflow na fila ***');
			R := '?';
			END
		ELSE BEGIN
			R         := F.Q[F.Inicio];
			F.Inicio  := F.Inicio MOD Max + 1;
			F.Tamanho := F.Tamanho - 1;
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
END. { Testa_Fila_Circular }

