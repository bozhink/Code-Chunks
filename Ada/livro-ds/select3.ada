-- (C) 1999 Arthur Vargas Lopes
-- Arquivo fonte select3.ada
pragma list(on);
with Ada.Text_IO; use Ada.Text_IO;
procedure Comando_Select is
	task type Server(Id : Character) is
		entry Action;
	end Server;

	S1 : Server('a');
	S2 : Server('b');

	task body Server is
	begin
		select
			accept Action do
				Put(Id);
			end Action;
		else
			Put_Line(Id & " nao fez accept");
		end select;
	end Server;

	task Client is
		entry Done;
	end Client;

	task body Client is
	begin
		select 
			S1.Action;
		else
			Put_Line("Client nao fez entry call S1.Action");
		end select;
		select 
			S2.Action;
		else
			Put_Line("Client nao fez entry call S2.Action");
		end select;
		accept Done;
	end Client;
begin
	Client.Done;
	New_Line;
	Put_Line("Main completou!");
end Comando_Select;