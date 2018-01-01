-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte QuickSor.Adb
procedure Quick_Sort(V : in out Vetor; Esq, Dir : Integer) is
	I, J, Pivo   : Integer;

	procedure Swap(X, Y : in out Key) is
		Temp : Key;
	begin
		Temp := X;
		X    := Y;
		Y    := Temp;
	end Swap;
begin
	if Esq < Dir then

		Pivo := V(Esq);
		loop
			-- Constrói duas partições 
			I := Esq + 1;

			while I <= V'Last and then V(I) <= Pivo loop
				I := I + 1;
			end loop;

			J := Dir;
			while J >= V'First and then V(J) > Pivo loop
				J := J - 1;
			end loop;

			-- Troca V(I) com V(J) caso I e J
			--  não tenham se cruzado 
			if I < J and J >= V'First and I <= V'Last then
				Swap(V(I),V(J));
			end if;

			exit when I > J;
		end loop;

		-- Neste ponto V(J) contém o menor valor
		-- e o maior valor até J está em Pivo 
		V(Esq) := V(J);
		V(J)   := Pivo;
	
		-- Os elementos entre (Esq,J) são menores
		-- ou iguais aos elementos entre (J+1,Dir) 
		Quick_Sort(V,Esq,J);
		Quick_Sort(V,J+1,Dir);
	end if;
end Quick_Sort;