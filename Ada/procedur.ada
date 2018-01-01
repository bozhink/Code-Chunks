-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO; 
use  Ada.Text_IO, Ada.Integer_Text_IO; 
procedure Sort_Three_Integers is
	N1, N2, N3 : Integer;
	procedure Sort_Three(N1, N2, N3 : in out Integer) is
		Temp1, Temp2 : Integer;
	begin
		Temp1 := Integer'Min(N1,Integer'Min(N2,N3));
		Temp2 := Integer'Max(N1,Integer'Max(N2,N3));
		N2 := N1 + N2 + N3 - Temp1 - Temp2;
		N1 := Temp1;
		N3 := Temp2;
	end Sort_Three;
begin	-- Test procedure Sort_Three
	for I in reverse 1 .. 3 loop
		for J in reverse 1 .. 3 loop
			for K in reverse 1 .. 3 loop
				N1 := I;
				N2 := J;
				N3 := K;
				Put(N1,Width=>6); Put(N2,3); Put(N3,3);
				Put(" =>");
				Sort_Three(N1,N2,N3);
				Put("  ");
				Put(N1,2); Put(N2,3); Put(N3,3);
			end loop;		
			New_Line;
		end loop;
	end loop;
end Sort_Three_Integers;