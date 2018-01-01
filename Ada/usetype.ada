-- (C) 1994-1996 Arthur Vargas Lopes
package Show_Use_Type is
	type Fraction is record
		Numerator     : Integer;
		Denominator : Integer := 1;
		end Record;
	function "+"(Op1, Op2 : Fraction) return Fraction;
	function MakeFraction(Op1, Op2 : Integer) return Fraction;
end Show_Use_Type;

package body Show_Use_Type is
	function "+"(Op1, Op2 : Fraction) return Fraction is
		Result : Fraction;
	begin
		Result.Denominator := Op1.Denominator * Op2.Denominator;
		Result.Numerator := Op1.Numerator * Op2.Denominator +
		                                   Op2.Numerator * Op1.Denominator;
		return Result;
	end "+";

	function MakeFraction(Op1, Op2 : Integer) return Fraction is
		Result : Fraction;
	begin
		Result.Numerator := Op1;
		Result.Denominator := Op2;
		return Result;
	end MakeFraction;
end Show_Use_Type;

with Ada.Text_IO, Show_Use_Type; use Ada.Text_IO;
use type Show_Use_Type.Fraction;
procedure Test_Use_Type is
	One_Fraction : Fraction;
begin
	One_Fraction := MakeFraction(3,5);
	One_Fraction := One_Fraction + One_Fraction;
	Put(Integer'Image(One_Fraction.Numerator));
	Put('/');
	Put_Line(Integer'Image(One_Fraction.Denominator));
end Test_Use_Type;