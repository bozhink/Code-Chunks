-- Arquivo fonte select4.ada
-- (C) 1999 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Sem_Comando_Select is
	task type Server(Id : Character) is
		entry Action;
	end Server;

	S1 : Server('a');
	S2 : Server('b');

	task body Server is
	begin
		accept Action do
			Put(Id);
		end Action;
	end Server;

	task Client is
		entry Done;
	end Client;

	task body Client is
	begin
		S1.Action;
		S2.Action;
		accept Done;
	end Client;
begin
	Client.Done;
	New_Line;
	Put_Line("Main completou!");
end Sem_Comando_Select;