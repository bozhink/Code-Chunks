-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;

procedure Factorial is
	function Fat(N : Integer) return Integer is
	begin
		if N <= 1 then
			return 1;
		else
			return N * Fat(N - 1);
		end if;
	exception
		when Constraint_Error =>
			Put(" *** ");
			return -1;
	end Fat;
begin
	for I in 2 .. 8 loop
		Put("O Fatorial de ");
		Put(Integer'Image(I));
		Put(" e' ");
		Put_Line(Integer'Image(Fat(I)));
	end loop;
end Factorial;