-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Exit_Statement1 is
	N : Integer := 0;
begin
	for I in 1 .. 3 loop
		loop
			Put_Line(Integer'Image(N));
			N := N + 1;
			exit;
		end loop;
	end loop;
end Exit_Statement1;