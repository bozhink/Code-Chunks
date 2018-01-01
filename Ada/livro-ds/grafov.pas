{ (C) 1999, Arthur Vargas Lopes }
{ Arquivo fonte Grafov.Pas      }

PROGRAM GrafoV;

	USES Crt;

CONST
	First  = 1;
	Last   = 7;
	MValor = 99;	{ Representa um valor muito acima
			  de um custo }
TYPE
	Tipo_Valor = INTEGER;
	Grafo      = ARRAY[First .. Last,First .. Last] OF Tipo_Valor;
	Visitados  = ARRAY[First .. Last] OF BOOLEAN;
VAR
	G1, C1, P1, Cd1 : Grafo;
	X               : INTEGER;

	{ Algoritmo 6.14 }
	PROCEDURE Inicializa(VAR G : Grafo);
	VAR
		I, J : INTEGER;
	BEGIN
		FOR I := First TO Last DO
			FOR J := First TO Last DO
				G[I,J] := 0;
	END; { Inicializa }

	{ Algoritmo 6.15 }
	PROCEDURE Conecta(VAR G : Grafo; I, J, V : INTEGER);
	BEGIN
		G[I,J] := V;

	END; { Conecta }

	{ Algoritmo 6.16 }
	PROCEDURE Desconecta(VAR G : Grafo; I, J : INTEGER);
	BEGIN
		G[I,J] := 0;

	END; { Desconecta }

	{ Algoritmo 6.17 }
	FUNCTION Adjacente(G : Grafo; I, J : INTEGER) : Tipo_Valor;
	BEGIN
		Adjacente := G[I,J];

	END; { Adjacente }

	{ Algoritmo 6.18 }
	PROCEDURE Imprime(G : Grafo);
	VAR
		I, J : INTEGER;
	BEGIN
		Write(' ');

		FOR I := First TO Last DO
			Write(I : 3);
		WriteLn;

		FOR I := First TO Last DO BEGIN
			Write(I);
			FOR J := First TO Last DO
				Write(G[I,J] : 3);
			Writeln;
			END;
	END; { Imprime }

	{ Algoritmo 6.19 }
	PROCEDURE Menores_Custos(G : Grafo; VAR C : Grafo);
	VAR
		I, J, K : INTEGER;
	BEGIN
		FOR I := First TO Last DO
			FOR J := First TO Last DO
				IF G[I,J] <> 0 THEN
					C[I,J] := G[I,J]
				ELSE
					C[I,J] := MValor;
		FOR I := First TO Last DO
			C[I,I] := 0;
		FOR K := First TO Last DO
			FOR I := First TO Last DO
				FOR J := First TO Last DO
					IF (C[I,K] + C[K,J]) < C[I,J] THEN
						C[I,J] := C[I,K] + C[K,J];
	END; { Menores_Custos }

	{ Algoritmo 6.20 }
	PROCEDURE Gera_Caminhos(G : Grafo; VAR P : Grafo);
	VAR
		C       : Grafo;
		I, J, K : INTEGER;
	BEGIN
		FOR I := First TO Last DO
			FOR J := First TO Last DO BEGIN
				P[I,J] := 0;
				IF G[I,J] <> 0 THEN
					C[I,J] := G[I,J]
				ELSE
					C[I,J] := MValor;
				END;

		FOR I := First TO Last DO
			C[I,I] := 0;

		FOR K := First TO Last DO
			FOR I := First TO Last DO
				FOR J := First TO Last DO
					IF (C[I,K] + C[K,J]) < C[I,J] THEN BEGIN
						C[I,J] := C[I,K] + C[K,J];
						P[I,J] := K;
						END;
	END; { Gera_Caminhos }

	{ Algoritmo 6.21 }
	PROCEDURE Exibe_Caminho(P : Grafo; I, J, F : INTEGER);
	VAR
		K : Tipo_Valor;
	BEGIN
		IF F = 1 THEN { Exibe o vértice inicial }
			Write(I : 3);
		K := P[I,J];
		IF K <> 0 THEN BEGIN
			{ Tenta exibir os vértice intermediários entre I e K }
			Exibe_Caminho(P,I,K,F+1);
			Write(K : 3);
			{ Tenta exibir os vértice intermediários entre K e J }
			Exibe_Caminho(P,K,J,F+1);
			END;
		IF F = 1 THEN { Exibe o vértice final }
			Writeln(J : 3);

	END; { Exibe_Caminho }

	{ Algoritmo 6.22 }
	PROCEDURE Menor_Caminho(G : Grafo; I, J : INTEGER);
	VAR
		P : Grafo;
	BEGIN
		Write('O menor caminho entre ', I, ' e ', J, ' e'': ');
		Gera_Caminhos(G,P);
		Exibe_Caminho(P,I,J,1);

	END; { Menor_Caminho }

	{ Algoritmo 6.23 }
	PROCEDURE Gera_Conectividade(G : Grafo; VAR Cd : Grafo);
	VAR
		I, J, K : INTEGER;
	BEGIN
		Writeln('Matriz de conectividade:');

		FOR I := First TO Last DO
			FOR J := First TO Last DO
				IF G[I,J] > 0 THEN
					Cd[I,J] := 1
				ELSE
					Cd[I,J] := 0;

		FOR K := First TO Last DO
			FOR I := First TO Last DO
				FOR J := First TO Last DO
					IF Cd[I,J] = 0 THEN
						IF (Cd[I,K] > 0) AND
						   (Cd[K,J] > 0) THEN
							Cd[I,J] := 1;
	END; { Gera_Conectividade }

	{ Algoritmo 6.24 }
	FUNCTION Centro(G : Grafo) : INTEGER;
	VAR
		C       : Grafo;
		E       : ARRAY[First..Last] OF Tipo_Valor;
		I, J, X : INTEGER;
	BEGIN
		Menores_Custos(G,C);

		FOR I := First TO Last DO
			E[I] := 0;

		FOR J := First TO Last DO
			FOR I := First TO Last DO
				IF C[I,J] > E[J] THEN
					E[J] := C[I,J];
		X := Mvalor;

		FOR I := First TO Last DO BEGIN
			Writeln(' ' : 10,'E(',I,') = ', E[I]);
			IF E[I] < X THEN
				X := E[I];
			END;

		Centro := X;

	END; { Centro }

BEGIN
	Inicializa(G1);

	Conecta(G1,1,2,1);
	Conecta(G1,1,5,1);
	Conecta(G1,1,7,9);
	Conecta(G1,2,3,1);
	Conecta(G1,2,4,4);
	Conecta(G1,2,6,5);
	Conecta(G1,3,4,2);
	Conecta(G1,4,7,3);
	Conecta(G1,5,4,10);
	Conecta(G1,5,6,2);
	Conecta(G1,6,3,8);
	Conecta(G1,6,7,3);
	Conecta(G1,7,2,6);

	Writeln('Grafo com sete vertices:');
	Imprime(G1);
	Writeln;

	Writeln('Menores custos:');
	Menores_Custos(G1,C1);
	Imprime(C1);
	Writeln;

	Writeln('Matriz de caminhos:');
	Gera_Caminhos(G1,P1);
	Imprime(P1);
	Writeln;

	Menor_Caminho(G1,1,7);
	Menor_Caminho(G1,1,4);
	Menor_Caminho(G1,4,6);

	Writeln;
	Gera_Conectividade(G1,Cd1);
	Imprime(Cd1);
	Writeln;

	Writeln;
	Writeln('Exentricidades de G1: ');
	X := Centro(G1);
	Writeln('O centro de G1 e'': ', X);

END. { GrafoV }
