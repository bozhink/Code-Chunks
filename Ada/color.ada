-- Source Color.Ada, (C) 1997, Arthur Vargas Lopes
with Ada.Text_IO, Dos.Screen, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Dos.Screen;
procedure Demo_Screen_Package is
	subtype Cols is Integer range 0 .. 75;
	package Random_N is new Ada.Numerics.Discrete_Random(Cols);
	use Random_N;

	task type Move(What : Character) is
		entry Done;
	end Move;

	A : Move('+');
	B : Move('*');
	C : Move('=');
	
	task body Move is
		G : Generator;
		C : Cols;
		R : Integer;
	begin
		Reset(G);

		for I in 1 .. 1000 loop
			C := Random(G);
			R := Random(G) mod 22 + 1;
			Put_Att(What,C,R,C);
			Put_Att(What,C+2,R,C);
			Put_Att(What,C+1,R,C);
			Put_Att(What,C+1,R+1,C);
			Put_Att(What,C+2,R+1,C);
			Put_Att(What,C,R+1,C);
--			delay 0.01;
			Put_Att(' ',C,R,0);
			Put_Att(What,C+1,R,0);
			Put_Att(What,C+2,R,0);
			Put_Att(What,C+1,R+1,0);
			Put_Att(What,C+2,R+1,0);
			Put_Att(What,C,R+1,0);
		end loop;
		accept Done;
	end Move;			
			
begin
	Set_Cursor_Off; -- Disable cursor
	Cls; -- Clear the screen
	A.Done;
	B.Done;
	C.Done;
	Cls; -- Clear the screen
	for Attribute in 1 .. 55 loop
		for I in 0 .. 24 loop
			Put_Att('*',I+15,I,Attribute);
			Put_Att('*',63-I,I,Attribute);
		end loop;
	end loop;
	Set_Cursor_On; -- Enable cursor
	Cls; -- Clear the screen
end Demo_Screen_Package;