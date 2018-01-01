-- Arquivo fonte Delay_2.Ada
with Ada.Text_IO, Ada.Calendar; 
use Ada.Text_IO, Ada.Calendar;
procedure Delay_2 is
	Evento_Marcado : Time;
begin
	Evento_Marcado := Clock +
	                  4.0;
	delay until Evento_Marcado;
	Put(ASCII.Bel);
end Delay_2;
