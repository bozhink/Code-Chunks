-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte MergeSor.Adb
procedure Merge_Sort(V : in out Vetor; Esq, Dir, N : Integer) is
	Temp   : Vetor(1 .. N);
	I, J   : Integer;
	Metade : Integer;
begin
	if (Dir - Esq) > 0 then
		Metade := (Dir + Esq) / 2;
		Merge_Sort(V,Esq,Metade,N);
		Merge_Sort(V,Metade+1,Dir,N);

		for I in Esq .. Metade loop
			Temp(I) := V(I);
		end loop;
		for I in Metade+1 .. Dir loop
			Temp(Dir+Metade+1-I) := V(I);
		end loop;

		I := Esq;
		J := Dir;
		for K in Esq .. Dir loop
			if Temp(I) < Temp(J) then
				V(K) := Temp(I);
				I    := I + 1;
			else
				V(K) := Temp(J);
				J    := J - 1;
			end if;
		end loop;
	end if;

end Merge_Sort;