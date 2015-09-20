{$APPTYPE CONSOLE}
program Example;

function AddNumbers(a,b:Double):Double; external 'lib.dll';

var r:Double;

begin
    r:=AddNumbers(1,2);
    Writeln('The result was: ',r);
end.
