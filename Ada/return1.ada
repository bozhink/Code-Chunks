-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Return_Statement is
	procedure Test_Return(Do_Return : Boolean) is
	begin
		if Do_Return then
			Put_Line("The return statement will be executed.");
			return;
		end if;
		Put_Line("The return statement was not executed.");
	end Test_Return;
begin
	Test_Return(True);
	Test_Return(False);
end Return_Statement;