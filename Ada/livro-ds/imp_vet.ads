-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Imp_Vet.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;
procedure Imp_Vet(Msg : String; V : Vetor);