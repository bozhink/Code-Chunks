program asmtest;

{$mode objfpc}{$H+}
{$ASMMODE intel}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes;
Const
  e = 2.7182818;
  a = 2;
  c = '4';
  s = 'This is a constant string';
  sc = chr(32);
  ls = SizeOf(Longint);
  P = Nil;
  Ss = [1,2];

Resourcestring
  Yes = 'Yes.';
  No = 'No.';
Var
   YesNo : Array[Boolean] of string = (No,Yes);
   B : Boolean;
var
   I, J : Integer;
   X, Y : ^Double;
   XX, YY : Double;

begin
  I := 3;
  Write('I = ');WriteLn(I);
  asm
  mov eax,92h
  mov I,eax
  mov eax,92h
  push eax
  pop I
  end;
  WriteLn('I = ',I);
  Writeln(YesNo[B]);
  I := 1;
  J := 2;
  WriteLn('I = ',I,' J = ',J);
  asm
  mov eax,I
  mov ebx,J
  mov I,ebx
  mov J,eax
  end;
  WriteLn('I = ',I,' J = ',J);
  XX:=1.5;
  YY:=2.6;
  X:=@XX;
  Y:=@YY;
  WriteLn('x = ',X^,' y = ',Y^);
  asm
  mov eax,X
  mov ebx,Y
  mov X,ebx
  mov Y,eax
  end;
  WriteLn('x = ',X^,' y = ',Y^);
end.

