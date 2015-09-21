with Ada.Text_IO;
use Ada.Text_IO;

procedure CaseTest
is
 i : Integer;
begin

  i := 2;

  case i
  is
    when 0 => Put_Line("Zero"); Put_Line(Integer'Image(i));
    when 1 => Put_Line("One"); Put_Line(Integer'Image(i));
    when others => Put_Line("Other"); Put_Line(Integer'Image(i));
  end case;
end;

