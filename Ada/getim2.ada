-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Get_Immediate is -- Echo off
	C    : Character;
	Line : String(1..80);
	N    : Natural := 0;
begin
	Put_Line("Type up to 80 characters");
	Put_Line("Press the <Enter> key to stop the program=>");
	loop
		Get_Immediate(C); -- Wait for keyboard input
		exit when N = 80 or Character'Pos(C) = 13;
		N := N + 1;
		Line(N) := C;
	end loop;
	if N > 0 then
		Put_Line(Line(1..N));
	else
		Put_Line("<Enter> was typed first!");
	end if;
end Get_Immediate;
	
