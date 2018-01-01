-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Insercao.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Insercao(V : in out Vetor);
