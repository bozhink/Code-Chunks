program asmtest;

{$mode objfpc}{$H+}
{$ASMMODE intel}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  I : Integer;
  J : Integer;
  
  function geteipasebx : pointer;assembler;
  asm
    mov [esp],ebx
    ret
  end;

  procedure pump;
  var j: Integer;
  begin
    j:=1;
  asm
    push j
  end;
  end;

  procedure seteax;
  var K,L,M : Integer;
  begin
    K := 10;
    L := 1;
    asm
      mov M,ebx
    end;
    if M=0 then
      asm
        mov ebx,K
      end
    else
      asm
        add ebx,L
        mov eax,ebx
      end;
  end;

  procedure swap(var i,j : Integer);
  begin
    asm
      mov eax, i
      mov ebx, j
      mov i, eax
      mov j, ebx
    end;
  end;

var gg: Integer;
var ii, jj :Integer;
begin
  I := 3;
  for J := 1 To 5 do begin
    asm
      mov ebx,J
    end;
    seteax;
    pump;
    asm
      mov I,eax
      pop gg
    end;
    Write(I);
    WriteLn(gg);
  end;
  ii := 1;
  jj := 2;
  swap(ii, jj);
  WriteLn(ii);
  WriteLn(jj);
  Readln();
end.

