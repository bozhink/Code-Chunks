-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Insercao.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Insercao;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Insercao is

	type Vet is array(1..10) of Integer;

	-- Instanciamento para um vetor de 10 elementos com 
	-- tipo Integer
	procedure Sort_Insercao is new Insercao(Integer,Vet);

	Dados : Vet := (10,9,8,7,6,5,4,3,2,1);

	procedure Imprime_Vetor(Msg : String; V : Vet) is
	begin
		Put(Msg);
		for I in V'Range loop
			Put(V(I),1);
			if I /= V'Last then
				Put(',');
			end if;
		end loop;
		New_Line;
	end Imprime_Vetor;

begin
	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados);

	Sort_Insercao(Dados);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Insercao;
