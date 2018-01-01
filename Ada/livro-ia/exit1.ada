pragma List(On);
-- Arquivo fonte Exit1.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Exit_1 is
begin
	for I in 1 .. 5 loop
		for J in 1 .. 3 loop
			for K in 1 .. 2 loop
				Put("I = " & Integer'Image(I));
				Put(" J = " & Integer'Image(J));
				Put_Line(" K = " & Integer'Image(K));
				exit;
			end loop;
		end loop;
		exit when I = 2;
	end loop;
end Exit_1;