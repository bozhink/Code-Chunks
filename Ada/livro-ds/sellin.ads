-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SelLin.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Selecao_Linear(V : in out Vetor);
