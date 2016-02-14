program simple;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { you can add units after this }, Main, CoreFunctions, SearchEngine,
MyOperators, MyTypes;

begin
  Application.Initialize;
  Application.CreateForm(TSimpleForm, SimpleForm);
  Application.Run;
end.

