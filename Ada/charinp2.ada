-- (C) 1994-1996 Arthur Vargas Lopes
with Text_IO; use Text_IO;
procedure Character_Input_2 is
	Char : Character;
begin
	Get_Immediate(Char);
	Put_Line(Integer'Image(Character'Pos(Char)) & 
	         " was the keyboard key pressed.");
end Character_Input_2;                  
