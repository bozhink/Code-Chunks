unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  CoreFunctions, ExtCtrls, StdCtrls, ComCtrls, SearchEngine, MyOperators,
  MyTypes;

type

  { TSimpleForm }

  TSimpleForm = class(TForm)
    BNew: TButton;
    BOpen: TButton;
    BAdd: TButton;
    BDelete: TButton;
    BModify: TButton;
    BFirst: TButton;
    BPrev: TButton;
    BNext: TButton;
    BLast: TButton;
    BFind: TButton;
    BFindNext: TButton;
    EAdd: TEdit;
    EDelete: TEdit;
    EFound: TEdit;
    EFind: TEdit;
    EView: TEdit;
    EModifyNew: TEdit;
    EModifyOld: TEdit;
    EFileName: TEdit;
    LFound: TLabel;
    LFoundMain: TLabel;
    LFind: TLabel;
    LViewText: TLabel;
    LView: TLabel;
    LModifyNew: TLabel;
    LModifyOld: TLabel;
    LDelete: TLabel;
    LAdd: TLabel;
    LFileName: TLabel;
    Notebook1: TNotebook;
    PSearch: TPage;
    PView: TPage;
    PFile: TPage;
    PAdd: TPage;
    PDelete: TPage;
    PModify: TPage;
    StatusBar: TStatusBar;

    procedure BAddClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure BFindClick(Sender: TObject);
    procedure BFindNextClick(Sender: TObject);
    procedure BFirstClick(Sender: TObject);
    procedure BLastClick(Sender: TObject);
    procedure BModifyClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BOpenClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BPrevClick(Sender: TObject);
  private
    procedure Reset;
    procedure Debug(S : Integer);
  public
    { public declarations }
  end; 

var
  SimpleForm: TSimpleForm;
  FileName : TFName;
  N : Integer;
  Finder : Integer;

implementation

{ TSimpleForm }

procedure TSimpleForm.Reset;
begin
  SimpleForm.Caption := SimpleForm.Caption + ' - ' + FileName;
  PAdd.Visible := True;
  PDelete.Visible := True;
  PModify.Visible := True;
  N := 1;
  Finder := 1;
end;

procedure TSimpleForm.Debug(S: Integer);
var
  SS : String[5];
begin
  Str(S, SS);
  if S = -1 then
    StatusBar.SimpleText := 'Unexpected Error! ' + SS
  else if S = -2 then
    StatusBar.SimpleText := 'Object Already Exists! ' + SS
  else if S = -3 then
    StatusBar.SimpleText := 'Object has been deleted but now is recreated! ' +SS
  else
    StatusBar.SimpleText := 'Status : ' + SS;
end;

procedure TSimpleForm.BOpenClick(Sender: TObject);
begin
  FileName := EFileName.Text;
  Reset;
end;

procedure TSimpleForm.BAddClick(Sender: TObject);
begin
  Debug( Add(EAdd.Text, FileName) );
end;

procedure TSimpleForm.BDeleteClick(Sender: TObject);
begin
  Debug( Delete(EDelete.Text, FileName) );
end;

procedure TSimpleForm.BFindClick(Sender: TObject);
var
  S : TMyObject;
  I : Integer;
  SS : String[5];
begin
  Finder := 1;
  I := Find(EFind.Text, FileName, Finder);
  S := Get( FileName, I );
  Str(I, SS);
  EFound.Text := S;
  LFound.Caption := SS;
end;

procedure TSimpleForm.BFindNextClick(Sender: TObject);
var
  S : TMyObject;
  I : Integer;
  SS : String[5];
begin
  Finder := Finder + 1;
  I := Find(EFind.Text, FileName, Finder);
  S := Get( FileName, I );
  Str(I, SS);
  EFound.Text := S;
  LFound.Caption := SS;
end;

procedure TSimpleForm.BFirstClick(Sender: TObject);
var
  S : TMyObject;
begin
  S := Get(FileName, 1);
  EView.Text := S;
  LView.Caption := '1';
  N := 1;
end;

procedure TSimpleForm.BLastClick(Sender: TObject);
var
  S : TMyObject;
  SS : String[5];
begin
  N := FileInfo(FileName);
  Str(N, SS);
  S := Get(FileName, N);
  EView.Text := S;
  LView.Caption := SS;
end;

procedure TSimpleForm.BModifyClick(Sender: TObject);
begin
  Debug( Modify(EModifyOld.Text, EModifyNew.Text, FileName) );
end;

procedure TSimpleForm.BNextClick(Sender: TObject);
var
  S : TMyObject;
  SS : String[5];
  FI : Integer;
begin
  FI := FileInfo(FileName);
  if N >= FI then
    N := FI
  else
    N := N + 1;
  Str(N, SS);
  S := Get(FileName, N);
  EView.Text := S;
  LView.Caption := SS;
end;

procedure TSimpleForm.BNewClick(Sender: TObject);
begin
  FileName := EFileName.Text;
  Init(FileName);
  Reset;
end;

procedure TSimpleForm.BPrevClick(Sender: TObject);
var
  S : TMyObject;
  SS : String[5];
begin
  if N = 1 then
    N := 1
  else
    N := N - 1;
  Str(N, SS);
  S := Get(FileName, N);
  EView.Text := S;
  LView.Caption := SS;
end;

initialization
  {$I main.lrs}

end.

