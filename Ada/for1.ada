-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure For_Statement is
	I : Integer := 3;
begin
	for I in 1 .. 4 loop
		for J in reverse 1 .. 4 loop
			Put("I = "); 
			Put(I,1);
			Put(" J = ");
			Put(J,1);
			New_Line;
		end loop;
	end loop;
	Put(I);
	New_Line;
end For_Statement;