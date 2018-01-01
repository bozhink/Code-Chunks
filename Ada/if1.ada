-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure If_Statement is
begin
	for A in 1 .. 3 loop
		for B in 1 .. 3 loop
			Put(A,2);
			Put(B,2);
			if A = 1 and B = 1 then
				Put_Line(" The relational operation " & 
						"A = 1 and B = 1 => True");
			elsif A = 2 and B = 2 then
				Put_Line(" The relational operation " & 
						"A = 2 and B = 2 => True");
			else
				Put_Line(" The relational operation " & 
				"Not((A = 1 or A = 2) and (B - A) = 0) => True");
			end if;
		end loop;
	end loop;
end If_Statement;