-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Insercao.Adb
procedure Insercao(V : in out Vetor) is
	Chave_Atual : Key;
	Anterior    : Integer;
begin
	for Atual in 2 .. V'Last loop
		Chave_Atual := V(Atual);
		Anterior    := Atual - 1;
		while Anterior > 0 and then
			V(Anterior) > Chave_Atual loop
			V(Anterior+1) := V(Anterior);
			Anterior      := Anterior - 1;
		end loop;
		V(Anterior+1) := Chave_Atual;
	end loop;
end Insercao;