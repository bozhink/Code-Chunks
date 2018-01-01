-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.FLoat_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.FLoat_Text_IO;
procedure Test_Min_Max_Attribute is

	type Enums is (One, Two, Three);
	package My_Enum_IO is new Enumeration_IO(Enums);
	use My_Enum_IO;

	C1 : Character := 'A';
	C2 : Character := 'B';
	C3 : constant Character := 'A';
	C4 : constant Character := 'B';

	I1 : Integer := 1;
	I2 : Integer := 2;

	I3 : constant Integer := 1;
	I4 : constant Integer := 2;

	F1 : Float := 1.0;
	F2 : Float := 2.0;

	F3 : constant := 1.0;
	F4 : constant := 2.0;

	E1 : Enums := One;
	E2 : Enums := Two;
	E3 : constant Enums := One;
	E4 : constant Enums := Two;

begin
	Put_Line("Character'Min(C1,C2) = " & Character'Min(C1,C2));	
	Put_Line("Character'Min(C3,C4) = " & Character'Min(C3,C4));	
	Put("Integer'Min(I1,I2) = ");
	Put(Integer'Min(I1,I2));
	New_Line;
	Put("Integer'Min(I3,I4) = ");
	Put(Integer'Min(I3,I4));
	New_Line;
	Put("Float'Min(F1,F2) = ");
	Put(Float'Min(F1,F2),1,1);
	New_Line;
	Put("Float'Min(F3,F4) = ");
	Put(Float'Min(F3,F4),1,1);
	New_Line;
	Put_Line("Character'Max(C1,C2) = " & Character'Max(C1,C2));	
	Put_Line("Character'Max(C3,C4) = " & Character'Max(C3,C4));	
	Put("Integer'Max(I1,I2) = ");
	Put(Integer'Max(I1,I2));
	New_Line;
	Put("Integer'Max(I3,I4) = ");
	Put(Integer'Max(I3,I4));
	New_Line;
	Put("Float'Max(F1,F2) = ");
	Put(Float'Max(F1,F2),1,1);
	New_Line;
	Put("Float'Max(F3,F4) = ");
	Put(Float'Max(F3,F4),1,1);
	New_Line;
	Put("Enums'Min(E1,E2) = ");
	Put(Enums'Min(E1,E2));
	New_Line;
	Put("Enums'Max(E3,E4) = ");
	Put(Enums'Max(E3,E4));
	New_Line;
end Test_Min_Max_Attribute;