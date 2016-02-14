{
 ***************************************************************************
 *                                                                         *
 *   This source is free software; you can redistribute it and/or modify   *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This code is distributed in the hope that it will be useful, but      *
 *   WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     *
 *   General Public License for more details.                              *
 *                                                                         *
 *   A copy of the GNU General Public License is available on the World    *
 *   Wide Web at <http://www.gnu.org/copyleft/gpl.html>. You can also      *
 *   obtain it by writing to the Free Software Foundation,                 *
 *   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.        *
 *                                                                         *
 ***************************************************************************
}
unit frmmain;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Dbf, Grids, DBGrids, DBCtrls, ExtCtrls, ActnList, Menus,
  StdCtrls,lresources;

type
  TDataSetFirst = TAction;
  TDataSetPrior = TAction;
  TDataSetNext = TAction;
  TDataSetLast = TAction;
  TDataSetInsert = TAction;
  TDataSetDelete = TAction;
  TDataSetEdit = TAction;
  TDataSetPost = TAction;
  TDataSetCancel = TAction;
  TDataSetRefresh = TAction;

  { TMainForm }

  TMainForm = class(TForm)
    EDuration: TDBEdit;
    LDuration: TLabel;
    MMain: TMainMenu;
    MFile: TMenuItem;
    ALMain: TActionList;
    ANew: TAction;
    AOpen: TAction;
    AClose: TAction;
    AQuit: TAction;
    MINew: TMenuItem;
    MIOpen: TMenuItem;
    PTop: TPanel;
    DBNavigator1: TDBNavigator;
    GDBA: TDBGrid;
    PBottom: TPanel;
    DBA: TDbf;
    SDDBA: TSaveDialog;
    ODDBA: TOpenDialog;
    DSAddress: TDataSource;
    ETitle: TDBEdit;
    EDirector: TDBEdit;
    EProducer: TDBEdit;
    ECast: TDBEdit;
    ECountry: TDBEdit;
    ESubtitles: TDBEdit;
    EYear: TDBEdit;
    EDescription: TDBEdit;
    EComments: TDBEdit;
    ELanguages: TDBEdit;
    EGender: TDBEdit;
    LTitle: TLabel;
    LDirector: TLabel;
    LProducer: TLabel;
    LCast: TLabel;
    LGender: TLabel;
    LYear: TLabel;
    LCountry: TLabel;
    LDescription: TLabel;
    LComments: TLabel;
    LLanguages: TLabel;
    LSubtitles: TLabel;
    MIClose: TMenuItem;
    N1: TMenuItem;
    MIQuit: TMenuItem;
    AFirst: TDataSetFirst;
    APrior: TDataSetPrior;
    ANext: TDataSetNext;
    ALast: TDataSetLast;
    AInsert: TDataSetInsert;
    ADelete: TDataSetDelete;
    AEdit: TDataSetEdit;
    APost: TDataSetPost;
    ACancel: TDataSetCancel;
    ARefresh: TDataSetRefresh;
    Record1: TMenuItem;
    MIFirst: TMenuItem;
    MILAst: TMenuItem;
    MIPrior: TMenuItem;
    MINext: TMenuItem;
    N2: TMenuItem;
    MIEdit: TMenuItem;
    MIDelete: TMenuItem;
    MIPost: TMenuItem;
    MICancel: TMenuItem;
    MIRefresh: TMenuItem;
    MIInsert: TMenuItem;
    procedure ANewExecute(Sender: TObject);
    procedure AOpenExecute(Sender: TObject);
    procedure ACloseExecute(Sender: TObject);
    procedure ACloseUpdate(Sender: TObject);
    procedure AQuitExecute(Sender: TObject);
    procedure DataOpen(Sender: TObject);
    procedure DoDataAction(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure DBAAfterInsert(DataSet: TDataSet);
    procedure HaveDataNotEmpty(Sender: TObject);
    procedure InEditMode(Sender: TObject);
  private
    procedure CreateTable(AFileName : String);
    procedure OpenTable(AFileName: String);
    procedure CloseTable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation


resourcestring
  SSaveData = 'There is still unsaved data. Save now ?';

{ Action  handlers }

procedure TMainForm.ANewExecute(Sender: TObject);
begin
  With SDDBA do
    If Execute then
      CreateTable(FileName);
end;

procedure TMainForm.ACloseExecute(Sender: TObject);
begin
  CloseTable;
end;

procedure TMainForm.ACloseUpdate(Sender: TObject);
begin
  (Sender as Taction).Enabled:=Not (DBA.State in dsEditModes);
end;
procedure TMainForm.CreateTable(AFileName : String);

begin
  With DBA do
    begin
    Close;
    with FieldDefs do
      begin
      Clear;
      Add('Title',ftString,30);
      Add('Director',ftString,30);
      Add('Producer',ftString,50);
      Add('Cast',ftString,20);
      Add('Gender',ftString,30);
      Add('Country',ftString,30);
      Add('Year',ftString,4);
      Add('Description',ftString,15);
      Add('Comments',ftString,15);
      Add('Languages',ftString,100);
      Add('Subtitles',ftString,100);
      Add('Duration',ftString,64);
      end;
    TableName:=AFileName;
    CreateTable;
    Exclusive := true;
    Open;
    AddIndex('Title', 'Title', []);
    end;
end;

procedure TMainForm.AOpenExecute(Sender: TObject);
begin
  With ODDBA  do
    if Execute then
      OpenTable(FileName);
end;

procedure TMainForm.OpenTable(AFileName : String);

begin
  With DBA do
    begin
    Close;
    TableName:=AFileName;
    Open;
    end;
end;

procedure TMainForm.CloseTable;

begin
  DBA.Close;
end;

procedure TMainForm.AQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.DataOpen(Sender: TObject);
begin
  With DBA do
    (Sender as Taction).Enabled:=Active;
end;

procedure TMainForm.DoDataAction(Sender: TObject);
begin
  Case (Sender as TAction).Tag of
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

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=Not (DBA.State in dsEditModes);
  if Not CanClose then
    case MessageDlg(SSaveData,mtWarning,[mbYes,mbNo,mbCancel],0) of
      mrYes : begin
              DBA.Post;
              CanClose:=True;
              end;
      mrNo  : CanClose:=True;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DBA.Close;
end;

procedure TMainForm.DBAAfterInsert(DataSet: TDataSet);
begin
  ETitle.SetFocus;
end;

procedure TMainForm.HaveDataNotEmpty(Sender: TObject);
begin
  With DBA do
    (Sender as Taction).Enabled:=Active and Not (EOF and BOF);
end;

procedure TMainForm.InEditMode(Sender: TObject);
begin
  With DBA do
    (Sender As Taction).EnAbled:=State in dsEditModes;
end;

initialization
{$i frmmain.lrs}
end.
