program DLLUser;

function AddNumbers (a : Double; b : Double) : Double; cdecl; external 'DLLFunctions.dll';

procedure Add(const n : Integer;
  var a, b, c : array of Double); cdecl; external 'DLLFunctions.dll';

procedure Swap(var x:Integer; var y:Integer); external 'DLLFunctions.dll';

const
  N = 3;
var
  R, s, t : Double;
  A, B, C : array [1..N] of Double;
  I, J : Integer;

begin
  for I:=1 to N do begin
    A[I]:=I;
    B[I]:=2.0*I*I/8.0;
    C[I]:=0.0;
  end;
  s:=1; t:=2;
  R := AddNumbers(s, t);
  Write('AddNumbers:',s:2:1,'+',t:2:1,'=');
  WriteLn(R:2:3);
  Add(N, A, B, C);
  for I:=1 to N do begin
    Write(A[I]:3:3,'+',B[I]:3:4,'=');
    WriteLn(C[I]:3:5);
  end;
  WriteLn();

  for I:=1 to N do begin
    C[I] := A[I] + B[I];
    Write(A[I]:3:3,'+',B[I]:3:4,'=');
    WriteLn(C[I]:3:5);
  end;
  I := 1;
  J := 2;
  WriteLn('Swap: I = ',I,' J = ',J);
  Swap(I,J);
  WriteLn('Swap: I = ',I,' J = ',J);
end.

