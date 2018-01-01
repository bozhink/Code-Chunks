-- Arquivo fonte Pesquis3.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Pesquisa_3 is
	subtype Chave_De_Pesquisa is String(1..2);
	type Tabela is array(Integer range <>) 
		of Chave_De_Pesquisa;
	T   : Tabela(1..4);
	C   : Chave_De_Pesquisa;
	Pos : Integer;
	N   : Integer;

	function Pesquisa(Chave : Chave_De_Pesquisa) 
			return Integer is
	begin
		for I in T'Range loop
			if T(I) = C then
				return I;
			end if;
		end loop;
		return 0; -- A pesquisa não teve sucesso!
	end Pesquisa;
begin	
	T := ("RS", "SC", "PR", "SP"); 
	Put("Entre com a sigla de um Estado: ");
	Get_Line(C,N); 

	if N /= 2 then 
		Put_Line("Nome do estado deve ter dois caracteres: " 
			& C(1..N));
	else
		Pos := Pesquisa(C);
		
		if Pos = 0 then
			Put_Line(C & " nao foi encontrado");
		else
			Put(C & " foi encontrado na posicao");
			Put_Line(Integer'Image(Pos));
		end if;
	end if;
end Pesquisa_3;