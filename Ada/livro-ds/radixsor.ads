-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte RadixSor.Ads
generic
	Digitos : Integer;
	type Vetor is array(Positive range <>) of Positive;

procedure Radix_Sort(V : in out Vetor);
