-- Arquivo fonte Excepti4.Ada
with Ada.Text_IO, Ada.Exceptions; use Ada.Text_IO;
procedure Exception_4 IS
	I : Integer := 0;
begin
	I := 4 / I;
	Put_Line(Integer'Image(I)); 	
exception
	when Program_Error =>	
		Put_Line("Program_Error.");
	when O_Erro : others =>
		Put(" Erro Fatal: ");
		Put(Ada.Exceptions.Exception_Name(O_Erro));
		Put_Line(".");
		raise;
end Exception_4;