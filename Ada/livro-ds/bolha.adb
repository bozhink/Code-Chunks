-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Bolha.Adb
procedure Bolha(V : in out Vetor) is
	Ultimo      : Integer;
	Outro_Ciclo : Boolean;

	procedure Swap(X, Y : in out Key) is
		Temp : Key;
	begin
		Temp := X;
		X    := Y;
		Y    := Temp;
	end Swap;
begin
	Ultimo      := V'Last;
	Outro_Ciclo := True;
	while Outro_Ciclo loop
		Outro_Ciclo := False;
		for Atual in 1 .. Ultimo - 1 loop
			if V(Atual) > V(Atual+1) then
				Swap(V(Atual),V(Atual+1));
				Outro_Ciclo := True;
			end if;
		end loop;
		Ultimo := Ultimo - 1;
	end loop;
end Bolha;