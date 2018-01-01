-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte QuickSor.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Quick_Sort(V : in out Vetor; Esq, Dir : Integer);
