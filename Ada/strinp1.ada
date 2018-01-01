-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO;
procedure String_Input_1 is
	Name : String(1..5);
begin
	Ada.Text_IO.Get(Name);
	Ada.Text_IO.Put_Line('[' & Name & "]");
end String_Input_1;