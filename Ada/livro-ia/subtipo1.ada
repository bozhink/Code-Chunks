pragma List(On);
-- Arquivo fonte SubTipo1.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
procedure Sub_Tipo_1 is

	subtype Quatro_Por_4 is Integer range 1 .. 4;
	M : array(Quatro_Por_4, Quatro_Por_4) of Integer;

begin

	-- Inicializa a matriz com zeros
	M := (others => (others => 0));

	-- Armazena 1 na diagonal de M
	for I in Quatro_Por_4 loop
		M(I,I) := 1;
	end loop;

	-- Imprime o conteúdo de M
	for I in Quatro_Por_4 loop
		for J in Quatro_Por_4 loop
			Ada.Integer_Text_IO.Put(M(I,J),3);
		end loop;
		Ada.Text_IO.New_Line;
	end loop;

	-- Tente acessar um elemento de M utilizando um índice 
	-- inválido
	M(M'First,M'First - 1) := 2;

end Sub_Tipo_1;