-- Arquivo fonte Use_Type.Ada
with Ada.Text_IO, Ada.Float_Text_IO, Matrizes;
use  Ada.Text_IO, Ada.Float_Text_IO;
use type Matrizes.Matriz;
procedure Use_Type is
	Mat_1 : Matriz(1..2,1..3);
begin
	Matrizes.Le_Matriz(Mat_1);
	Put("A soma da linha 2 e': ");
	Put(Soma(Mat_1,2),3,2,0);
	New_Line;
	Put("A soma da matriz e': ");
	Put(Soma(Mat_1),3,2,0);
	New_Line;
end Use_Type;