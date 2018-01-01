-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.FLoat_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.FLoat_Text_IO;
procedure Test_Scalars is
	Bool  : Boolean; -- Defined as type Boolean is (False,True);
	type Scalar is (Integer_Type,Real_Type,Enumeration_Type);
	package Scalar_IO is new Enumeration_IO(Scalar); use Scalar_IO;
	package Boolean_IO is new Enumeration_IO(Boolean); use Boolean_IO;
begin
	Put(Integer'First); 
	Put(' '); 
	Put(Integer'Last); 
	New_Line;
	Put(Long_Integer'First); 
	Put(' '); 
	Put(Long_Integer'Last); 
	New_Line;
	Put(Float'First,Exp=>306);
	Put(' ');
	Put(Float'Last,Exp=>306);
	New_Line;
	for Sc in Scalar'First .. Scalar'Last loop
		Put(Sc);
		Put(' ');
	end loop;
	New_Line;
	Bool := True;
	Put(Bool);
	Bool := Boolean'Pred(Bool);
	Put(' ');
	Put(Bool);
	Bool := Boolean'Succ(Bool);
	Put(' ');
	Put(Bool);
	New_Line;
	for C in  Character'Pos('a') .. Character'Pos('z') loop
		Put(Character'Val(C));
	end loop;
	New_Line;
end Test_Scalars;