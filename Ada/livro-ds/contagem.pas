{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Contagem.Pas    }

PROGRAM Contagem;

	USES Crt;

CONST
	N = 10;
	M = 10;
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

	{ Algoritmo 8.9 }
	PROCEDURE Contagem_Sort(VAR V : Vetor);
	VAR
		I, P : INTEGER;
		R    : ARRAY[1..N] OF INTEGER;
		T    : ARRAY[1..M] OF INTEGER;

	BEGIN
		{ Inicializa o vetor T; por isso o intervalo
		  de chaves deve estar entre 1 e M }
		FOR I := 1 TO M DO
			T[I] := 0;

		{ Determina T[I] de modo a indicar o número
		  de elementos iguais a I }
		FOR I := 1 TO N DO
			T[V[I]] := T[V[I]] + 1;

		{ Faz com que T[I] contenha o número
		  de elementos menores ou iguais a I }
		FOR I := 2 TO M DO
			T[I] := T[I] + T[I - 1];

		{ Coloca cada elemento V[I] em sua
		  posição correta }
		FOR I := 1 TO N DO BEGIN
			P       := V[I];
			R[T[P]] := P;
			T[P]    := T[P] - 1;
			END;

		{ Copia R para V }
		FOR I := 1 TO N DO
			V[I] := R[I];

	END; { Contagem_Sort }

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

	Contagem_Sort(Dados);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { Contagem }