program crypt;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this }, md5;

type

  { TCryptApp }

  TCryptApp = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TCryptApp }

procedure TCryptApp.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h','help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Halt;
  end;

  // parse parameters
  if HasOption('h','help') then begin
    WriteHelp;
    Halt;
  end;

  { add your program here }

  // stop program loop
  Terminate;
end;

constructor TCryptApp.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TCryptApp.Destroy;
begin
  inherited Destroy;
end;

procedure TCryptApp.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ',ExeName,' -h');
end;

var
  Application: TCryptApp;
begin
  Application:=TCryptApp.Create(nil);
  Application.Title:='CryptApp';
  Application.Run;
  Application.Free;
end.

