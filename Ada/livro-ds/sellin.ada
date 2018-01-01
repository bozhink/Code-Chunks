-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SelLin.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Selecao_Linear;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Selecao_Linear is

	type Vet is array(1..10) of Integer;

	-- Instanciamento para um vetor de 10 elementos com tipo Integer
	procedure Sort_Selecao_Linear
		is new Selecao_Linear(Integer,Vet);

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

	Sort_Selecao_Linear(Dados);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Selecao_Linear;