library liblin;

{$mode objfpc}{$H+}

function adder(x,y : Double): Double; cdecl;
begin
  adder:=x+y;;
end;

exports adder;

begin
end.

