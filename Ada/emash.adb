with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure emash is
  eps : Float := 1.0;
  one : Float := 1.0;
begin
  while (one+eps)>one loop
    eps := eps/2.0;
  end loop;
  New_Line(1);
  Put(eps, Fore=>1, Aft=> 8, Exp=>3);
  New_Line(2);
end emash;