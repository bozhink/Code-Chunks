-- (C) 1994-1996 Arthur Vargas Lopes
pragma List(On);
with Ada.Text_IO;
use Ada.Text_IO;
procedure Character_Input_1 is
	Char_1 : Character;
	Char_2 : Character;
begin
	Put("Type two characters and then press <enter> : ");
	Get(Char_1);
	Get(Char_2);
	New_Line;
	Put_Line(Char_1 & 
	         Char_2 & 
	         " were read by procedure Get from Ada.Text_IO");
end Character_Input_1;                    