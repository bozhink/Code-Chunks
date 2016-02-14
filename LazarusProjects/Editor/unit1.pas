unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  TBuff = String[1];

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    FileName : String;
    Buf : TBuff;
    fp : File of TBuff;
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  If SaveDialog1.Execute Then
    FileName:=SaveDialog1.FileName
  Else
    FileName:='';
  Form1.Caption:='Editor - ' + FileName;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    FileName:=OpenDialog1.FileName
  Else
    FileName:='';
  Form1.Caption:='Editor - ' + FileName;
  Seek(fp,0);

end;

end.

