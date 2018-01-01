-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Numerics, Math; 
use Ada.Text_IO, Ada.Numerics, Math;
procedure OOP1 is
	type Object is tagged record
		X : Integer;
		Y : Integer;
		end record;
	type Circle is new Object with record
		R : Integer;
		end record;
	function Distance(O : Object) return Integer is
	begin
		return Integer(Sqrt(Float(O.X) ** 2.0 + Float(O.Y) ** 2.0));
	end Distance;
	function Area(O : Object) return Integer is
	begin
		return 0;
	end Area;
	function Area(C : Circle) return Integer is
	begin
		return Integer(Pi * Float(C.R) ** 2);
	end Area;
	O : Object := (1,5);
	C : Circle := (0,0,12);
begin
	Put_Line("Area = " & Integer'Image(Area(C)));
	Put("O.X = " & Integer'Image(O.X) & " O.Y = " & Integer'Image(O.Y));
	New_Line;
	O := Object(C);
	Put("O.X = " & Integer'Image(O.X) & " O.Y = " & Integer'Image(O.Y));
	New_Line;
end OOP1;