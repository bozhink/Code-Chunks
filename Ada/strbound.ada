-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Strings.Bounded;
use Ada.Text_IO;
procedure Test_Strings_Bounded is
	Length : constant := 5;
	package Bounded_Strings is new
		Ada.Strings.Bounded.Generic_Bounded_Length(Max => Length);

	subtype Bounded_String is Bounded_Strings.Bounded_String;  

	Str : Bounded_String := Bounded_Strings.To_Bounded_String("ABCDE");

begin
	Put_Line(Bounded_Strings.To_String(Str));
end;