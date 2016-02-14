unit MyTypes;

{$mode objfpc}{$H+}

interface

type
  TName = String[30];
  TMyObject = Record
    Title : TName;
    Author : TName;
    end;
  TXMyObject = Record
    ID : Integer;
    Content : TMyObject;
    end;
  TFXMyObject = File of TXMyObject;
  TFName = String[64];
  
  function eqFull(S1, S2 : TMyObject) : Boolean;
  function eqTitle(S1, S2 : TMyObject) : Boolean;
  function eqAuthor(S1, S2 : TMyObject) : Boolean;
  procedure mov(const movIn : TMyObject; var movOut : TMyObject);
  function CreateMyObject(T, A : TName) : TMyObject;

implementation

  function eqFull(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Title = S2.Title) and (S1.Author = S2.Author) then
      eqFull := True
    else
      eqFull := False;
  end;
  
  function eqTitle(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Title = S2.Title) then
      eqTitle := True
    else
      eqTitle := False;
  end;
  
  function eqAuthor(S1, S2 : TMyObject) : Boolean;
  begin
    if (S1.Author = S2.Author) then
      eqAuthor := True
    else
      eqAuthor := False;
  end;
  
  procedure mov(const movIn : TMyObject; var movOut : TMyObject);
  begin
    movOut.Title := movIn.Title;
    movOut.Author := movIn.Author;
  end;
  
    function CreateMyObject(T, A : TName) : TMyObject;
    begin
      CreateMyObject.Title := T;
      CreateMyObject.Author := A;
    end;

end.

