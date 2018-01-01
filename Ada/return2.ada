-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Return_Statement2 is
	task T is
		entry Test_Return(Do_Return : Boolean);
	end T;
	task body T is
	begin
		accept Test_Return(Do_Return : Boolean) do
			if Do_Return then
				Put_Line("The return statement will be executed.");
				return;
			end if;
			Put_Line("The return statement was not executed.");
		end Test_Return;
		Put_Line("T will now terminate.");
	end T;
begin
	T.Test_Return(True);
end Return_Statement2;