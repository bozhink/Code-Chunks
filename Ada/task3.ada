-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Third_Tasking_Example is

	subtype How_Many is Integer range 1 .. 10;

	task type Output is
		entry Pass_Id(Id : in Character);
	end Output;

	Output1, Output2 : Output;

	task body Output is
		My_Id : Character;
	begin
		accept Pass_Id(Id : in Character) do
			My_Id := Id;
		end Pass_Id;
		for I in How_Many loop
			Put(My_Id); Put(My_Id);
		end loop;
		Put_Line(My_Id & " will now terminate");
	end Output;

begin
	Output1.Pass_Id('1');
	Output2.Pass_Id('2');
	for I in How_Many loop
		Put('M'); Put('M');
	end loop;
	Put_Line("Main will now terminate");
end Third_Tasking_Example;