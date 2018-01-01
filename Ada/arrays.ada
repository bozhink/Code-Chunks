-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Arrays_1 is
	Vector : array(1..4) of integer := (2,3,4,5);
begin
	for Index in Vector'Range loop
		Put("Index ");
		Put(Index,3);
		Put(" Value");
		Put(Vector(Index),3);
		New_Line;
	end loop;
end Arrays_1;