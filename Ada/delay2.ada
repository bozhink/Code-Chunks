-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Calendar;
use  Ada.Text_IO, Ada.Calendar;
procedure Delay_Until is
	WakeUp_Time : Time;
begin
	WakeUp_Time := Clock + 5.0;
	Put(Bel);
	delay until WakeUp_Time;
	Put(Bel);
end Delay_Until;
