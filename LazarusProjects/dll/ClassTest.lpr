program ClassTest;

{$mode objfpc}{$H+}

Type
  TPoint = Class
  Private
    FX,FY : Longint;
    Function GetCoord (Index : Integer): Longint;
    Procedure SetCoord (Index : Integer; Value : longint);
  Public
    Property X : Longint index 1 read GetCoord Write SetCoord;
    Property Y : Longint index 2 read GetCoord Write SetCoord;
    Property Coords[Index : Integer]:Longint Read GetCoord;
  end;
Procedure TPoint.SetCoord (Index : Integer; Value : Longint);
begin
  Case Index of
    1 : FX := Value;
    2 : FY := Value;
  end;
end;

Function TPoint.GetCoord (INdex : Integer) : Longint;
begin
  Case Index of
    1 : Result := FX;
    2 : Result := FY;
  end;
end;

Var
  P : TPoint;
begin
  P := TPoint.create;
  P.X := 2;
  P.Y := 3;
With P do
  WriteLn('X=', X, ' Y=',Y);
end.

