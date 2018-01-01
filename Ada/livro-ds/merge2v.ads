-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Merge2V.Ads
with Ada.Direct_IO, Shell;
generic
	N : Integer;
	type Key is private;
	type Rec is private;
	type Data is private;
with function Compara(R1, R2 : Rec) return Boolean;
with procedure Faz_Rec(D : Data; I : Integer; R : out Rec);
with function Get_Tag(T : Rec) return Integer;
package Merge2V is

	M : Integer := N / 2; -- Comprimento do intervalo da
	                      -- área de ordenação 

	type Vetor is array(Integer range <>) of Rec; -- Área de ordenação 

	Registro  : Data;
	Registro2 : Data;

	procedure Shell_Sort is new Shell(Rec,Vetor,Compara);

	package Rec_IO is new Ada.Direct_IO(Rec);

	package Data_IO is new Ada.Direct_IO(Data);

	package Tag_IO is new Ada.Direct_IO(Integer);

	procedure Merge_Duas_Vias(A : String; A2 : String);

	A_In      : Data_IO.File_Type; -- Descritor do arquivo de entrada 
	A_Out     : Tag_IO.FIle_Type;  -- Descritor do arquivo de saída 


end Merge2V;