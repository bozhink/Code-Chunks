-- (C) 1994-1996 Arthur Vargas Lopes
pragma List(On);
with Ada.Text_IO;
procedure String_Input_2 is
	Line   : String(1..128);
	Length : Natural;
begin
	Ada.Text_IO.Get_Line(Line,Length);
	Ada.Text_IO.Put_Line('[' & Line(1..Length) & "]");
end String_Input_2;