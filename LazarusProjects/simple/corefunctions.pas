unit CoreFunctions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, MyTypes;

  function Add(S : TMyObject; FName : TFName) : Integer;
  function Delete(S : TMyObject; FName : TFName) : Integer;
  function Modify(SOld, SNew : TMyObject; FName : TFName) : Integer;
  
  procedure Init(FName : TFName);


implementation

  function Add(S : TMyObject; FName : TFName) : Integer;
  var
    Carrier : TXMyObject;
    FP      : TFXMyObject;
    N       : Integer;
  begin
    Add := -1;
    assign(FP, FName);
    reset(FP);
    seek(FP, 1);
    N := 1;
    while not eof(FP) do begin
      read(FP, Carrier);
      if eqFull(Carrier.Content, S) then begin
        if not (Carrier.ID = 0) then
          Add := -2 {Object already exists}
        else begin
          Carrier.ID := N;
          seek(FP, N);
          write(FP, Carrier);
          Add := -3; {Object was deleted and now is recreated}
        end;
      end;
      N := N + 1;
    end;
    if not (Add < -1) then begin
      Carrier.ID := N;
      mov(S, Carrier.Content);
      seek(FP, N);
      write(FP, Carrier);
      Add := N;
    end;
    close(FP);
  end;
  
  function Delete(S : TMyObject; FName : TFName) : Integer;
  var
    Carrier : TXMyObject;
    FP      : TFXMyObject;
    N       : Integer;
  begin
    Delete := -1;
    assign(FP, FName);
    reset(FP);
    seek(FP, 1);
    N := 1;
    while not eof(FP) do begin
      read(FP, Carrier);
      if eqFull(Carrier.Content, S) and not (Carrier.ID = 0) then begin
        Carrier.ID := 0;
        seek(FP, N);
        write(FP, Carrier);
      end;
      N := N + 1;
    end;
    close(FP);
    Delete := N;
  end;
  
  function Modify(SOld, SNew : TMyObject; FName : TFName) : Integer;
  var
    Carrier : TXMyObject;
    FP      : TFXMyObject;
    N       : Integer;
  begin
    Modify := -1;
    assign(FP, FName);
    reset(FP);
    seek(FP, 1);
    N := 1;
    while not eof(FP) do begin
      read(FP, Carrier);
      if eqFull(Carrier.Content, SOld) and not (Carrier.ID = 0) then begin
        mov(SNew, Carrier.Content);
        seek(FP, N);
        write(FP, Carrier);
      end;
      N := N + 1;
    end;
    close(FP);
    Modify := N;
  end;
  
  procedure Init(FName : TFName);
  var
    Carrier : TXMyObject;
    FP      : TFXMyObject;
  begin
    assign(FP, FName);
    rewrite(FP);
    Carrier.ID := 0;
    write(FP, Carrier);
    close(FP);
  end;

end.

