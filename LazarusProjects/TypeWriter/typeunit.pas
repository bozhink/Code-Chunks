unit TypeUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 
var Latin: String;
var Cyril: String;
var Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  I:integer;
begin
  Latin:='`1234567890qwertyuiop[]QWERTYUIOP{}asdfghjklASDFGHJKLzxcvbnm,ZXCVBNM<>? ';
  Cyril:='(1234567890,уеишщксдзц;ыУЕИШЩКСДЗЦ§ьяаожгтнвѝЯАОЖГТНВюйъэфхпрЮЙЪЭФХПРЛБ ';
  //Memo2.Text:='';
  for I:=1 to Length(Memo1.Text) do
    //Memo2.Text:=Cyril[Pos(Memo1.Text[I],Latin)];
    Memo2.Text:=Memo2.Text+Cyril[22]+'уши'+Memo1.Text[I]+Latin[32];

(*  for i:=1 to Length(InpText) do
      KodText:=KodText+Alphabet[Pos(InpText[i],Alphabet) + K];    *)
end;

end.

