-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Shell.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Shell;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Shell is

	type Vet is array(1..10) of Integer;
	
	function Compara(K1, K2 : Integer) return Boolean is
	begin
		return K1 > K2;
	end Compara;

	-- Instanciamento para um vetor de 10 elementos com 
	-- tipo Integer
	procedure Sort_Shell is new Shell(Integer,Vet,Compara);

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

	Sort_Shell(Dados);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

end Testa_Shell;
