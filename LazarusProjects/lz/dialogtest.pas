unit DialogTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  fileName : String;
  isSelected : boolean;
begin
  isSelected:=OpenDialog1.Execute;
  if isSelected then begin
    fileName:=OpenDialog1.FileName;
    Label1.Caption:='Selected File: ' + fileName;
  end;
end;

end.

