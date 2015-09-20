type TOneArgCcall = procedure (var X: Integer); cdecl;
var
    proc : TOneArgCcall;
procedure printit(var X:Integer);
begin
    WriteLn (x);
end;

begin
proc:=@printit;
end.