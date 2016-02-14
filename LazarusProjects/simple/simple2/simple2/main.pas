unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  CoreFunctions, ExtCtrls, StdCtrls, ComCtrls, SearchEngine, MyTypes, Menus;

type

  { TSimpleForm }

  TSimpleForm = class(TForm)
    BtnOK: TButton;
    BFirst: TButton;
    BPrev: TButton;
    BNext: TButton;
    BLast: TButton;
    BFind: TButton;
    BFindNext: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LMain2: TLabel;
    LMain1: TLabel;
    MainMenu: TMainMenu;
    MIDelete: TMenuItem;
    MISearch: TMenuItem;
    MIFind: TMenuItem;
    MISeparator2: TMenuItem;
    MIModify: TMenuItem;
    MIAdd: TMenuItem;
    MIExit: TMenuItem;
    MISeparator1: TMenuItem;
    MIOpen: TMenuItem;
    MINew: TMenuItem;
    MMEdit: TMenuItem;
    MMFile: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    StatusBar: TStatusBar;

    procedure BFindClick(Sender: TObject);
    procedure BFindNextClick(Sender: TObject);
    procedure BFirstClick(Sender: TObject);
    procedure BLastClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BPrevClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MIAddClick(Sender: TObject);
    procedure MIDeleteClick(Sender: TObject);
    procedure MIFindClick(Sender: TObject);
    procedure MIModifyClick(Sender: TObject);
    procedure MISearchClick(Sender: TObject);
    procedure SetAdd;
    procedure SetModify;
    procedure SetDelete;
    procedure SetFind;
    procedure SetSearch;
    
    procedure MIExitClick(Sender: TObject);
    procedure MINewClick(Sender: TObject);
    procedure MIOpenClick(Sender: TObject);
  private
    procedure Reset;
    procedure Debug(S : Integer);
  public
    { public declarations }
  end; 

var
  SimpleForm: TSimpleForm;
  FName     : TFName;
  N         : Integer;
  Finder    : Integer;
  OKIdx     : Integer;

implementation

resourcestring
  RCAddMain1 = 'Enter Title and Author of the object...';
  RCAddMain2 = '... and press OK';
  RCModifyMain1 = 'Enter Title and/or Author you want to modify';
  RCModifyMain2 = 'Enter new values of Title AND Author and press OK';
  RCDeleteMain1 = 'Enter Title and/or Author you want to delete...';
  RCDeleteMain2 = '... and press OK';
  RCFindMain1 = 'Showing sequently...';
  RCSearchMain1 = 'Enter information you want to find:';
  
{ TSimpleForm }

procedure TSimpleForm.Reset;
begin
  SimpleForm.Caption := SimpleForm.Caption + '   ' + FName;
  
  GroupBox.Caption := 'Open or create New File and choose action';
  LMain1.Caption   := '';
  LMain2.Caption   := '';

  Edit1.Text       := '';
  Edit2.Text       := '';
  Edit3.Text       := '';
  Edit4.Text       := '';

  Label1.Visible   := False;
  Label2.Visible   := False;
  Edit1.Visible    := False;
  Edit2.Visible    := False;

  Label3.Visible   := False;
  Label4.Visible   := False;
  Edit3.Visible    := False;
  Edit4.Visible    := False;
  
  BtnOK.Visible    := False;
  BFirst.Visible   := False;
  BLast.Visible    := False;
  BPrev.Visible    := False;
  BNext.Visible    := False;
  BFind.Visible    := False;
  BFindNext.Visible:= False;
  
  N := 1;
  Finder := 1;
  OKIdx := 0;
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

procedure TSimpleForm.SetAdd;
begin
  GroupBox.Caption := 'Add';
  LMain1.Caption   := RCAddMain1;
  LMain2.Caption   := RCAddMain2;
  
  Edit1.Text       := '';
  Edit2.Text       := '';
  Edit3.Text       := '';
  Edit4.Text       := '';
  
  Label1.Visible   := True;
  Label2.Visible   := True;
  Edit1.Visible    := True;
  Edit2.Visible    := True;
  
  Label3.Visible   := False;
  Label4.Visible   := False;
  Edit3.Visible    := False;
  Edit4.Visible    := False;
  
  BtnOK.Visible    := True;
  BFirst.Visible   := False;
  BLast.Visible    := False;
  BPrev.Visible    := False;
  BNext.Visible    := False;
  BFind.Visible    := False;
  BFindNext.Visible:= False;
end;

procedure TSimpleForm.MIAddClick(Sender: TObject);
begin
  SetAdd;
  OKIdx := 1;
end;

procedure TSimpleForm.MIDeleteClick(Sender: TObject);
begin
  SetDelete;
  OKIdx := 3;
end;

procedure TSimpleForm.MIFindClick(Sender: TObject);
begin
  SetFind;
  N := 1;
  OKIdx := 0;
end;

procedure TSimpleForm.MIModifyClick(Sender: TObject);
begin
  SetModify;
  OKIdx := 2;
end;

procedure TSimpleForm.MISearchClick(Sender: TObject);
begin
  SetSearch;
  N := 1;
  OKIdx := 0;
end;

procedure TSimpleForm.FormCreate(Sender: TObject);
begin
  Reset;
end;

procedure TSimpleForm.BtnOKClick(Sender: TObject);
begin
  if OKIdx = 1 then
    Debug( Add( CreateMyObject(Edit1.Text, Edit2.Text), FName ) )
  else if OKIdx = 2 then
    Debug( Modify( CreateMyObject(Edit1.Text, Edit2.Text),
                   CreateMyObject(Edit3.Text, Edit4.Text), FName ) )
  else if OKIdx = 3 then
    Debug( Delete( CreateMyObject(Edit1.Text, Edit2.Text), FName ) );
end;

procedure TSimpleForm.BFirstClick(Sender: TObject);
var
  S : TMyObject;
begin
  mov(Get(FName, 1), S);
  Edit1.Text := S.Title;
  Edit2.Text := S.Author;
  LMain2.Caption := '1';
  N := 1;
end;

procedure TSimpleForm.BFindClick(Sender: TObject);
var
  S : TMyObject;
  I : Integer;
  SS : String[5];
begin
  Finder := 1;
  I := Find( CreateMyObject(Edit1.Text, Edit2.Text), FName, Finder );
  mov( Get( FName, I ), S);
  Str(I, SS);
  Edit3.Text := S.Title;
  Edit4.Text := S.Author;
  LMain2.Caption := SS;
end;

procedure TSimpleForm.BFindNextClick(Sender: TObject);
var
  S : TMyObject;
  C : TMyObject;
  I : Integer;
  SS : String[5];
begin
  C := CreateMyObject(Edit1.Text, Edit2.Text);
  I := Find( C, FName, Finder );
  if I = 0 then begin
    Finder := 1;
    I := Find( C, FName, Finder );
  end;
  Finder := I + 1;
  mov( Get( FName, I ), S);
  Str(I, SS);
  Edit3.Text := S.Title;
  Edit4.Text := S.Author;
  LMain2.Caption := SS;
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
  mov(Get(FName, N), S);
  Edit1.Text := S.Title;
  Edit2.Text := S.Author;
  LMain2.Caption := SS;
end;

procedure TSimpleForm.BLastClick(Sender: TObject);
var
  S : TMyObject;
  SS : String[5];
begin
  N := FileInfo(FName);
  Str(N, SS);
  mov(Get(FName, N), S);
  Edit1.Text := S.Title;
  Edit2.Text := S.Author;
  LMain2.Caption := SS;
end;

procedure TSimpleForm.BNextClick(Sender: TObject);
var
  S : TMyObject;
  SS : String[5];
  FI : Integer;
begin
  FI := FileInfo(FName);
  if N >= FI then
    N := FI
  else
    N := N + 1;
  Str(N, SS);
  mov(Get(FName, N), S);
  Edit1.Text := S.Title;
  Edit2.Text := S.Author;
  LMain2.Caption := SS;
end;

procedure TSimpleForm.SetModify;
begin
  GroupBox.Caption := 'Modify';
  LMain1.Caption   := RCModifyMain1;
  LMain2.Caption   := RCModifyMain2;

  Edit1.Text       := '';
  Edit2.Text       := '';
  Edit3.Text       := '';
  Edit4.Text       := '';

  Label1.Visible   := True;
  Label2.Visible   := True;
  Edit1.Visible    := True;
  Edit2.Visible    := True;

  Label3.Visible   := True;
  Label4.Visible   := True;
  Edit3.Visible    := True;
  Edit4.Visible    := True;
  
  BtnOK.Visible    := True;
  BFirst.Visible   := False;
  BLast.Visible    := False;
  BPrev.Visible    := False;
  BNext.Visible    := False;
  BFind.Visible    := False;
  BFindNext.Visible:= False;
end;

procedure TSimpleForm.SetDelete;
begin
  GroupBox.Caption := 'Delete';
  LMain1.Caption   := RCDeleteMain1;
  LMain2.Caption   := RCDeleteMain2;

  Edit1.Text       := '';
  Edit2.Text       := '';
  Edit3.Text       := '';
  Edit4.Text       := '';

  Label1.Visible   := True;
  Label2.Visible   := True;
  Edit1.Visible    := True;
  Edit2.Visible    := True;

  Label3.Visible   := False;
  Label4.Visible   := False;
  Edit3.Visible    := False;
  Edit4.Visible    := False;
  
  BtnOK.Visible    := True;
  BFirst.Visible   := False;
  BLast.Visible    := False;
  BPrev.Visible    := False;
  BNext.Visible    := False;
  BFind.Visible    := False;
  BFindNext.Visible:= False;
end;

procedure TSimpleForm.SetFind;
begin
  GroupBox.Caption := 'Find';
  LMain1.Caption   := RCFindMain1;
  LMain2.Caption   := '';

  Edit1.Text       := '';
  Edit2.Text       := '';
  Edit3.Text       := '';
  Edit4.Text       := '';

  Label1.Visible   := True;
  Label2.Visible   := True;
  Edit1.Visible    := True;
  Edit2.Visible    := True;

  Label3.Visible   := False;
  Label4.Visible   := False;
  Edit3.Visible    := False;
  Edit4.Visible    := False;

  BtnOK.Visible    := False;
  BFirst.Visible   := True;
  BLast.Visible    := True;
  BPrev.Visible    := True;
  BNext.Visible    := True;
  BFind.Visible    := False;
  BFindNext.Visible:= False;
end;

procedure TSimpleForm.SetSearch;
begin
  GroupBox.Caption := 'Search';
  LMain1.Caption   := RCSearchMain1;
  LMain2.Caption   := '';

  Edit1.Text       := '';
  Edit2.Text       := '';
  Edit3.Text       := '';
  Edit4.Text       := '';

  Label1.Visible   := True;
  Label2.Visible   := True;
  Edit1.Visible    := True;
  Edit2.Visible    := True;

  Label3.Visible   := True;
  Label4.Visible   := True;
  Edit3.Visible    := True;
  Edit4.Visible    := True;

  BtnOK.Visible    := False;
  BFirst.Visible   := False;
  BLast.Visible    := False;
  BPrev.Visible    := False;
  BNext.Visible    := False;
  BFind.Visible    := True;
  BFindNext.Visible:= True;
end;

procedure TSimpleForm.MINewClick(Sender: TObject);
begin
  With SaveDialog do
    If Execute then begin
      FName := FileName;
      Init(FName);
      Reset;
    end;
end;

procedure TSimpleForm.MIExitClick(Sender: TObject);
begin
  Close;
end;

procedure TSimpleForm.MIOpenClick(Sender: TObject);
begin
  With OpenDialog do
    If Execute then begin
      FName := FileName;
      Reset;
    end;
end;


initialization
  {$I main.lrs}

end.

