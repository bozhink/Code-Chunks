-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Bolha.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Bolha(V : in out Vetor);
