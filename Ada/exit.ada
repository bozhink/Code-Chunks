-- (C) 1994-1996 Arthur Vargas Lopes

with Ada.Text_IO; use Ada.Text_IO;
procedure Exit_Stmt is
	I : Integer := 0;
	package My_Int_IO is new Integer_IO(Integer); 
	use My_Int_IO;
begin
	Put_Line("EXIT within IF.");
	loop
		I := I + 1;
		if I = 3 then
			Put(Item => I, Width => 10, Base => 2);
			New_Line;
			exit;
		end if;
	end loop;
	Put_Line("EXIT WHEN.");
	I := 0;
	loop
		I := I + 1;
		exit when I = 3;
	end loop;
	Put(Item => I, Width => 10, Base => 2);
	New_Line;
end Exit_Stmt;