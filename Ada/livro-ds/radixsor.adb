-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte RadixSor.Adb
procedure Radix_Sort(V : in out Vetor) is
	R                       : array(V'First..V'Last) of Positive;
	B                       : constant := 10;
	Modifique_Funcao_Digito : exception;	

	-- Algoritmo 8.9 modificado
	procedure Contagem(D : Integer) is
		T : array(1..B) of Natural;
		P : Natural;

		function Digito(Val : Integer) return Natural is
		begin
			case D is
				when 1 => 
					return Val mod B + 1;
				when 2 => 
					return (Val mod (B * B)) / B + 1;
				when others =>
					raise Modifique_Funcao_Digito;
			end case;

		end Digito;
	begin
		-- Inicializa o vetor T; por isso o intervalo
		-- de chaves deve estar entre 1 e B 
		for I in 1 .. B loop
			T(I) := 0;
		end loop;

		-- Determina T(I) de modo a indicar o número
		-- de elementos iguais a I 
		for I in V'First .. V'Last loop
			T(Digito(V(I))) := T(Digito(V(I))) + 1;
		end loop;

		-- Faz com que T(I) contenha o número
		-- de elementos menores ou iguais a I 
		for I in 2 .. B loop
			T(I) := T(I) + T(I - 1);
		end loop;

		-- Coloca cada elemento V(I) em sua
		-- posição correta 
		for I in V'First .. V'Last loop
			P                  := Digito(V(I));
			R(V'Length-T(P)+1) := V(I);
			T(P)               := T(P) - 1;
		end loop;

		-- Copia R para V 
		for I in V'First .. V'Last loop
			if D = Digitos then
				V(V'Length-I+1) := R(I);
			else
				V(I)            := R(I);
			end if;
		end loop;
	end Contagem;
begin
	for I in 1 .. Digitos loop
		Contagem(I);
	end loop;

end Radix_Sort;