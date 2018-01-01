-- Arquivo fonte Pesquisa.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Pesquisa_1 is
	subtype Chave_De_Pesquisa is String(1..2);
	type Tabela is array(Integer range <>) of Chave_De_Pesquisa;
	T   : Tabela(1..4);
	C   : Chave_De_Pesquisa;
	Pos : Integer;
	N   : Integer;
begin	
	T := ("RS", "SC", "PR", "SP"); 
	Put("Entre com a sigla de um Estado: ");
	Get_Line(C,N);
	Put_Line("Leu " & C(1..N));
	if N /= 2 then 
		Put_Line("Nome do estado deve ter dois caracteres: " 
			& C(1..N));
	else
		Pos := 0;
		for I in T'Range loop
			Put("Pesquisando a posicao");
			Put(Integer'Image(I));
			Put_Line(" = " & T(I));
			if T(I) = C then
				Pos := I;
				exit;
			end if;
		end loop;
		
		if Pos = 0 then
			Put_Line(C & " nao foi encontrado");
		else
			Put(C & " foi encontrado na posicao");
			Put_Line(Integer'Image(Pos));
		end if;
	end if;
end Pesquisa_1;