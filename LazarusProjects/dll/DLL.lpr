library DLL;
{$mode objfpc}{$H+}
uses
  Classes;

type
  TPas = Class
  Private
  
  Public
    function X(y:Integer):Integer;
  end;
  
  TPoint = Class(TObject)
  Private
    FX,FY : Longint;
    Function GetCoord (Index : Integer): Longint;
    Procedure SetCoord (Index : Integer; Value : longint);
  Public
    Property X : Longint index 1 read GetCoord Write SetCoord;
    Property Y : Longint index 2 read GetCoord Write SetCoord;
    Property Coords[Index : Integer]:Longint Read GetCoord;
  end;

IUnknown = interface ['{00000000-0000-0000-C000-000000000046}']
function QueryInterface(const iid : tguid;out obj) : longint;
function _AddRef : longint;
function _Release : longint;
end;
  
function TPas.X(y:Integer):Integer;
begin
  X := y+1;
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

begin
end.

