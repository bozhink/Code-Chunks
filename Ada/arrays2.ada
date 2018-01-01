-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Arrays_2 is
	type One_Dimensional_Array is array(1..4) of integer;
	Vector  : One_Dimensional_Array := (2,3,4,5);
begin
	for Index in One_Dimensional_Array'Range loop
		Put("Index ");
		Put(Index,3);
		Put(" Value");
		Put(Vector(Index),3);
		New_Line;
	end loop;
end Arrays_2;