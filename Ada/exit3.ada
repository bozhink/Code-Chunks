-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Exit_Statement3 is
	N : Integer;
begin
	for I in 1 .. 3 loop
		N := 0;
		loop
			Put_Line(Integer'Image(I) &  Integer'Image(N));
			exit when N = 1;
			N := N + 1;
		end loop;
	end loop;
end Exit_Statement3;