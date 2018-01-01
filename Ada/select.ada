-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Select_Statement is
	task type Server(Id : Character) is
		entry Action;
	end Server;
	S1 : Server('a');
	S2 : Server('b');
	task body Server is
	begin
		loop
			select
				accept Action do
					Put(Id);
				end Action;
			or
				terminate;
			end select;
		end loop;
	end Server;
	task Client is
		entry Done;
	end Client;
	task body Client is
	begin
		for I in 1 .. 10 loop
			S1.Action;
			S2.Action;
		end loop;
		accept Done;
	end Client;
begin
	Client.Done;
	New_Line;
	Put_Line("Main completing!");
end Select_Statement;