with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Records is
	type Fraction is record
		Numerator   : Integer;
		Denominator : Integer;
		end record;
	F_Value : Fraction := (2, 3);
begin
	Put(F_Value.Numerator,1);
	Put('/');
	Put(F_Value.Denominator,1);
	New_Line;
end Records;