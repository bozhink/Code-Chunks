-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO;
procedure Float_IO1 is
	Inches      : Float; -- see also Real types
	Centimeters : Float;
begin
	Put("Enter the measure in inches (example: 4.5): ");
	Ada.Float_Text_IO.Get(Inches);
	Centimeters := Inches * 2.54;
	Ada.Float_Text_IO.Put(Inches);
	Put(" inches = ");
	Ada.Float_Text_IO.Put(Centimeters);
	Put_Line(" centimeters.");
end Float_IO1;  