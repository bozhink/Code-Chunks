-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Test_Image is
	type Enums is (One,Two);
	I1 : Integer := 100;
	I2 : Integer := -100;
	I3 : constant Integer := 100;
	I4 : constant := -100;
	F1 : Float := 123.4;
	F2 : Float := -123.4;
	F3 : constant Float := 123.4;
	F4 : constant Float := -123.4;
	E1 : Enums := One;
	E2 : constant Enums := Two;
begin
	Put_Line("Integer'Image(I1) = " & Integer'Image(I1));
	Put_Line("Integer'Image(I2) = " & Integer'Image(I2));
	Put_Line("Integer'Image(I3) = " & Integer'Image(I3));
	Put_Line("Integer'Image(I4) = " & Integer'Image(I4));
	Put_Line("Float'Image(F1) = " & Float'Image(F1));
	Put_Line("Float'Image(F2) = " & Float'Image(F2));
	Put_Line("Float'Image(F3) = " & Float'Image(F3));
	Put_Line("Float'Image(F4) = " & Float'Image(F4));
	Put_Line("Enums'Float(E1) = " & Enums'Image(E1));
	Put_Line("Enums'Float(E2) = " & Enums'Image(E2));
end Test_Image;