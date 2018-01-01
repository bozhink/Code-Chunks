-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure Codes is
begin
	for I in 0 .. 255 loop
		Put(I,3,10);
		Put(" ");
		if (I >= 7 and I <= 13) or (I >= 26 and I <= 27) then
			Put(" ");
		else
			Put(character'val(I));
		end if;
		Put("   ");
	end loop;
	New_Line;
end Codes;