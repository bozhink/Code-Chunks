unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, filectrl;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MIAbout: TMenuItem;
    MIHelp: TMenuItem;
    MIFont: TMenuItem;
    MIFormat: TMenuItem;
    MIReplace: TMenuItem;
    MIFind: TMenuItem;
    MIPaste: TMenuItem;
    MICopy: TMenuItem;
    MICut: TMenuItem;
    MIEdit: TMenuItem;
    MINew: TMenuItem;
    MIQuit: TMenuItem;
    MISaveAs: TMenuItem;
    MISave: TMenuItem;
    MIOpen: TMenuItem;
    MIFile: TMenuItem;
    OpenDialog1: TOpenDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    procedure MIFindClick(Sender: TObject);
    procedure MIFontClick(Sender: TObject);
    procedure MINewClick(Sender: TObject);
    procedure MIOpenClick(Sender: TObject);
    procedure MIQuitClick(Sender: TObject);
    procedure MISaveAsClick(Sender: TObject);
    procedure MISaveClick(Sender: TObject);
  private
    procedure SaveAsFile;
    procedure OpenFile;
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }
var
  CurrentFile: String = 'Untitled';
  
procedure TForm1.SaveAsFile;
begin
  if SaveDialog1.Execute then begin
    CurrentFile:=SaveDialog1.FileName;
    Memo1.Lines.SaveToFile(CurrentFile);
    OpenFile;
  end;
end;

procedure TForm1.OpenFile;
begin
  Form1.Caption:='Edit Pad   '+CurrentFile;
end;

procedure TForm1.MIQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MISaveAsClick(Sender: TObject);
begin
  SaveAsFile;
end;

procedure TForm1.MISaveClick(Sender: TObject);
begin
  if (CurrentFile='') then
    SaveAsFile
  else begin
    if FileExists(CurrentFile) then
      DeleteFile(CurrentFile);
    Memo1.Lines.SaveToFile(CurrentFile);
  end;
end;

procedure TForm1.MINewClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  CurrentFile:='Untitled';
end;

procedure TForm1.MIFontClick(Sender: TObject);
begin
  if FontDialog1.Execute then begin
    Memo1.Font.CharSet:=FontDialog1.Font.CharSet;
    Memo1.Font.Color:=FontDialog1.Font.Color;
    Memo1.Font.Height:=FontDialog1.Font.Height;
    Memo1.Font.Name:=FontDialog1.Font.Name;
    Memo1.Font.Pitch:=FontDialog1.Font.Pitch;
    Memo1.Font.Size:=FontDialog1.Font.Size;
    Memo1.Font.Style:=FontDialog1.Font.Style;
  end;
end;

procedure TForm1.MIFindClick(Sender: TObject);
begin

end;

procedure TForm1.MIOpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    CurrentFile:=OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(CurrentFile);
    OpenFile;
  end;
end;

initialization
  {$I unit1.lrs}

end.

