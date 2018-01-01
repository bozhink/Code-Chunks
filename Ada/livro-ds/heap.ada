-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Heap.Ada

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Exceptions, Heap;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Heap is

	package Heap_Int is new Heap(12,Integer,99);
	use Heap_Int;

	H1          : Heap;
	Maior_Valor : Integer;
begin
	Inicializa(H1);
	Insere(H1,40);
	Insere(H1,12);
	Insere(H1,35);
	Insere(H1,15);
	Insere(H1,2);
	Insere(H1,20);
	Insere(H1,17);
	Insere(H1,19);
	Insere(H1,8);
	Imprime(H1,"Heap apos a insercao de 40,12,35,2,20,17,8,19,15:");
	Put("Remove(H1) = ");
	Remove(H1,Maior_Valor);
	Put(Maior_Valor,1);
	New_Line;
	Imprime(H1,"Heap apos remocao do maior elemento:");
exception
	when Que_Erro : others =>
		Put("ERRO: ");
			Put(Ada.Exceptions.Exception_Name(Que_Erro));
		Put_Line(".");
		
end Testa_Heap;