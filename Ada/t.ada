with Text_IO, Ada.Integer_Text_IO; use Text_IO, Ada.Integer_Text_IO;
procedure h is
	I : Integer;
begin
	Put_Line("Enter value for N: ");
<<Label>>
	Put("--> "); Get(I);
	if I>2 then
	  goto Label;
	end if;
end h;