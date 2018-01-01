-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Calendar;
use  Ada.Text_IO;
procedure Case_Statement2 is
	Month : Natural := Ada.Calendar.Month(Ada.Calendar.Clock);
begin
	case Month is 
		when 6 | 7 | 8 => 
			Put_Line("It is summer. Enjoy your vacation!");
	end case;
end Case_Statement2;