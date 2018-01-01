-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Strings.Maps;
use  Ada.Text_IO, Ada.Strings.Maps;
procedure Test_Mappings is
	M : Character_Mapping;
	C : Character;
begin
	M := To_Mapping("ABCD","PQRS");
	C := Value(M,'D');
	Put_Line("D maps to " & C);
end;