library Func;

{$mode objfpc}{$H+}

  function func(x : Double):Double;export;
  begin
    func := x*x-x-1.0; //Root in interval [0,2]
  end;

exports func;

begin
  WriteLn('...');
  WriteLn('Using func.dll');
  WriteLn('...');
end.

