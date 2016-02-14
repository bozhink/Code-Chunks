program guilib;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, guiunit
  { you can add units after this };

{$R *.res}

procedure doRun(); cdecl;
var
  form1 : TForm1;
begin
  form1.Show;
end;

exports doRun;

begin

end.

