with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO; 
procedure Bases is
	Valores : array(1 .. 4) of Integer := (1, 20, 30_000, 40);
begin
	for I in 2 .. 16 loop
		Put("Base");
		Put(I,3);
		Put(Valores(1),6,I);
		Put(Valores(2),9,I);
		Put(Valores(3),19,I);
		Put(Valores(4),10,I);
		New_Line;
	end loop;
end;