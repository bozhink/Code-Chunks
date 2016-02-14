program ConsoleBooks;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp, BookLibrary;

type

  { TConsoleLibraryProgram }

  TConsoleLibraryProgram = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
  end;

{ TConsoleLibraryProgram }

procedure TConsoleLibraryProgram.DoRun;
var
  ErrorMsg: String;
begin

  { add your program here }

  // stop program loop
  Terminate;
end;

var
  Application: TConsoleLibraryProgram;
begin
  Application:=TConsoleLibraryProgram.Create(nil);
  Application.Title:='ConsoleLib';
  Application.Run;
  Application.Free;
end.

