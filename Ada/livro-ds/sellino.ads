-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SelLinO.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Selecao_Linear_Otimizado(V : in out Vetor);
