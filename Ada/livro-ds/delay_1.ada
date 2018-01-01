-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Delay_1.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Delay_1 is
begin
	for I in 1 .. 26 loop
		Put(Character'Val(I + 64));
		delay 0.5; -- Espera meio segundo
	end loop;
end Delay_1;