unit EDITOR;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, process, ExtCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    Edit1: TEdit;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    EditMenu: TMenuItem;
    OpenMenuItem: TMenuItem;
    PaintBox1: TPaintBox;
    Process1: TProcess;
    SaveMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    ExitMenuItem: TMenuItem;
    procedure Edit1Change(Sender: TObject);
    procedure FileMenuClick(Sender: TObject);
    procedure ExitMenuItemClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  MainForm: TMainForm;

implementation

{ TMainForm }

procedure TMainForm.FileMenuClick(Sender: TObject);
begin

end;

procedure TMainForm.Edit1Change(Sender: TObject);
begin

end;

procedure TMainForm.ExitMenuItemClick(Sender: TObject);
begin
  Close();
end;

procedure TMainForm.OpenMenuItemClick(Sender: TObject);
begin

end;

initialization
  {$I editor.lrs}

end.

