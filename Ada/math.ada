-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO; 
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO; 

procedure Test_Math is -- Test built in math operations

	A , B , I : Integer;
 	X : Float :=  -123.4567;  --  digits 8      (see RM 3.5.7)

	procedure Power_Float(P, U : in Integer) is
	begin
		for I in P .. U loop
			Put("2 ** ");
			Put(I,4);
			Put(2.0 ** I,4,8,400);
			New_Line;
		end loop;
	exception
		when Constraint_Error =>
			Put_Line(" ************ Overflow *************");
	end Power_Float;

begin
	Put_Line("***** RM 4.5.5. Multiplying Operators: REM and MOD *****");
     	Put     ("   A    B  REM  MOD    A    B  REM  MOD");
	Put_Line("    A    B  REM  MOD    A    B  REM  MOD");
	for A in 10 .. 14 loop
		B := 5;
		Put(A,4);
		Put(B,5);
		Put((A rem B),5);
		Put((A mod B),5);
		Put(-A,5);
		Put(B,5);
		Put(((-A) rem B),5);
		Put(((-A) mod B),5);
		B := -5;
		Put(A,5);
		Put(B,5);
		Put((A rem B),5);
		Put((A mod B),5);
		B := -5;
		Put(-A,5);
		Put(B,5);
		Put(((-A) rem B),5);
		Put(((-A) mod B),5);
		New_Line;
	end loop;
	New_Line(2);
	Put_Line("***** Float formating (14.3.9) and POW (RM 4.4) *****");
	Put(X); -- default format             
	Put("=[-1.2345670e+02]");
	New_Line;
	Put(X, Fore => 5, Aft => 3, Exp => 2);    
	Put("=[bbb-1.235e+2]");
	New_Line;
	Put(X, 5, 3, 0);                          
	Put("=[b-123.457]");
	New_Line;
	Power_Float(7,10);
	Power_Float(60,65);
	Power_Float(300,305);
	Power_Float(1020,1026);
end Test_Math;