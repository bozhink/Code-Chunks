-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Calendar; 
use Ada.Text_IO;
procedure Entry_Call_Statement is
	subtype Activity is Integer range 1 .. 30;
	task type T is
		entry Start(N : Character; D : Duration);
		entry Stop;
	end T;
	A, B : T; -- Four tasks objects with type T
	task body T is
		Id   : Character;
		Wait : Duration;
	begin	
		accept Start(N : Character; D : Duration) do -- Accept with a body
			Id   := N;
			Wait := D;
		end Start;
		for I in Activity'Range loop
			Put(Id);	
			delay Wait;		
		end loop;
		New_Line;
		accept Stop; -- simplest accept statement
	end T;
begin
	A.Start('A',0.25);
	B.Start('B',0.5);
	A.Stop; -- Simplest entry call
	B.Stop;
end Entry_Call_Statement;