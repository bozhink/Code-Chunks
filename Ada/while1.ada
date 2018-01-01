-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure While_Statement is
	I : Integer := 1;
	J : Integer;
begin
	while I < 5 loop
		J := 4;
		while J > 0 loop
			Put("I = "); 
			Put(I,1);
			Put(" J = ");
			Put(J,1);
			New_Line;
			J := J - 1;
		end loop;
		I := I + 1;
	end loop;
	Put(I);
	New_Line;
end While_Statement;