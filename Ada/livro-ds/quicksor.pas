{ (C) 1998, Arthur Vargas Lopes }
{ Arquivo fonte QuickSor.Pas    }

PROGRAM Testa_Quick_Sort;

	USES WinCrt;

CONST
	N     = 10;
TYPE
	Key   = INTEGER;
	Vetor = ARRAY[1..N] OF Key;

VAR
	Dados : Vetor;
	I : INTEGER;

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

	PROCEDURE Swap(VAR X, Y : Key);
	VAR
		Temp : Key;
	BEGIN
		Temp := X;
		X    := Y;
		Y    := Temp;
	END; { Swap }

	{ Algoritmo 8.8 }
	PROCEDURE Quick_Sort(VAR V : Vetor; Esq, Dir : INTEGER);
	VAR
		Centro : INTEGER;
		FUNCTION Particao(Esq, Dir : INTEGER) : INTEGER;
		VAR
			I, J : INTEGER;
			Pivo : Key;
			Sai  : BOOLEAN;
		BEGIN
			{ Obtem o Pivo }
			Pivo := V[Esq];

			Sai  := False;

			REPEAT
				{ Constrói duas partições }
				I := Esq + 1;
				IF I <= dir THEN
					WHILE (I <= Dir) AND (NOT Sai) DO
						IF V[I] <= Pivo THEN
							I := I + 1
						ELSE
							Sai := True;
				J := Dir;
				IF J >= Esq THEN
					WHILE V[J] > Pivo DO
						J := J - 1;

				{ Troca V[I] com V[J] caso I e J
				  não tenham se cruzado }
				IF (I < J) AND (I <= Dir) AND (J >= Esq) THEN
					Swap(V[I],V[J])
			UNTIL I > J;

			{ Neste ponto V[J] contém o menor valor
			  e o maior valor até J está em Pivo }
			V[Esq] := V[J];
			V[J]   := Pivo;

			{ Os elementos entre [Esq,J] são menores
			  ou iguais aos elementos entre [J+1,Dir] }
			Particao := J;

		END; { Particao }


	BEGIN
		IF Esq < Dir THEN BEGIN
			Centro := Particao(Esq,Dir);
			Quick_Sort(V,Esq,Centro);
			Quick_Sort(V,Centro+1,Dir);
			END;
	END; { Quick_Sort }

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

	Quick_Sort(Dados,1,10);

	Imprime_Vetor('Vetor depois da ordenacao: ',Dados,10);

END. { Testa_Quick_Sort }