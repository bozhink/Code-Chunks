-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAFila.Ada
with Ada.Text_IO, Fila_Char; use Ada.Text_IO, Fila_Char;
procedure Testa_TDA_Fila is

	Fila_1, Fila_2 : Fila;   		-- Declara duas Filas 
	Estava_No_Topo : Tipo_Da_Fila; 	-- Armazena quem estava
					  	-- no topo de uma Fila 
begin
	Queue(Fila_1,'A');
	Queue(Fila_1,'B');
	Queue(Fila_1,'C');
	Queue(Fila_1,'D');
	
	Queue(Fila_2,'A');

	for I in 1 .. Tamanho(Fila_1) loop	-- Exibe o conteúdo de Fila_1 
		DeQueue(Fila_1, Estava_No_Topo);
		Ada.Text_IO.Put_Line(Integer'Image(I) & ' ' &
 					  Estava_No_Topo);
	end loop;
	
	for I in 1 .. 4 loop -- Exibe o conteúdo de Fila_2 
		DeQueue(Fila_2, Estava_No_Topo);
		Ada.Text_IO.Put_Line(Integer'Image(I) & ' ' &
		                     Estava_No_Topo);
	end loop;
	
end Testa_TDA_Fila;
