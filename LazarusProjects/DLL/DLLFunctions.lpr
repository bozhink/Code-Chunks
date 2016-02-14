library DLLFunctions;

function AddNumbers(x, y : Double) : Double; cdecl;
begin
  AddNumbers := x + y;
end;

procedure Add(n : Integer; var a, b, c: array of Double); cdecl;
var
  I : Integer;
begin
  for I := 0 to n-1 do c[I]:=a[I]+b[I];
end;

procedure Swap(var x:Integer; var y:Integer);
var k : Integer;
begin
  k:=x;
  x:=y;
  y:=k;
end;
exports AddNumbers, Add, Swap;

begin
end.

