-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Test_Value is
	type Enums is (One,Two,Three);
	package Enums_IO is new Enumeration_IO(Enums); use Enums_IO;
	I1 : String := " 1234 ";
	I2 : constant String := " 1234 ";
	F1 : constant String := " 1.123 ";
	F2 : String := " 1.123 ";
	E1 : constant String := " ONE ";
	E2 : String := " TWO ";
begin
	Put("Integer'Value(I1) = " );
	Put(Integer'Value(I1),4);
	New_Line;
	Put("Integer'Value(I2) = " );
	Put(Integer'Value(I2),4);
	New_Line;
	Put("Float'Value(F1) = " );
	Put(Float'Value(F1),1,3,0);
	New_Line;
	Put("Float'Value(F2) = " );
	Put(Float'Value(F2),1,3,0);
	New_Line;
	Put("Float'Value(I2) = " );
	Put(Float'Value(I2),1,3,0);
	New_Line;
	Put("Enums'Value(E1) = " );
	Put(Enums'Value(E1));
	New_Line;
	Put("Enums'Value(E2) = " );
	Put(Enums'Value(E2));
	New_Line;
end Test_Value;