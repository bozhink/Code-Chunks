program asmtests;

{$mode objfpc}{$H+}
{$ASMMODE att}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes ;

function geteipasebx: pointer; assembler;
asm
movl (%esp),%ebx
ret
end;

procedure Move(const source; var dest; count: SizeInt); assembler;
var
  saveesi, saveedi : longint;
asm
  movl %edi,saveedi
end;


var
  I : Integer;
begin
  I := 3;
  asm
  movl I,%eax
  end;
  WriteLn(I);
  asm
  mov $5,%eax
  movl %eax,I
  end;
  WriteLn(I);
  WriteLn('Here is the end');
  asm
  movl $2,%ebx
  movl $1,%eax
  int $0x80
  end;
  WriteLn('It will not be executed');
end.
