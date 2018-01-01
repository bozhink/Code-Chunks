-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Contagem.Adb
procedure Contagem(V : in out Vetor) is
	R : array(1..V'Last) of Positive;
	M : Natural := 0;

	-- Algoritmo 8.9
	procedure Faz_O_Sort_Por_Contagem(M : Positive) is
		T : array(1..M) of Natural;
		P : Positive;
	begin
		-- Inicializa o vetor T; por isso o intervalo
		-- de chaves deve estar entre 1 e M 
		for I in 1 .. M loop
			T(I) := 0;
		end loop;

		-- Determina T(I) de modo a indicar o número
		-- de elementos iguais a I 
		for I in 1 .. V'Last loop
			T(V(I)) := T(V(I)) + 1;
		end loop;

		-- Faz com que T(I) contenha o número
		-- de elementos menores ou iguais a I 
		for I in 2 .. M loop
			T(I) := T(I) + T(I - 1);
		end loop;

		-- Coloca cada elemento V(I) em sua
		-- posição correta 
		for I in 1 .. V'Last loop
			P       := V(I);
			R(T(P)) := P;
			T(P)    := T(P) - 1;
		end loop;

		-- Copia R para V 
		for I in 1 .. V'Last loop
			V(I) := R(I);
		end loop;

	end Faz_O_Sort_Por_Contagem;
begin
	-- Obtém o maior valor de V
	for I in V'Range loop
		if V(I) > M then
			M := V(I);
		end if;
	end loop;

	Faz_O_Sort_Por_Contagem(M);		

end Contagem;