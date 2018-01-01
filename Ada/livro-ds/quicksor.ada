-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte QuickSor.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Quick_Sort, Imp_Vet;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Quick_Sort is

	type Vet is array(1..10) of Integer;

	-- Instanciamento para um vetor de 10 elementos com 
	-- tipo Integer
	procedure QuickS is new Quick_Sort(Integer,Vet,1);

	procedure Imprime_Vetor is new Imp_Vet(Integer,Vet);

	Dados : Vet := (10,9,8,7,6,5,4,3,2,1);

begin
	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados);

	QuickS(Dados,Dados'First,Dados'Last);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Quick_Sort;