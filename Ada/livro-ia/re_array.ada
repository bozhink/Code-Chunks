-- Arquivo fonte Re_Array.Ada
with Ada.Text_IO;
procedure Requer_Array is
	A : Integer := 2;
	B : Integer := 1;
	C : Integer := 7;
	D : Integer := 6;
begin
	A := A + 1;
	B := B + 1;
	C := C + 1;
	D := D + 1;
	Ada.Text_IO.Put_Line("O valor de A e':" & 
		Integer'Image(A));
	Ada.Text_IO.Put_Line("O valor de B e':" & 
		Integer'Image(B));
	Ada.Text_IO.Put_Line("O valor de C e':" & 
		Integer'Image(C));
	Ada.Text_IO.Put_Line("O valor de D e':" & 
		Integer'Image(D));
end Requer_Array;