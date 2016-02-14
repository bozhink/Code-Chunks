unit SearchEngine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, MyOperators, MyTypes;
  
  function Get(FName : TFName; Index : Integer) : TMyObject;
  function FileInfo(FName : TFName) : Integer;
  function Find(S : TMyObject; FName : TFName; Index : Integer) : Integer;

implementation

  function Get(FName : TFName; Index : Integer) : TMyObject;
  //Returns the object on position Index in file FName
  var
    Carrier : TXMyObject;
    FP      : TFXMyObject;
  begin
    assign(FP, FName);
    reset(FP);
    seek(FP, Index);
    read(FP, Carrier);
    Get := Carrier.Content;
    close(FP);
  end;
  
  function FileInfo(FName : TFName) : Integer;
  //Returns the size of file FName
  var
    FP : TFXMyObject;
  begin
    assign(FP, FName);
    reset(FP);
    FileInfo := FileSize(FP)-1;
    close(FP);
  end;
  
  function Find(S : TMyObject; FName : TFName; Index : Integer) : Integer;
  //Returns the file position of the non-deleted oject S
  //  in file FName beginning from the position Index;
  var
    Carrier : TXMyObject;
    FP      : TFXMyObject;
  begin
    assign(FP, FName);
    reset(FP);
    if Index > FileSize(FP) then
      Find := -1
    else begin
      seek(FP,Index);
      Find := 0;
      while (Find = 0) and not eof(FP) do begin
        read(FP, Carrier);
        if (Carrier.Content = S) and not (Carrier.ID = 0) then
          Find := FilePos(FP) - 1;
      end;
    end;
    close(FP);
  end;

end.

