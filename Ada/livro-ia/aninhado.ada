-- Arquivo fonte Aninhado.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Loops_Aninhados is
begin
	for I in 1 .. 5 loop
		for J in reverse 1 .. 10 loop
			Put('*');
		end loop;
		New_Line;
	end loop;
end Loops_Aninhados;		