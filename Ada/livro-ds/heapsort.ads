-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte HeapSort.Ads
generic
	type Key is private;
	type Vetor is array(Integer range <>) of Key;

procedure Heap_Sort(V : in out Vetor);
