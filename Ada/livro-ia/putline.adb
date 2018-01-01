-- Arquivo fonte Put_Line.Adb
with Ada.Text_IO;
package body Novo_Put_Line is

	procedure Put_Line(Item    : Character; 
	                   Spacing : Positive := 1) is
	begin
		Ada.Text_IO.Put(Item);
		Ada.Text_IO.New_Line(Spacing);
	end Put_Line;

	procedure Put_Line(Item    : String; 
	                   Spacing : Positive := 1) is
	begin
		Ada.Text_IO.Put(Item);
		Ada.Text_IO.New_Line(Spacing);
	end Put_Line;

end Novo_Put_Line;