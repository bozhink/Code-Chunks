-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Shell.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;
with function Compara(K1, K2 : Key) return Boolean;
procedure Shell(V : in out Vetor);
