-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Accept_Statement is
	task T is
		entry Hand_Shake;
	end T;
	task body T is
	begin	
		Put_Line(" T is running.");
		accept Hand_Shake; -- T wants to synchronize with Main (passive)
		Put_Line(" T will terminate.");
	end T;
begin
	Put_Line(" Main is running.");
	T.Hand_Shake; -- Main wants to synchronize with T (active)
	Put_Line(" Main will terminate.");
end Accept_Statement;