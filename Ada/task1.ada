-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure First_Tasking_Example is

	subtype How_Many is Integer range 1 .. 20;

	task Output_Plus;

	task body Output_Plus is
	begin
		for I in How_Many loop
			Put('+');
		end loop;
		Put_Line("Output_Plus will now terminate");
	end Output_Plus;

begin
	for I in How_Many loop
		Put('-');
	end loop;
	Put_Line("Main will now terminate");
end First_Tasking_Example;