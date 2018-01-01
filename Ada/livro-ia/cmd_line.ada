-- Arquivo fonte Cmd_Line.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Command_Line;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Command_Line;
procedure Mostra_Command_Line is
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
end Mostra_Command_Line;