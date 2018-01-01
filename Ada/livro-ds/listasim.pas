{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte ListaSim.Pas    }
PROGRAM ListaSim;

	USES Crt;  { Turbo Pascal para Windows }

	TYPE

		Elo = ^No;         { Define um tipo ponteiro para No }

		No = RECORD  { Define o lay-out de um no da lista }
			Dado : CHAR;
			Link : Elo;
			END;

	VAR

		Head     : Elo;
		Retirado : CHAR;

	{ Algoritmo 5.1 }
	PROCEDURE Inicializa(VAR Ls : Elo);
	BEGIN
		Ls := NIL;
	END; { Inicializa }

	{ Algoritmo 5.2 }
	PROCEDURE Insere_Esq(VAR Ls : Elo; D : CHAR);
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Esq.');
			Halt; { Termina a execução do programa }
			END;
		P^.Link := Ls;
		P^.Dado := D;
		Ls      := P;

	END; { Insere_Esq }

	{ Algoritmo 5.3 }
	PROCEDURE Insere_Dir(VAR Ls : Elo; D : CHAR);
	VAR
		P, Q : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Dir.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado := D;
		P^.Link := NIL;
		IF Ls = NIL THEN
			Ls := P
		ELSE BEGIN
			Q := Ls;
			WHILE Q <> NIL DO
				IF Q^.Link = NIL THEN BEGIN
					Q^.Link := P;
					Q       := NIL;
					END
				ELSE
					Q := Q^.Link;
			END;
	END; { Insere_Dir }

	{ Algoritmo 5.4 }
	PROCEDURE Insere_Dir_No(Q : Elo; D : CHAR);
	VAR
		P : Elo;
	BEGIN
		New(P); { Aloca memória para um No com endereço inicial P }
		IF P = NIL THEN BEGIN
			Writeln('*** Faltou memoria: Insere_Dir_No.');
			Halt; { Termina a execução do programa }
			END;
		P^.Dado := D;
		P^.Link := Q^.Link;
		Q^.Link := P;
	END; { Insere_Dir_No }

	{ Algoritmo 5.5 }
	PROCEDURE Retira_Esq(VAR Ls : Elo; VAR R : CHAR);
	VAR
		P : Elo;
	BEGIN
		IF Ls = NIL THEN BEGIN
			Writeln('*** A lista esta vazia: Insere_Esq.');
			Halt; { Termina a execução do programa }
			END;
		R := Ls^.Dado;
		P := Ls;
		Ls := Ls^.Link;
		Dispose(P);  { Libera a memória do nó referenciado por P }
	END; { Retira_Esq }

	{ Algoritmo 5.6 }
	PROCEDURE Retira_Dir(VAR Ls : Elo; VAR R : CHAR);
	VAR
		P, Q : Elo;
	BEGIN
		IF Ls = NIL THEN BEGIN
			Writeln('*** A lista esta vazia: Retira_Dir.');
			Halt; { Termina a execução do programa }
			END;
		Q := Ls;
		IF Ls^.Link = NIL THEN
			Ls := NIL	{ A lista tem apenas um nó }
                            	{ e agora está vazia }
                ELSE BEGIN
			WHILE Q^.Link <> NIL DO BEGIN
                        	P := Q;
				Q := Q^.Link;
				END;
			Q := P^.Link;
			P^.Link := NIL;
			END;
		R := Q^.Dado;
		Dispose(Q);
	END; { Retira_Dir }

        { Algoritmo 5.7 }
	PROCEDURE Retira_No(VAR Ls : Elo; Q : Elo; VAR R : CHAR);
	VAR
		P : Elo;
	BEGIN
		IF Ls = Q THEN
                	Ls := Q^.Link { Q é o primeiro nó na lista }
		ELSE BEGIN
			{ Faz o nó antecessor a Q apontar 
			  para o sucessor de Q }
			P := Ls;
			WHILE P <> NIL DO
				IF P^.Link = Q THEN BEGIN
					P^.Link := Q^.Link;
					P := NIL;
					END
				ELSE
					P := P^.Link;
			END;
		R := Q^.Dado;
		Dispose(Q);
	END; { Retira_No }

	{ Algoritmo 5.8 }
	FUNCTION Consulta(Ls : Elo; D : CHAR) : Elo;
	VAR
        	P : Elo;
	BEGIN
		Consulta := NIL;
        	P := Ls;
		WHILE P <> NIL DO
			IF P^.Dado = D THEN BEGIN
				Consulta := P;
				P := NIL;
				END
			ELSE
                        	P := P^.Link;
	END; { Consulta }

	{ Algoritmo 5.9 }
	PROCEDURE Libera_Memoria(VAR Ls : Elo);
	VAR
		P, Q : Elo;
	BEGIN
		P := Ls;
		WHILE P <> NIL DO BEGIN
			Q := P;
			P := P^.Link;
			Dispose(Q);
			END;
		Ls := NIL;
	END; { Libera_Memoria }

	PROCEDURE Exibe_Lista(Ls : Elo; Msg : STRING);
	VAR
        	P : Elo;
	BEGIN
        	P := Ls;
		Write(Msg,': ');
		WHILE P <> NIL DO BEGIN
 			Write(P^.Dado);
			P := P^.Link;
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
	Exibe_Lista(Head
		,'Lista apos Insere_Dir_Q(Consulta(Head,''A''),''X'')');
	Retira_Esq(Head,Retirado);
	WriteLn(Retirado, ' estava no primeiro nodo da lista');
	Retira_Dir(Head,Retirado);
	WriteLn(Retirado, ' estava no ultimo nodo da lista');
	Exibe_Lista(Head,'Lista apos retirada do primeiro e ultimo nodos');
	Retira_No(Head,Consulta(Head,'X'),Retirado);
	WriteLn('O elemento retirado foi ', Retirado);
	Exibe_Lista(Head,'Lista depois de retirar o nodo que continha ''X''');
	Libera_Memoria(Head);
END. { Lista_Simples }
