-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;
procedure Float_IO2 is
	Inches      : Float;
	Centimeters : Float;
begin
	Put("Enter the measure in inches (example: 4.5): ");
	Get(Inches);
	Centimeters := Inches * 2.54;
	Put(Inches,5,2,0);
	Put(" inches = ");
	Ada.Float_Text_IO.Put(Centimeters, Fore => 5,Aft => 2,Exp => 0);
	Put_Line(" centimeters.");
end Float_IO2;