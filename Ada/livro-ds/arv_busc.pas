{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Arv_Busc.Pas    }
PROGRAM Arv_Busc;
	USES Crt;
TYPE
	Key = CHAR;

	Elo = ^No;

	No = RECORD
		Esq   : Elo;
		Chave : Key;
		Dir   : Elo;
		Pai   : Elo; { Armazena o endereço do nó ancestral }
		END;

VAR
	Raiz : Elo;

	PROCEDURE Pre_Fixado(R : Elo); { Algoritmo 7.1 }
	BEGIN
		IF R <> NIL THEN BEGIN
			Write(R^.Chave);
			Pre_Fixado(R^.Esq);
			Pre_Fixado(R^.Dir);
			END;
	END; { Pre_Fixado }

	PROCEDURE Central(R : Elo); { Algoritmo 7.2 }
	BEGIN
		IF R <> NIL THEN BEGIN
			Central(R^.Esq);
			Write(R^.Chave);
			Central(R^.Dir);
			END;
	END; { Central }

	PROCEDURE Pos_Fixado(R : Elo); { Algoritmo 7.3 }
	BEGIN
		IF R <> NIL THEN BEGIN
			Pos_Fixado(R^.Esq);
			Pos_Fixado(R^.Dir);
			Write(R^.Chave);
			END;
	END; { Pos_Fixado }

	PROCEDURE Inicializa(VAR R : Elo); { Algoritmo 10.9 }
	BEGIN
		R := NIL;
	END;  { Inicializa }

	PROCEDURE Insere(VAR R : Elo; K : Key); { Algoritmo 10.10 }
	VAR
		P, Q  : Elo;
		Itere : BOOLEAN;
	BEGIN
		New(P);
		IF P = NIL THEN BEGIN
			Write('*** Insere: Memoria insuficiente');
			writeln(' para insercao de ', K);
			Halt;
			END;

		P^.Chave := K;
		P^.Esq   := NIL;
		P^.Dir   := NIL;
		P^.Pai   := NIL;

		IF R = NIL THEN
			R := P
		ELSE BEGIN
			Itere := TRUE;
			Q := R;
			WHILE Itere DO BEGIN
				IF Q^.Chave > K THEN
					IF Q^.Esq = NIL THEN BEGIN
						Q^.Esq := P;
						P^.Pai := Q;
						Itere  := FALSE;
						END
					ELSE
						Q := Q^.Esq
				ELSE { Chave de Q é <= K }
					IF Q^.Dir = NIL THEN BEGIN
						Q^.Dir := P;
						P^.Pai := Q;
						Itere  := FALSE;
						END
					ELSE
						Q := Q^.Dir;
				END;
			END;
	END; { Insere }

	{ Algoritmo 10.11 }
	FUNCTION Consulta(R : Elo; K : Key) : Elo;
	VAR
		Q : Elo;
	BEGIN
		Q := R;
		Consulta := NIL;
		WHILE Q <> NIL DO
			IF Q^.Chave = K THEN BEGIN
				Consulta := Q;
				Q        := NIL;
				END
			ELSE IF Q^.Chave > K THEN
				Q := Q^.Esq
			ELSE
				Q := Q^.Dir;
	END; { Consulta }

	{ Algoritmo 10.12 }
	PROCEDURE Minimo(R : Elo; VAR M : Elo);
	BEGIN
		M := R;
		WHILE M^.Esq <> NIL DO
			M := M^.Esq;
	END; { Minimo }

	{ Algoritmo 10.13 }
	PROCEDURE Sucessor(Quem : Elo; VAR S : Elo);
	BEGIN
		IF Quem^.Dir <> NIL THEN
			Minimo(Quem^.Dir,S)
		ELSE BEGIN
			S := Quem^.Pai;
			WHILE (S <> NIL) DO
				IF Quem = S^.Dir THEN BEGIN
					Quem := S;
					S := S^.Pai;
					END;
			END;
	END; { Sucessor }

	{ Tendo em vista o endereço de um nó, Quem, o campo de ligação de seu
	  ancestral é atualizado com um novo endereço contido em V }
	PROCEDURE Atualiza_Sub_Arvore_Pai(VAR R : Elo; Quem : Elo; V : Elo);
	BEGIN
		IF (Quem^.Pai = NIL) OR (Quem = R) THEN
			R := V
		ELSE IF Quem^.Pai^.Esq = Quem THEN
			Quem^.Pai^.Esq := V
		ELSE
			Quem^.Pai^.Dir := V;

		IF R <> NIL THEN
			R^.Pai := NIL;
	END; { Atualiza_Sub_Arvore_Pai }

	{ Algoritmo 10.14 }
	PROCEDURE Remove(VAR R : Elo; Quem : Elo);
	VAR
		T : Elo;

	BEGIN
		IF (Quem^.Esq = NIL) AND (Quem^.Dir = NIL) THEN
			{ Quem é uma folha }
			Atualiza_Sub_Arvore_Pai(R,Quem,NIL)
		ELSE IF Quem^.Esq = NIL THEN
			Atualiza_Sub_Arvore_Pai(R,Quem,Quem^.Dir)
		ELSE IF Quem^.Dir = NIL THEN
			Atualiza_Sub_Arvore_Pai(R,Quem,Quem^.Esq)
		ELSE BEGIN
			Sucessor(Quem,T);
			Atualiza_Sub_Arvore_Pai(R,T,NIL);
			IF (T^.Esq = NIL) AND (T^.Dir = NIL) THEN BEGIN
				Atualiza_Sub_Arvore_Pai(R,Quem,T);
				T^.Pai   := Quem^.Pai;
				T^.Esq   := Quem^.Esq;
				T^.Dir   := Quem^.Dir;
				IF T^.Dir = T THEN
					T^.Dir := NIL;
				IF T^.Esq = T THEN
					T^.Esq := NIL;
				END
			ELSE BEGIN
				Quem^.Dir   := T^.Dir;
				Quem^.Chave := T^.Chave;
				Quem := T;
				END
			END;
		Dispose(Quem);
	END; { Remove }
BEGIN

	Inicializa(Raiz);

	Insere(Raiz, 'G');
	Insere(Raiz, 'O');
	Insere(Raiz, 'N');
	Insere(Raiz, 'P');
	Insere(Raiz, 'Z');
	Insere(Raiz, 'D');
	Insere(Raiz, 'B');
	Insere(Raiz, 'A');
	Insere(Raiz, 'C');
	Insere(Raiz, 'F');

	Write('Caminhamento Pre_Fixado: ');
	Pre_Fixado(Raiz);
	Writeln;

	Write('Caminhamento Central: ');
	Central(Raiz);
	Writeln;

	Write('Caminhamento Pos_Fixado: ');
	Pos_Fixado(Raiz);
	Writeln;

	Remove(Raiz,Consulta(Raiz,'G'));

	Write('Caminhamento Central depois da remocao de G: ');	Central(Raiz);
	Writeln;

END. { Arv_Busc }
