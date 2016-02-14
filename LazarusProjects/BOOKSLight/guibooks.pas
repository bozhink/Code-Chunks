unit GUIBooks;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, {LResources,} Forms, Controls, Graphics, Dialogs, StdCtrls,
  AddBook;

type

  { TMainForm }

  TMainForm = class(TForm)
    AddBtn: TButton;
    DeleteBtn: TButton;
    ModifyBtn: TButton;
    SearchBtn: TButton;
    ExitBtn: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure AddBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  MainForm: TMainForm;

implementation

{ TMainForm }



procedure TMainForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.AddBtnClick(Sender: TObject);
begin
  AddForm;
end;

initialization
  {$I guibooks.lrs}

end.

