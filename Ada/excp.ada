-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Exceptions; use Ada.Text_IO;
procedure Exception_Handler IS
	I : Integer := 0;
begin
	I := 4 / I;
	Put_Line(Integer'Image(I)); 	
exception
	when Program_Error =>	
		Put_Line("PROGRAM_ERROR.");
	when The_Error : others =>
		Put(" FATAL ERROR: ");
		Put(Ada.Exceptions.Exception_Name(The_Error));
		Put_Line(".");
		raise;
end Exception_Handler;