{ (C) 1999-1999, Arthur Vargas Lopes }
{ Arquivo fonte ListaDuC.Pas         }
PROGRAM ListaDuC;

	USES Crt;  { Turbo Pascal para Windows }

	TYPE

		Elo = ^No;         { Define um tipo ponteiro para No }

		No = RECORD  { Define o lay-out de um no da lista }
			Esq  : Elo;
			Dado : CHAR;
			Dir  : Elo;
			END;

	VAR

		Head     : Elo;
		Retirado : CHAR;

	PROCEDURE Inicializa(VAR Ld : Elo);  { Algoritmo 5.19 }
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Inicializa.');
			Halt; { Termina a execução do programa }
			END;
		Ld      := P;
		P^.Esq  := P;
		P^.Dir  := P;
		P^.Dado := 'D';
	END; { Inicializa }

	PROCEDURE Insere_Esq(VAR Ld : Elo; D : CHAR); { Algoritmo 5.20 }
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Esq.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dir       := Ld^.Dir;
		P^.Esq       := Ld;
		Ld^.Dir^.Esq := P;
		Ld^.Dir      := P;
		P^.Dado := D;
	END; { Insere_Esq }

	PROCEDURE Insere_Dir(VAR Ld : Elo; D : CHAR); { Algoritmo 5.21 }
	VAR
		P, Q : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Dir.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado      := D;
		P^.Dir       := Ld;
		P^.Esq       := Ld^.Esq;
		Ld^.Esq^.Dir := P;
		Ld^.Esq      := P;
	END; { Insere_Dir }

	PROCEDURE Insere_Dir_No(Q : Elo; D : CHAR); { Algoritmo 5.22 }
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Dir_No.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado     := D;
		P^.Dir      := Q^.Dir;
		P^.Esq      := Q;
		Q^.Dir^.Esq := P;
		Q^.Dir      := P;
	END; { Insere_Dir_No }

	PROCEDURE Retira_Esq(VAR Ld : Elo; VAR R : CHAR); { Algoritmo 5.23 }
	VAR
		Q : Elo;
	BEGIN
		IF Ld^.Dir = Ld THEN BEGIN
			Writeln('*** A lista esta vazia: Insere_Esq.');
			Halt; { Termina a execução do programa }
			END;
		Q            := Ld^.Dir;
		R            := Q^.Dado;
		Ld^.Dir^.Esq := Ld;
		Ld^.Dir      := Ld^.Dir^.Dir;
		Dispose(Q);  { Libera a memória do nó referenciado por Q }
	END; { Retira_Esq }

	PROCEDURE Retira_Dir(VAR Ld : Elo; VAR R : CHAR); { Algoritmo 5.24 }
	VAR
		P, Q : Elo;
	BEGIN
		IF Ld^.Dir = Ld THEN BEGIN
			Writeln('*** A lista esta vazia: Retira_Dir.');
			Halt; { Termina a execução do programa }
			END;
		Q           := Ld^.Esq;
		R           := Q^.Dado;
		Q^.Dir^.Esq := Q^.Esq;
		Q^.Esq^.Dir := Q^.Dir;
		Dispose(Q);
	END; { Retira_Dir }

	{ Algoritmo 5.25 }
	PROCEDURE Retira_No(VAR Ld : Elo; Q : Elo; VAR R : CHAR);
	VAR
		P : Elo;
	BEGIN
		R           := Q^.Dado;
		Q^.Dir^.Esq := Q^.Esq;
		Q^.Esq^.Dir := Q^.Dir;
		Dispose(Q);
	END; { Retira_No }

	{ Algoritmo 5.26 }
	FUNCTION Consulta(Ld : Elo; D : CHAR) : Elo;
	VAR
		P : Elo;
	BEGIN
		Consulta := NIL;
		P        := Ld^.Dir;
		WHILE P <> Ld DO
			IF P^.Dado = D THEN BEGIN
				Consulta := P;
				P := Ld;
				END
			ELSE
				P := P^.Dir;
	END; { Consulta }

	{ Algoritmo 5.27 }
	PROCEDURE Libera_Memoria(VAR Ld : Elo);
	VAR
		P, Q : Elo;
	BEGIN
		P := Ld^.Dir;
		WHILE P <> Ld DO BEGIN
			Q := P;
			P := P^.Dir;
			Dispose(Q);
			END;
		Dispose(Ld);
		Ld := NIL;
	END; { Libera_Memoria }

	PROCEDURE Exibe_Lista(Ld : Elo; Msg : STRING);
	VAR
		P : Elo;
	BEGIN
		P := Ld^.Dir;
		Write(Msg,': ');
		WHILE P <> Ld DO BEGIN
			Write(P^.Dado);
			P := P^.Dir;
			END;
		WriteLn;
	END; { Exibe_Lista }

BEGIN
	Inicializa(Head);
	Insere_Esq(Head,'A');
	Insere_Esq(Head,'B');
	Insere_Esq(Head,'C');
	Exibe_Lista(Head,'Lista apos Insere_Esq A, B, C');
	Insere_Dir(Head,'D');
	Insere_Dir(Head,'E');
	Insere_Dir(Head,'F');
	Exibe_Lista(Head,'Lista apos Insere_Dir D, E, F');
	{ Insere 'X' a direita do nó cujo campo de dado é 'A' }
	Insere_Dir_No(Consulta(Head,'A'),'X');
	Exibe_Lista(Head,'Lista apos 	Insere_Dir_Q(Consulta(Head,''A''),''X'')');
	Retira_Esq(Head,Retirado);
	WriteLn(Retirado, ' estava no primeiro nodo da lista');
	Retira_Dir(Head,Retirado);
	WriteLn(Retirado, ' estava no ultimo nodo da lista');
	Exibe_Lista(Head,'Lista apos retirada do primeiro e ultimo nodos');
	Retira_No(Head,Consulta(Head,'X'),Retirado);
	WriteLn('O elemento retirado foi ', Retirado);
	Exibe_Lista(Head,'Lista depois de retirar o nodo que continha ''X''');
	Libera_Memoria(head);
END. { Lista_DuC }
