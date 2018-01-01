-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte MergeSor.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Merge_Sort, Imp_Vet;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Merge_Sort is

	type Vet is array(1..10) of Integer;

	-- Instanciamento para um vetor de 10 elementos com 
	-- tipo Integer
	procedure MergeS is new Merge_Sort(Integer,Vet);

	procedure Imprime_Vetor is new Imp_Vet(Integer,Vet);

	Dados : Vet := (10,9,8,7,6,5,4,3,2,1);

begin
	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados);

	MergeS(Dados,Dados'First,Dados'Last,Dados'Length);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Merge_Sort;