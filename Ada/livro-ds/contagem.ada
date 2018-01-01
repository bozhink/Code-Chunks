-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Contagem.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Contagem, Imp_Vet;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Contagem is

	type Vet is array(1..10) of Positive;

	-- Instanciamento para um vetor de 10 elementos com 
	-- tipo Positive
	procedure ContagemS is new Contagem(Vet);

	procedure Imprime_Vetor is new Imp_Vet(Integer,Vet);

	Dados : Vet := (10,9,8,7,6,5,4,3,2,1);

begin
	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados);

	ContagemS(Dados);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Contagem;