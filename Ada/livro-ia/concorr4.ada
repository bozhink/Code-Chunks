-- Arquivo fonte Concorr4.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Tasks_Sincronas_1 is

	Maior_Esq, Maior_Dir : Integer;

	T : array(1..10) of Integer
		:= (-1, 2, 1, 6, 5, 4, 3, 20, -4, -5);

	task type Pesquisa is
		entry Inicia(Pri, Ult : Integer);
		entry Maior(Valor : out Integer);
	end Pesquisa;

	Esq, Dir : Pesquisa;

	task body Pesquisa is
		Primeiro : Integer;
		Ultimo   : Integer;
		Temp     : Integer;
	begin	
		accept Inicia(Pri, Ult : Integer) do
			Primeiro := Pri;
			Ultimo   := Ult;
		end Inicia;

		Temp := T(Primeiro);
		for I in Primeiro + 1 .. Ultimo loop
			if T(I) > Temp then
				Temp := T(I);
			end if;
		end loop;

		accept Maior(Valor : out Integer) do
			Valor := Temp;
		end Maior;
	end Pesquisa;
	
begin
	Esq.Inicia(1,5);
	Dir.Inicia(6,10);
	Dir.Maior(Maior_Dir);
	Esq.Maior(Maior_Esq);
	Put("O maior valor e':");	
	if Maior_Esq > Maior_Dir then
		Put(Integer'Image(Maior_Esq));
	else
		Put(Integer'Image(Maior_Dir));
	end if;
	New_Line;
end Tasks_Sincronas_1;