-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Raise_Statement is
	Return_Main : exception;
	procedure Test_Raise(Do_Raise : Boolean) is
	begin
		if Do_Raise then
			Put_Line("Raise will execute.");
			raise Return_Main;
		end if;
		Put_Line("Raise did not execute.");
	end Test_Raise;
begin
	Test_Raise(True);
	Test_Raise(False);
end Raise_Statement;