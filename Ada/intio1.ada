-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO;
procedure Integer_IO1 is
	Side1, Side2 : Integer;
begin
	Put("Enter the length of side one: ");
	Ada.Integer_Text_IO.Get(Side1);
	Put("Enter the length of side two: ");
	Ada.Integer_Text_IO.Get(Side2);
	Put("The area is ");
	Ada.Integer_Text_IO.Put(Item => Side1 * Side2
	                      , Width => 8
	                      , Base => 2);
	New_Line;
end Integer_IO1;