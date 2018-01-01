-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAPilha.Ads
with Ada.Text_IO, Pilha_Char; use Ada.Text_IO, Pilha_Char;
procedure Testa_TDA_Pilha is

	Pilha_1, Pilha_2 : Pilha;   		-- Declara duas pilhas 
	Estava_No_Topo   : Tipo_Da_Pilha; 	-- Armazena quem estava
					  	-- no topo de uma pilha 
begin
	Inicializa(Pilha_1);
	Inicializa(Pilha_2);

	Push(Pilha_1,'A');
	Push(Pilha_1,'B');
	Push(Pilha_1,'C');
	Push(Pilha_1,'D');
	
	Push(Pilha_2,'A');

	-- Exibe o conteúdo de Pilha_1 
	for I in reverse Intervalo_Pilha'First .. Pilha_1.Sp loop
		Pop(Pilha_1, Estava_No_Topo);
		Ada.Text_IO.Put_Line(Integer'Image(I) & ' ' &
		                     Estava_No_Topo);
	end loop;
	
	for I in reverse 1 .. 4 loop -- Exibe o conteúdo de Pilha_2 
		Pop(Pilha_2, Estava_No_Topo);
		Ada.Text_IO.Put_Line(Integer'Image(I) & ' ' &
		                     Estava_No_Topo);
	end loop;
	
end Testa_TDA_Pilha;