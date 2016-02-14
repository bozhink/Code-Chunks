library lib;

{$mode objfpc}{$H+}
uses Math;
type
  TFunc = function(x:Double):Double;
  
  procedure Hi;export;
  begin
    WriteLn('Hello, world!');
  end;
  
  function F(x:Double):Double;export;
  begin
    F := x*x-1.0;
  end;
  
  function Rand:Double;export;
  begin
    Rand := Random;
  end;
  
  function Bisection(F:TFunc;const A,B,EPS : Double):Double;export;
  var
    fa, fb, fc : Double;
    xa, xb, xc : Double;
  begin
    xa := A;
    xb := B;
    fa := F(xa);
    fb := F(xb);
    if fa<EPS then
      Bisection := A
    else if fb<EPS then
      Bisection := B
    else begin
      repeat
        xc := (xa+xb)/2.0;
        fc := F(xc);
        if fa*fc<0.0 then begin
          xb := xc;
          fb := fc;
        end else begin
          xa := xc;
          fa := fc;
        end;
      until abs(fc)>EPS;
    end;
    Bisection := xc;
  end;

exports
  Hi, F, Bisection, Rand;

begin
  WriteLn('...');
  WriteLn('You are using my DLL - Pascal file');
  WriteLN('...');
end.

