-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Shell.Adb
-- Algoritmo 8.5
procedure Shell(V : in out Vetor) is
	D    : Integer;
	Base : Integer;

	procedure Swap(X, Y : in out Key) is
		Temp : Key;
	begin
		Temp := X;
		X    := Y;
		Y    := Temp;
	end Swap;
begin
	D := V'Last / 2;
	while D > 0 loop
		for Ref in D + 1 .. V'Last loop
			Base := Ref - D;
			while Base > 0 and then Compara(V(Base),V(Base+D)) loop
				Swap(V(Base),V(Base+D));
				Base := Base - D;
			end loop;
		end loop;
		D := D / 2;
	end loop;
end Shell;