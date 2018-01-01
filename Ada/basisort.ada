-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO, Basic_Sorting;
use Ada.Text_IO, Ada.Integer_Text_IO, Basic_Sorting;

procedure Test_Basic_Sorting is
	V1 : Vector(1..11) := (5, 4, 3, 2, 1, 0 , -1, -2, -3, -4, -5);
	V2 : Vector(1..11) := (5, 4, 3, 2, 1, 0 , -1, -2, -3, -4, -5);
	procedure Imp(V : Vector) is
	begin
		for I in V'Range loop
			Put(V(I),3);
		end loop;
		New_Line;
	end Imp;
		
begin
	Selection_Sort(V1);
	Put("V1 after Selection sort: ");
	Imp(V1);
	Shell_Sort(V2);
	Put("V2 after Shell sort:     ");
	Imp(V2);
end Test_Basic_Sorting;