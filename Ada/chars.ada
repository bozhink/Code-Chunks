-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; 
use Ada.Characters.Handling;
procedure String_Input_Output is
	Str    : String(1..60);
	Length : Integer;
begin
	Put("Enter a sentence =>");
	Get_Line(Str,Length);
	Put_Line(To_Upper(Str));
end String_Input_Output;