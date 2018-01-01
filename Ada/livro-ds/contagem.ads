-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Contagem.Ads
generic
	type Vetor is array(Positive range <>) of Positive;

procedure Contagem(V : in out Vetor);
