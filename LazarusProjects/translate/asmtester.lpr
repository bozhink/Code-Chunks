program asmtester;

{$mode objfpc}{$H+}
{$asmmode intel}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

function geteipasebx : pointer; assembler;
asm
   Mov esp,ebx
   ret
end;

var
  I : Integer;
  R : Real;
  J : Byte;

{$R *.res}

begin
  I:=92558929;
  R:=3.14152;
  asm
  push eax
  mov eax,R
  inc eax
  mov I,eax
  pop eax
  end;
  Write(I); WriteLn(R);
  WriteLn(J);
  WriteLn('Hello World');
end.

