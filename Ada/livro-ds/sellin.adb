-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SelLin.Adb
procedure Selecao_Linear(V : in out Vetor) is

	procedure Swap(X, Y : in out Key) is
		Temp : Key;
	begin
		Temp := X;
		X    := Y;
		Y    := Temp;
	end Swap;
begin
	for IMenor in V'First .. V'Last -1 loop
		for Candidato in IMenor + 1 .. V'Last loop
			if V(IMenor) > V(Candidato) then
				Swap(V(IMenor),V(Candidato));
			end if;
		end loop;
	end loop;
end Selecao_Linear;

