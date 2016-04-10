with Ada.Text_IO, Ada.Float_IO;
use Ada.Text_IO, Ada.Float_IO;
with AdaCall; use AdaCall;

procedure AdaCallC
is
var x,y,z : Float;
begin
  Get(x);
  Get(y);
  z:=fc(x,y);
  Put_Line(z);
end AdaCallC;
