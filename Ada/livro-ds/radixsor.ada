-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte RadixSor.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Radix_Sort, Imp_Vet;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Radix_Sort is

	type Vet is array(1..10) of Positive;

	-- Instanciamento para um vetor de 10 elementos com 
	-- tipo Positive e chave de dois dígitos
	procedure RadixS is new Radix_Sort(Digitos=>2,Vet);

	procedure Imprime_Vetor is new Imp_Vet(Integer,Vet);

	Dados : Vet := (10,9,8,7,6,5,4,3,2,1);

begin
	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados);

	RadixS(Dados);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Radix_Sort;