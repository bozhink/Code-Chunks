program PascalProgram;
var
   M, N : Integer;
   
   procedure Change(var M, N : Integer);
   var Buf : Integer;
   begin
      Buf := M; M:=N; N:=Buf;
   end;

begin
   M:=7;
   N:=
      2 * 7;
   WriteLn(M,N);
   Change(M,N);
   WriteLn(M,N);
end.

