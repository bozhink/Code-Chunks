-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO;
use Ada.Text_IO;
procedure Test_Constant_String is
	Str : constant String := "Testing Constant String";
begin
	Put('[');
	for I in Str'Range loop
		Put(Str(I));
	end loop;
	Put_Line("]");
end;