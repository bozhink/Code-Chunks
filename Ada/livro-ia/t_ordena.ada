-- Arquivo fonte TOrdena.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Ordena_Inteiros is

	type Vet_Int is array(Integer range <>) of Integer;

	V : Vet_Int(1 .. 10) := (10,9,8,7,6,5,4,3,2,1);

	procedure Swap(X, Y : in out Integer) is
		Temporario : Integer;
	begin
		Temporario := X;
		X := Y;
		Y := Temporario;
	end Swap;

	procedure Imprime_Vet_Int(Mensagem : String;
                                  Vet      : in Vet_Int) is
	begin
		Put(Mensagem);
		for I in V'Range loop
			Put(Vet(I), 3);
		end loop;
		New_Line;
	end Imprime_Vet_Int;

	procedure Ordena_Inteiros(Vet : in out Vet_Int) is 
		I, J : Integer;
	begin
	 	I := Vet'First;
		while I < Vet'Last loop
			J := I + 1;
			while J <= Vet'Last loop
				if Vet(I) > Vet(J) then
					Swap(Vet(I), Vet(J));
				end if;
				J := J + 1;
			end loop;
			I := I + 1;
		end loop;
	end Ordena_Inteiros;
begin
	Imprime_Vet_Int("V antes da ordenacao: ", V);
	Ordena_Inteiros(V);
	Imprime_Vet_Int("V depois da ordenacao:", V);
end Testa_Ordena_Inteiros;