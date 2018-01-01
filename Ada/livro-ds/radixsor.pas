{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte RadixSor.Pas    }

PROGRAM RadixSor;

	USES Crt;

CONST
	N       = 10;
	B       = 10;
	Digitos = 2;
TYPE
	Vetor = ARRAY[1..N] OF INTEGER;

VAR
	Dados : Vetor;

	PROCEDURE Imprime_Vetor(Msg : STRING; V : Vetor; N : INTEGER);
	VAR
		I : INTEGER;
	BEGIN
		Write(Msg);
		FOR I := 1 TO N DO BEGIN
			Write(V[I]);
			IF I <> N THEN
				Write(',');
			END;
		Writeln;
	END; { Imprime_Vetor }

	{ Algoritmo 8.9 modificado }
	PROCEDURE Contagem_Sort(VAR V : Vetor; D : INTEGER);
	VAR
		I, P : INTEGER;
		R    : ARRAY[1..N] OF INTEGER;

		{ O valor de B para números da base 10 é constante }
		T    : ARRAY[1..B] OF INTEGER;

		FUNCTION Digito(Val : INTEGER) : INTEGER;
		VAR
			Temp : INTEGER;
		BEGIN
			CASE D OF
				1 : Temp := Val MOD B;
				2 : Temp := (Val MOD (B * B)) DIV B;
			END;

			Digito := Temp + 1;
		END; { Digito }

	BEGIN
		{ Inicializa o vetor T; por isso o intervalo
		  de chaves deve estar entre 1 e B }
		FOR I := 1 TO B DO
			T[I] := 0;

		{ Determina T[I] de modo a indicar o número
		  de elementos iguais a I }
		FOR I := 1 TO N DO
			T[Digito(V[I])] := T[Digito(V[I])] + 1;

		{ Faz com que T[I] contenha o número
		  de elementos menores ou iguais a I }
		FOR I := 2 TO B DO
			T[I] := T[I] + T[I - 1];

		{ Coloca cada elemento V[I] em sua
		  posição correta }
		FOR I := 1 TO N DO BEGIN
			P           := Digito(V[I]);
			R[N-T[P]+1] := V[I];
			T[P]        := T[P] - 1;
			END;

		{ Copia R para V }
		FOR I := 1 TO N DO
			IF D = Digitos THEN
				V[N-I+1] := R[I]
			ELSE
				V[I]     := R[I];
	END; { Contagem_Sort }


	{ Algoritmo 8.10 }
	PROCEDURE Radix_Sort(VAR V : Vetor);
	VAR
		I : INTEGER;
	BEGIN
		FOR I := 1 TO Digitos DO
			Contagem_Sort(V,I);
	END; { Radix_Sort }

BEGIN
	{ Inicializa Dados para ordenação }
	Dados[ 1] := 10;
	Dados[ 2] :=  9;
	Dados[ 3] :=  8;
	Dados[ 4] :=  7;
	Dados[ 5] :=  6;
	Dados[ 6] :=  5;
	Dados[ 7] :=  4;
	Dados[ 8] :=  3;
	Dados[ 9] :=  2;
	Dados[10] :=  1;

	Imprime_Vetor('Vetor antes da ordenacao:  ',Dados,10);

	Radix_Sort(Dados);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { RadixSor }