with Ada.Text_IO; -- Arquivo fonte OverLoad.Ada
procedure Overloading is

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

begin

	Put_Line("Vai saltar 2 linhas",3);

	Put_Line('.');
end Overloading;