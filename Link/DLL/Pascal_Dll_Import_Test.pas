program Pascal_Dll_Import_Test;
{$APPTYPE CONSOLE}

function Add(a,b : Double):Double; external 'Example.dll' name 'AddNumbers';

var
  R:Double;

begin
  R:=Add(1,2);
  WriteLn('The result was: ', R);
end.
