unit MyOperators;

{$mode objfpc}{$H+}

interface

uses
  MyTypes;
  
  operator ** (S1 : TMyObject; S2 : TMyObject) e : Boolean;

implementation

  operator ** (S1 : TMyObject; S2 : TMyObject) e : Boolean;
  begin
    e := (S1 = S2);
  end;

end.

