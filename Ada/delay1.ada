-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Just_Delay is
begin
	Put(Bel);
	delay 3.0;
	Put(Bel);
end Just_Delay;