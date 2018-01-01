-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Block_Statement is
	X : Integer := 1;
begin
	Put_Line("X = " & Integer'Image(X));
	declare
		X : Integer := 9;  -- Force Constraint_Error
		Vector : constant String := "ABC";
	begin
		loop
			Put(Vector(X));
			X := X + 1;
			exit when X > Vector'Last;
		end loop;
		New_Line;
	exception
		when Constraint_Error =>
			Put("Hey!  X = " & Integer'Image(X));
			Put_Line(" Vector'Last = " & Integer'Image(Vector'Last));
		when others =>
			raise;
	end;
	Put_Line("X = " & Integer'Image(X));
end Block_Statement;