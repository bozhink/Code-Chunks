-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GFilaC.Ada
with Ada.Text_IO, FilaC; use Ada.Text_IO;
procedure Testa_TDA_FilaC is

	package FC is new FilaC(Character);
	use FC;

	Fila_1, Fila_2 : Fila;   		-- Declara duas filas circulares
	Estava_No_Topo : Character; 	-- Armazena quem estava
					  	-- no topo de uma fila 
begin
	Queue(Fila_1,'A');
	Queue(Fila_1,'B');
	Queue(Fila_1,'C');
	Queue(Fila_1,'D');
	
	Queue(Fila_2,'A');

	for I in 1 .. Tamanho(Fila_1) loop -- Exibe o conte£do de Fila_1 
		DeQueue(Fila_1, Estava_No_Topo);
		Ada.Text_IO.Put_Line(Integer'Image(I) & ' ' &
 					  Estava_No_Topo);
	end loop;
	
	for I in 1 .. 4 loop -- Exibe o conte£do de Fila_2 
		DeQueue(Fila_2, Estava_No_Topo);
		Ada.Text_IO.Put_Line(Integer'Image(I) & ' ' &
		                     Estava_No_Topo);
	end loop;
	
end Testa_TDA_FilaC;
