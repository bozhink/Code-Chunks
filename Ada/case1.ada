-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Calendar;
use  Ada.Text_IO;
procedure Case_Statement is
	Month : Natural := Ada.Calendar.Month(Ada.Calendar.Clock);
begin
	case Month is -- Translates months to Portuguese
		when  1 => Put_Line("Janeiro");
		when  2 => Put_Line("Fevereiro");
		when  3 => Put_Line("Marco");
		when  4 => Put_Line("Abril");
		when  5 => Put_Line("Maio");
		when  6 => Put_Line("Junho");
		when  7 => Put_Line("Julho");
		when  8 => Put_Line("Agosto");
		when  9 => Put_Line("Setembro");
		when 10 => Put_Line("Outubro");
		when 11 => Put_Line("Novembro");
		when others
			 => Put_Line("Dezembro");
	end case;
end Case_Statement;