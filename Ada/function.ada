-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use  Ada.Text_IO;
procedure Max_From_Three_Integers is
	function Max(N1, N2, N3 : in Integer) return Integer is
		Result : Integer;
	begin
		if N1 > N2 then
			Result := N1;
		else
			Result := N2;
		end if;
		if N3 > Result then
			Result := N3;
		end if;
		return Result;
	end Max;
begin
	Put_Line(Integer'Image(Max(2,3,4)));
end Max_From_Three_Integers;