-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte MergeSor.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Merge_Sort(V : in out Vetor; Esq, Dir, N : Integer);
