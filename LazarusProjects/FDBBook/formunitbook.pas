unit FormUnitBook;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls, IBConnection, mysql40conn, mysql50conn;

type

  { TForm1 }

  TForm1 = class(TForm)
    CBCity: TComboBox;
    IBConnection1: TIBConnection;
    MainMenu: TMainMenu;
    MIExit: TMenuItem;
    MIFile: TMenuItem;
    MySQL50Connection1: TMySQL50Connection;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure MIExitClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.MIExitClick(Sender: TObject);
begin
  Close;
end;

initialization
  {$I formunitbook.lrs}

end.

