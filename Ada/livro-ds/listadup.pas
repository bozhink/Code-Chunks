{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte ListaDup.pas    }
PROGRAM ListaDup;

	USES Crt;  {  Turbo Pascal para Windows }

	TYPE

		Elo = ^No; { Define um tipo ponteiro para No }

		No = RECORD  { Define o lay-out de um nó da lista }
			Esq  : Elo;
			Dado : CHAR;
			Dir  : Elo;
			END;

	VAR

		Head     : Elo;
		Retirado : CHAR;

	PROCEDURE Inicializa(VAR Ld : Elo);  { Algoritmo 5.10 }
	BEGIN
		Ld := NIL;
	END; { Inicializa }

	PROCEDURE Insere_Esq(VAR Ld : Elo; D : CHAR); { Algoritmo 5.11 }
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Esq.');
			Halt; { Termina a execução do programa }
			END;
	IF Ld <> NIL THEN
                	Ld^.Esq := Ld;
		P^.Dado := D;
		P^.Esq  := NIL;
		P^.Dir  := Ld;
		Ld      := P;
	END; { Insere_Esq }

	PROCEDURE Insere_Dir(VAR Ld : Elo; D : CHAR); { Algoritmo 5.12 }
	VAR
		P, Q : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Dir.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado := D;
		P^.Dir  := NIL;
		IF Ld = NIL THEN BEGIN
			Ld     := P;
			P^.Esq := NIL;
			END
		ELSE BEGIN
			Q := Ld;
			WHILE Q <> NIL DO
				IF Q^.Dir = NIL THEN BEGIN
					Q^.Dir := P;
					P^.Esq := Q;
					Q      := NIL;
					END
				ELSE
					Q := Q^.Dir;
			END;
	END; { Insere_Dir }

	PROCEDURE Insere_Dir_No(Q : Elo; D : CHAR); { Algoritmo 5.13 }
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Dir_No.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado := D;
		P^.Dir  := Q^.Dir;
		P^.Esq  := Q;
		Q^.Dir  := P;
	END; { Insere_Dir_No }

	PROCEDURE Retira_Esq(VAR Ld : Elo; VAR R : CHAR); { Algoritmo 5.14 }
	VAR
		Q : Elo;
	BEGIN
		IF Ld = NIL THEN BEGIN
			Writeln('*** A lista esta vazia: Insere_Esq.');
			Halt; { Termina a execução do programa }
			END;
		R  := Ld^.Dado;
		Q  := Ld;
		Ld := Ld^.Dir;
		IF Ld <> NIL THEN
			Ld^.Esq := NIL;
		Dispose(Q);  { Libera a memória do nó referenciado por P }
	END; { Retira_Esq }

	PROCEDURE Retira_Dir(VAR Ld : Elo; VAR R : CHAR); { Algoritmo 5.15 }
	VAR
		P, Q : Elo;
	BEGIN
		IF Ld = NIL THEN BEGIN
			Writeln('*** A lista esta vazia: Retira_Dir.');
			Halt; { Termina a execução do programa }
			END;
		Q := Ld;
		IF Ld^.Dir = NIL THEN
			Ld := NIL { A lista tem apenas um nó }
				  { e agora está vazia }
		ELSE BEGIN
			{  Faz o no' antecessor de Q apontar para
			   o sucessor de Q  }
			WHILE Q^.Dir <> NIL DO BEGIN
				P := Q;
				Q := Q^.Dir;
				END;
			Q := P^.Dir;
			P^.Dir := NIL;
			END;
		R := Q^.Dado;
		Dispose(Q);
	END; { Retira_Dir }

	{ Algoritmo 5.16 }
	PROCEDURE Retira_No(VAR Ld : Elo; Q : Elo; VAR R : CHAR);
	BEGIN
		IF Ld = Q THEN BEGIN
			Ld := Q^.Dir; { Q é o primeiro do na lista }
			IF Ld <> NIL THEN
				Ld^.Esq := NIL;
			END
		ELSE BEGIN
			Q^.Esq^.Dir := Q^.Dir;
			IF Q^.Dir <> NIL THEN
				Q^.Dir^.Esq := Q^.Esq;
			END;
		R := Q^.Dado;
		Dispose(Q);
	END; { Retira_No }

	{ Algoritmo 5.17 }
	FUNCTION Consulta(Ld : Elo; D : CHAR) : Elo;
	VAR
		P : Elo;
	BEGIN
		Consulta := NIL;
		P := Ld;
		WHILE P <> NIL DO
			IF P^.Dado = D THEN BEGIN
				Consulta := P;
				P := NIL;
				END
			ELSE
				P := P^.Dir;
	END; { Consulta }

	{ Algoritmo 5.18 }
	PROCEDURE Libera_Memoria(VAR Ld : Elo);
	VAR
		P, Q : Elo;
	BEGIN
		P := Ld;
		WHILE P <> NIL DO BEGIN
			Q := P;
			P := P^.Dir;
			Dispose(Q);
			END;
		Ld := NIL;
	END; { Libera_Memoria }

	PROCEDURE Exibe_Lista(Ld : Elo; Msg : STRING);
	VAR
		P : Elo;
	BEGIN
		P := Ld;
		Write(Msg,': ');
		WHILE P <> NIL DO BEGIN
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
	Exibe_Lista(Head,'Lista apos Insere_Dir_Q(Consulta(Head,''A''),''X'')');
	Retira_Esq(Head,Retirado);
	WriteLn(Retirado, ' estava no primeiro nodo da lista');
	Retira_Dir(Head,Retirado);
	WriteLn(Retirado, ' estava no ultimo nodo da lista');
	Exibe_Lista(Head,'Lista apos retirada do primeiro e ultimo nodos');
	Retira_No(Head,Consulta(Head,'X'),Retirado);
	WriteLn('O elemento retirado foi ', Retirado);
	Exibe_Lista(Head,'Lista depois de retirar o nodo que continha ''X''');
	Libera_Memoria(Head);
END. { Lista_Dupla }
