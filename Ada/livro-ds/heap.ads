-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Heap.Ads        

generic 
	N : Integer;
	type Tipo_Dado is private;
	MValor : Tipo_Dado;
package Heap is

	type Vet_Heap is array(0 .. N) of Tipo_Dado;

	type Heap is record
		V : Vet_Heap;
		Q : Integer;
		end record;

	procedure Inicializa(H : in out Heap);
	procedure Insere(H : in out Heap; Va : Tipo_Dado);
	procedure Remove(H : in out Heap; R : out Tipo_Dado);
	procedure Imprime(H : Heap; Msg : String);
	procedure Put(Item  : Float; 
	              Width : Positive; 
	              Dec   : Natural := 2);

	Heap_Overflow  : exception;
	Heap_Underflow : exception;

end Heap;