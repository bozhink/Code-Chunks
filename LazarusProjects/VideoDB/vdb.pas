unit VDB;

{$mode objfpc}{$H+}

interface

uses
  Messages, Variants, Classes, SysUtils, LResources, Forms, Controls, Graphics,
  Dialogs, Menus, ActnList, StdCtrls,
  ComCtrls, ExtCtrls, EditBtn, process, DBGrids, Grids, DbCtrls, dbf, db;

type

  { TForm1 }

  TForm1 = class(TForm)
    AClose: TAction;
    ACancel: TAction;
    ARefresh: TAction;
    APost: TAction;
    AEdit: TAction;
    ADelete: TAction;
    AInsert: TAction;
    ALast: TAction;
    ANext: TAction;
    APrior: TAction;
    AFirst: TAction;
    AQuit: TAction;
    AOpen: TAction;
    ANew: TAction;
    ActionList: TActionList;
    DS: TDatasource;
    DBA: TDbf;
    DBG: TDBGrid;
    DBNavigator1: TDBNavigator;
    MainMenu1: TMainMenu;
    MIRefresh: TMenuItem;
    MICancel: TMenuItem;
    MIPost: TMenuItem;
    MIDelete: TMenuItem;
    MIEdit: TMenuItem;
    MIInsert: TMenuItem;
    N2: TMenuItem;
    MINext: TMenuItem;
    MIPrior: TMenuItem;
    MILast: TMenuItem;
    MIFirst: TMenuItem;
    MIRecord: TMenuItem;
    MIExit: TMenuItem;
    N1: TMenuItem;
    MIClose: TMenuItem;
    MIOpen: TMenuItem;
    MINew: TMenuItem;
    MFile: TMenuItem;
    ODDBA: TOpenDialog;
    PageControl: TPageControl;
    SDDBA: TSaveDialog;
    StatusBar: TStatusBar;
    TableViewTab: TTabSheet;
    FormViewTab: TTabSheet;
    
    procedure MIExitClick(Sender: TObject);
    procedure ANewExecute(Sender : TObject);
    procedure AOpenExecute(Sender : TObject);
    procedure ACloseExecute(Sender : TObject);
    procedure ACloseUpdate(Sender : TObject);
    procedure DataOpen(Sender : TObject);
    procedure DoDataAction(Sender : TObject);
    procedure FormCloseQuery(Sender : TObject; var CanClose : Boolean);
    procedure FormClose(Sender : TObject; var CloseAction : TCloseAction);
    procedure DBAAfterInsert(DataSet : TDataSet);
    procedure HaveDataNotEmpty(Sender : TObject);
    procedure InEditMode(Sender : TObject);
  private
    procedure CreateTable(AFileName : String);
    procedure OpenTable(AFileName : String);
    procedure CloseTable;
  public
  end; 

var
  Form1: TForm1; 

implementation


resourcestring
  SSaveData = 'There is still unsaved data. Save Now?';

{ TForm1 }

procedure TForm1.CreateTable(AFileName : String);
begin
  With DBA do begin
    Close;
    With FieldDefs do begin
      Clear;
      Add('Title',ftString,100);
      Add('Director',ftString,30);
      Add('Producer',ftString,30);
      Add('Cast',ftString,30);
      Add('Country',ftString,30);
      Add('Gender',ftString,20);
      Add('Year',ftString,4);
      Add('Description',ftString,30);
      Add('Comments',ftString,30);
      Add('Languages',ftString,30);
      Add('Sutitles',ftString,30);
      Add('Duration',ftString,30);
    end;
    TableName := AFileName;
    CreateTable;
    Exclusive := true;
    Open;
    AddIndex('Title', 'Title', []);
    end;
end;

procedure TForm1.OpenTable(AFileName: String);
begin
  With DBA do begin
    Close;
    TableName := AFileName;
    Open;
  end;
end;

procedure TForm1.CloseTable;
begin
  DBA.Close;
end;
  

procedure TForm1.MIExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ANewExecute(Sender: TObject);
begin
  With SDDBA do
    If Execute then CreateTable(FileName);
end;

procedure TForm1.AOpenExecute(Sender: TObject);
begin
  With ODDBA do
    If Execute then OpenTable(FileName);
end;

procedure TForm1.ACloseExecute(Sender: TObject);
begin
  CloseTable;
end;

procedure TForm1.ACloseUpdate(Sender : TObject);
begin
  (Sender As TAction).Enabled := Not (DBA.State in dsEditModes);
end;

procedure TForm1.DataOpen(Sender: TObject);
begin
  With DBA do
    (Sender As TAction).Enabled := Active;
end;

procedure TForm1.DoDataAction(Sender: TObject);
begin
  Case (Sender As TAction).Tag of
    0 : DBA.First;
    1 : DBA.Prior;
    2 : DBA.Next;
    3 : DBA.Last;
    4 : DBA.Insert;
    5 : DBA.Delete;
    6 : DBA.Edit;
    7 : DBA.Post;
    8 : DBA.Cancel;
    9 : DBA.Refresh;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Not (DBA.State in dsEditModes);
  if not CanClose then
    case MessageDlg(SSaveData, mtWarning, [mbYes,mbNo,mbCancel],0) of
      mrYes : begin
              DBA.Post;
              CanClose := True;
              end;
      mrNo  : CanClose := True;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DBA.Close;
end;

procedure TForm1.DBAAfterInsert(DataSet: TDataSet);
begin

end;

procedure TForm1.HaveDataNotEmpty(Sender: TObject);
begin
  With DBA do
    (Sender As TAction).Enabled := Active and Not (EOF and BOF);
end;

procedure TForm1.InEditMode(Sender: TObject);
begin
  With DBA do
    (Sender As TAction).Enabled := State in dsEditModes;
end;

initialization
  {$I vdb.lrs}

end.

