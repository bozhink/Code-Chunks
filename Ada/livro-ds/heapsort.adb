-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte HeapSort.Adb
with Heap;
procedure Heap_Sort(V : in out Vetor) is

	package Heap_Int is new Heap(Vetor'Length,Key,Key'Last);
	use Heap_Int;

	H1 : Heap;
	X  : Key;
begin
	Inicializa(H1);
	for I in V'Range loop
		Insere(H1,V(I));
	end loop;

	for I in V'Range loop
		Remove(H1,X);
		V(V'Last - I + 1) := X;
	end loop;

end Heap_Sort;