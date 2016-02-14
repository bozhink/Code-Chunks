unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  CoreFunctions, ExtCtrls, StdCtrls, ComCtrls, SearchEngine, MyTypes, Menus;

type

  { TSimpleForm }

  TSimpleForm = class(TForm)
    BFind1: TButton;
    BFindNext1: TButton;
    BFirst1: TButton;
    BLast1: TButton;
    BNext1: TButton;
    BPrev1: TButton;
    BtnOK: TButton;
    BFirst: TButton;
    BPrev: TButton;
    BNext: TButton;
    BLast: TButton;
    BFind: TButton;
    BFindNext: TButton;
    BtnOK1: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LMain2: TLabel;
    LMain1: TLabel;
    LMain3: TLabel;
    LMain4: TLabel;
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
    procedure SetForm(ShowUpPanel : Boolean; ShowDownPanel : Boolean;
                      IfSearch : Boolean; IfFind : Boolean);
    function GetForm1 : TMyObject;
    function GetForm2 : TMyObject;
    procedure PutForm1(S : TMyObject);
    procedure PutForm2(S : TMyObject);
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

procedure TSimpleForm.SetForm(ShowUpPanel : Boolean; ShowDownPanel : Boolean;
                              IfSearch : Boolean; IfFind : Boolean);
  begin
    GroupBox1.Visible := True;

    Label1.Visible := ShowUpPanel;
    Label2.Visible := ShowUpPanel;
    Label3.Visible := ShowUpPanel;
    Label4.Visible := ShowUpPanel;
    Label5.Visible := ShowUpPanel;
    Label6.Visible := ShowUpPanel;
    Label7.Visible := ShowUpPanel;
    Label8.Visible := ShowUpPanel;
    Label9.Visible := ShowUpPanel;
    Label10.Visible := ShowUpPanel;
    Label11.Visible := ShowUpPanel;
    Label12.Visible := ShowUpPanel;

    Edit1.Visible := ShowUpPanel;
    Edit1.Caption := '';
    Edit2.Visible := ShowUpPanel;
    Edit2.Caption := '';
    Edit3.Visible := ShowUpPanel;
    Edit3.Caption := '';
    Edit4.Visible := ShowUpPanel;
    Edit4.Caption := '';
    Edit5.Visible := ShowUpPanel;
    Edit5.Caption := '';
    Edit6.Visible := ShowUpPanel;
    Edit6.Caption := '';
    Edit7.Visible := ShowUpPanel;
    Edit7.Caption := '';
    Edit8.Visible := ShowUpPanel;
    Edit8.Caption := '';
    Edit9.Visible := ShowUpPanel;
    Edit9.Caption := '';
    Edit10.Visible := ShowUpPanel;
    Edit10.Caption := '';
    Edit11.Visible := ShowUpPanel;
    Edit11.Caption := '';
    Edit12.Visible := ShowUpPanel;
    Edit12.Caption := '';

    GroupBox2.Visible := ShowDownPanel;

    Label13.Visible := ShowDownPanel;
    Label14.Visible := ShowDownPanel;
    Label15.Visible := ShowDownPanel;
    Label16.Visible := ShowDownPanel;
    Label17.Visible := ShowDownPanel;
    Label18.Visible := ShowDownPanel;
    Label19.Visible := ShowDownPanel;
    Label20.Visible := ShowDownPanel;
    Label21.Visible := ShowDownPanel;
    Label22.Visible := ShowDownPanel;
    Label23.Visible := ShowDownPanel;
    Label24.Visible := ShowDownPanel;

    Edit13.Visible := ShowDownPanel;
    Edit13.Caption := '';
    Edit14.Visible := ShowDownPanel;
    Edit14.Caption := '';
    Edit15.Visible := ShowDownPanel;
    Edit15.Caption := '';
    Edit16.Visible := ShowDownPanel;
    Edit16.Caption := '';
    Edit17.Visible := ShowDownPanel;
    Edit17.Caption := '';
    Edit18.Visible := ShowDownPanel;
    Edit18.Caption := '';
    Edit19.Visible := ShowDownPanel;
    Edit19.Caption := '';
    Edit20.Visible := ShowDownPanel;
    Edit20.Caption := '';
    Edit21.Visible := ShowDownPanel;
    Edit21.Caption := '';
    Edit22.Visible := ShowDownPanel;
    Edit22.Caption := '';
    Edit23.Visible := ShowDownPanel;
    Edit23.Caption := '';
    Edit24.Visible := ShowDownPanel;
    Edit24.Caption := '';

    if IfSearch or IfFind then BtnOk.Visible := False
    else BtnOK.Visible := True;

    BFirst.Visible := IfFind;
    BPrev.Visible  := IfFind;
    BNext.Visible  := IfFind;
    BLast.Visible  := IfFind;

    BFind.Visible     := IfSearch;
    BFindNext.Visible := IfSearch;

  end;

procedure TSimpleForm.Reset;
begin
  SimpleForm.Caption := SimpleForm.Caption + '   ' + FName;
  
  GroupBox1.Caption := 'Open or create New File and choose action';
  LMain1.Caption   := '';
  LMain2.Caption   := '';

  SetForm(False, False, False, False);
  BtnOK.Visible := False;
  
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

  function TSimpleForm.GetForm1 : TMyObject;
  begin
    mov(CreateMyObject(Edit1.Text, Edit2.Text, Edit3.Text,
                       Edit4.Text, Edit5.Text, Edit6.Text,
                       Edit7.Text, Edit8.Text, Edit9.Text,
                       Edit10.Text, Edit11.Text, Edit12.Text),
        GetForm1);
  end;

  function TSimpleForm.GetForm2 : TMyObject;
  begin
    mov(CreateMyObject(Edit13.Text, Edit14.Text, Edit15.Text,
                       Edit16.Text, Edit17.Text, Edit18.Text,
                       Edit19.Text, Edit20.Text, Edit21.Text,
                       Edit22.Text, Edit23.Text, Edit24.Text),
        GetForm2);
  end;
  
  procedure TSimpleForm.PutForm1(S : TMyObject);
  begin
    With S do begin
      Edit1.Text := Title;
      Edit2.Text := Director;
      Edit3.Text := Producer;
      Edit4.Text := Cast;
      Edit5.Text := Country;
      Edit6.Text := Gender;
      Edit7.Text := Year;
      Edit8.Text := Description;
      Edit9.Text := Comments;
      Edit10.Text := Languages;
      Edit11.Text := Subtitles;
      Edit12.Text := Duration;
    end;
  end;

  procedure TSimpleForm.PutForm2(S : TMyObject);
  begin
    With S do begin
      Edit13.Text := Title;
      Edit14.Text := Director;
      Edit15.Text := Producer;
      Edit16.Text := Cast;
      Edit17.Text := Country;
      Edit18.Text := Gender;
      Edit19.Text := Year;
      Edit20.Text := Description;
      Edit21.Text := Comments;
      Edit22.Text := Languages;
      Edit23.Text := Subtitles;
      Edit24.Text := Duration;
    end;
  end;

procedure TSimpleForm.FormCreate(Sender: TObject);
begin
  Reset;
end;



procedure TSimpleForm.MIAddClick(Sender: TObject);
begin
  SetAdd;
  OKIdx := 1;
end;

procedure TSimpleForm.MIModifyClick(Sender: TObject);
begin
  SetModify;
  OKIdx := 2;
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

procedure TSimpleForm.MISearchClick(Sender: TObject);
begin
  SetSearch;
  N := 1;
  OKIdx := 0;
end;

procedure TSimpleForm.BtnOKClick(Sender: TObject);
begin
  if OKIdx = 1 then
    Debug( Add( GetForm1, FName ) )
  else if OKIdx = 2 then
    Debug( Modify( GetForm1, GetForm2, FName ) )
  else if OKIdx = 3 then
    Debug( Delete( GetForm1, FName ) );
end;

procedure TSimpleForm.BFirstClick(Sender: TObject);
var
  S : TMyObject;
begin
  mov(Get(FName, 1), S);
  PutForm1(S);
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
  I := Find( GetForm1, FName, Finder );
  mov( Get( FName, I ), S);
  Str(I, SS);
  PutForm2(S);
  LMain2.Caption := SS;
end;

procedure TSimpleForm.BFindNextClick(Sender: TObject);
var
  S : TMyObject;
  C : TMyObject;
  I : Integer;
  SS : String[5];
begin
  mov(GetForm1, C);
  I := Find( C, FName, Finder );
  if I = 0 then begin
    Finder := 1;
    I := Find( C, FName, Finder );
  end;
  Finder := I + 1;
  mov( Get( FName, I ), S);
  Str(I, SS);
  PutForm2(S);
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
  PutForm1(S);
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
  PutForm1(S);
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
  PutForm1(S);
  LMain2.Caption := SS;
end;

procedure TSimpleForm.SetAdd;
begin
  GroupBox1.Caption := 'Add';
  LMain1.Caption   := RCAddMain1;
  LMain2.Caption   := RCAddMain2;

  SetForm(True, False, False, False);
end;

procedure TSimpleForm.SetModify;
begin
  GroupBox1.Caption := 'Modify';
  LMain1.Caption   := RCModifyMain1;
  LMain2.Caption   := RCModifyMain2;

  SetForm(True, True, False, False);
end;

procedure TSimpleForm.SetDelete;
begin
  GroupBox1.Caption := 'Delete';
  LMain1.Caption   := RCDeleteMain1;
  LMain2.Caption   := RCDeleteMain2;

  SetForm(True, False, False, False);
end;

procedure TSimpleForm.SetFind;
begin
  GroupBox1.Caption := 'Find';
  LMain1.Caption   := RCFindMain1;
  LMain2.Caption   := '';

  SetForm(True, False, False, True);
end;

procedure TSimpleForm.SetSearch;
begin
  GroupBox1.Caption := 'Search';
  LMain1.Caption   := RCSearchMain1;
  LMain2.Caption   := '';

  SetForm(True, True, True, False);
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

