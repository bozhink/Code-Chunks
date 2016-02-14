program BisectionTest;

{$mode objfpc}{$H+}

uses Math, Windows;

type TFunc = function(x:Double):Double;

  function Bisection(F:TFunc;const A,B,EPS : Double):Double;external 'lib.dll';
  function myfun_(x : Double) : Double; external 'libmyfun.dll';

var
  func : TFunc;
  libH : HMODULE;

begin
  libH := LoadLibrary('Func.dll');
  if libH = 0 then exit;
  
  func := TFunc( GetProcAddress(libH, 'func') );
  
  if assigned(func) then
    WriteLn(Bisection(func,0.0,2.0,0.00001))
  else
    WriteLn('Unable to find required function');
    
  FreeLibrary(libH);
  
  ReadLn();
end.

