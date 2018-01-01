-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Raise_Statement_With_Handler is
	Return_Main : exception;
	procedure Test_Raise(Do_Raise : Boolean) is
	begin
		if Do_Raise then
			Put_Line("Raise will execute.");
			raise Return_Main;
		end if;
		Put_Line("Raise did not execute.");
	exception
		when Return_Main => 
			Put_Line("Return_Main handled.");
		when others =>
			raise Program_Error;
	end Test_Raise;
begin
	Test_Raise(True);
	Test_Raise(False);
end Raise_Statement_With_Handler;