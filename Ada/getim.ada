-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Get_Immediate is -- Echo off
	C                   : Character;
	C_Has_One_Character : Boolean := False;
begin
	loop
		Get_Immediate(C,C_Has_One_Character);
		exit when C_Has_One_Character; -- Exit when one 
		                               -- character was retrieved
		Put_Line("Keyboard is idle");
	end loop;
	Put(C);
	Put_Line("...ok");
end Get_Immediate;