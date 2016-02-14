unit MyTypes;

{$mode objfpc}{$H+}

interface

type
  TMyObject = String[30];
  TXMyObject = Record
    ID : Integer;
    Content : TMyObject;
    end;
  TFXMyObject = File of TXMyObject;
  TFName = String[64];

implementation

end.

