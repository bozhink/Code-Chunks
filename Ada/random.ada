-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;
with Ada.Numerics.Discrete_Random;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;
procedure Test_Float_Random is
	G     : Generator;
	S     : State;
	procedure Discrete is
		type Event is (Wait, Run, Jump);
		package Random_Event is new Ada.Numerics.Discrete_Random(Event);
		use Random_Event;
		package Enum_IO is new Enumeration_IO(Event);
		use Enum_IO;
		G : Generator;
	begin
		Reset(G);
		for I in 1 .. 14 loop
			Put(Random(G)); 
			Put(' ');
		end loop;
		New_LIne;
	end Discrete;

begin
	Reset(G);
	for I in 1 .. 10 loop
		Save(G,S);
		Put("Random of " & Image(S) & " is ");
		Put(Random(G),1,5);
		New_Line;
	end loop;
	Discrete;
end Test_Float_Random;