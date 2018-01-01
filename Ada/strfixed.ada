-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Strings.Fixed; 
use Ada.Text_IO, Ada.Strings.Fixed;

procedure Test_Strings_Fixed is
	Source  : String(1..10) := 10 * '-';
	Target  : String(1..10);
	Target2 : String(1..12);
begin
	Put_Line("The position of ""bcd"" within ""abcde"" is " &
	         Integer'image(Index("abcde","bcd")));
	Put_Line("""*""(3,""ABC"") = [" & 3 * "ABC" & ']');
	Put("""*""(10,'+') = [");
	Put(10 * '+');
	Put_Line("]");
	Move(Source,Target);
	Put_line('[' & Target & ']');
	Move(Source,Target2);
	Put_line('[' & Target2 & ']');
	Move(Source,Target2,Strings.Error,Justify => Strings.Right,Pad => '+');
	Put_line('[' & Target2 & ']');
	Move(Source,Target2,Strings.Error,Justify => Strings.Center,Pad => '*');
	Put_line('[' & Target2 & ']');
end;