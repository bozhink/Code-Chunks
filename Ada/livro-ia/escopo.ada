-- Arquivo fonte Escopo.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Demonstra_Escopo is
	A : Integer := 0;
	
	procedure Nivel_1_S is
	
		procedure Nivel_2_F is
			A : Integer := 1;
		begin
			Put_Line("Nivel_2_F, A = " &
			         Integer'Image(A));
		end Nivel_2_F;

		procedure Nivel_2_G is
			A : Integer := 2;
		begin
			Put_Line("Nivel_2_G, A = " &
			         Integer'Image(A));
		end Nivel_2_G;
		
		procedure Nivel_2_H is
		begin
			Put_Line("Nivel_2_H, A = " &
			         Integer'Image(A));
		end Nivel_2_H;
	begin
		Put_Line("Nivel_1_S, A = " &
		         Integer'Image(A));
		Nivel_2_F;
		Nivel_2_G;
		Nivel_2_H;
	end Nivel_1_S;		
begin
	Put_Line("Demonstra_Escopo, A = " &
	         Integer'Image(A));
	Nivel_1_S;
end Demonstra_Escopo;