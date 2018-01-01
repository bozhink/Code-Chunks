-- Arquivo fonte Sorteia.Ada
with Ada.Text_IO, Cara_Coroa;
procedure Sorteia_Moeda is
	Qual_Face : Cara_Coroa.Faces_Da_Moeda;
begin
	Qual_Face := Cara_Coroa.Atira_Moeda;
	Ada.Text_IO.Put("A face sorteada foi ");
	Cara_Coroa.Put(Qual_Face, 
	               Set => Ada.Text_IO.Lower_Case);
	Ada.Text_IO.New_Line;
end Sorteia_Moeda;