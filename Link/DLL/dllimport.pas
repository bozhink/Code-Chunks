{Using DLL imports}

{$APPTYPE CONSOLE}

program DllImport;

function AddNumbers(a,b : Double) : Double; cdecl; external 'Example.dll';

var R: Double;

begin
   R:=AddNumbers(1,2);
   Writeln('The result was: ',R);
end.
