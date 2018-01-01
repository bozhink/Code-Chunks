-- (C) 1994-1996 Arthur Vargas Lopes
with Factorial;
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
procedure Test_Generic_Factorial is
	J : Float := 4.0;
	--Three generic subprogram instantiations
	function Fat_LInt is new Factorial(Long_Integer); 
	function Fat_Int is new Factorial(Integer); 
	function Fat_Flt is new Factorial(Float);
begin
	for I in 4 .. 9 loop
		Put("Fat_LInt(");
		Put(I,1);
		Put(")  = ");
		Put(Fat_LInt(I),7);  
		New_Line;
	end loop;
	while J <= 9.0 loop
		Put("Fat_Flt(");
		Put(J,1,1);
		Put(") = ");
		Put(Fat_Flt(J),7,1,0);  
		New_Line;
		J := J + 1.0;
	end loop;
	for I in 4 .. 9 loop
		Put("Fat_Int(");
		Put(I,1);
		Put(")   = ");
		Put(Fat_Int(I),7);  
		New_Line;
	end loop;
end Test_Generic_Factorial;