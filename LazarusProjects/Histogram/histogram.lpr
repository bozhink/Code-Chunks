program histogram;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

type
  TNumber = Integer;

const
  N = 10;

procedure Swap(var x, y : TNumber);
var
  z : TNumber;
begin
  z:=x;
  x:=y;
  y:=z;
end;

procedure Sort(var z:array of TNumber; const left, right:Integer);
var
  i, j : Integer;
begin
  for i:=left to right-1 do
    for j:=i+1 to right do
      if z[i]>z[j] then Swap(z[i],z[j]);
end;

procedure Sort2D(var z:array of array of TNumber; const left, right:Integer);
var
  i, j : Integer;
begin
  for i:=left to right-1 do
    for j:=i+1 to right do
      if z[1,i]>z[1,j] then begin
        Swap(z[1,i],z[1,j]);
        Swap(z[2,i],z[2,j]);
      end;
end;

var
  c : array[0..N] of TNumber;
  d : TNumber;
  i : Integer;

begin
  d:=50;
  for i:=0 to N do
  begin
    c[i]:=Random(d);
  end;
  WriteLn('Before sort:');
  for I:=0 to N do WriteLn('c[',i,']=',c[i]);
  WriteLn('After sort:');
  Sort(c,0,N);
  for I:=0 to N do WriteLn('c[',i,']=',c[i]);
  Readln();
end.

