-- (C) 1994-1996 Arthur Vargas Lopes

with Ada.Text_IO, Ada.Command_Line;
use  Ada.Text_IO, Ada.Command_Line;

procedure Test_Command_Line is
	package My_Int_IO is new Integer_IO(Integer); 
	use My_Int_IO;
begin
	Put("Command_Name   = ");
	Put_Line(Command_Name);
	Put("Argument_Count = ");
	Put(Argument_Count,1);
	New_Line;
	for I in 1 .. Argument_Count loop
		Put("Argument(");
		Put(I,1); 
		Put(")    = ");
		Put_Line(Argument(I));
	end loop;
	Set_Status(4);
end Test_Command_Line;