program BooksLight;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp, BooksLightMainUnit, BooksLightBasicProcedures;

type

  TBookApplication = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;


procedure TBookApplication.DoRun;
var
  ErrorMsg: String;
begin
  ErrorMsg:=CheckOptions('i','init');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Halt;
  end;

  if HasOption('i','init') then begin
    Init;
    Halt;
  end;

  Main;

  Terminate;
end;

constructor TBookApplication.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TBookApplication.Destroy;
begin
  inherited Destroy;
end;

procedure TBookApplication.WriteHelp;
begin
  writeln('Usage: ',ExeName,' -h');
end;

var
  Application: TBookApplication;
begin
  Application:=TBookApplication.Create(nil);
  Application.Title:='Books';
  Application.Run;
  Application.Free;
end.

