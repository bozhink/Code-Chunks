-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SelLin.Adb
procedure Selecao_Linear_Otimizado(V : in out Vetor) is

	IndiceC : Integer;
	MenorC  : Key;
		
	procedure Swap(X, Y : in out Key) is
		Temp : Key;
	begin
		Temp := X;
		X    := Y;
		Y    := Temp;
	end Swap;
begin
	for IMenor in V'First .. V'Last -1 loop
		IndiceC := IMenor;
		MenorC  := V(IMenor);
		for Candidato in IMenor + 1 .. V'Last loop
			if MenorC > V(Candidato) then
				IndiceC := Candidato;
				MenorC  := V(Candidato);
			end if;
			Swap(V(IMenor),V(IndiceC));
		end loop;
	end loop;
end Selecao_Linear_Otimizado;