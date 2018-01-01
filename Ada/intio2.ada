-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;
procedure Integer_IO2 is
begin
	for I in 2 .. 16 loop
		Put(Item => I, Width => 10, Base => I);
		New_Line;
	end loop;
end Integer_IO2; 