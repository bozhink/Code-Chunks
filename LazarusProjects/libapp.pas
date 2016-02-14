{$APPTYPE CONSOLE}
program libapp;

function AddNumbers(a,b : Double):Double; external 'lib.dll';

var
  R:Double;
  
begin
  R:=AddNumbers(1,2);
  WriteLn('The result was: ', R);
end.
