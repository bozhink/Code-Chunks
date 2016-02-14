unit Translate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function Translate(WrongText: String;K:Integer):String;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

function TForm1.Translate(WrongText:String;K:Integer):String;
var
  EnChars : String;
  BgChars : String;
  I : Integer;
begin
  EnChars := ' `1234567890-=~!@#$%^&*()_+qwertyuiop[]asdfghjkl;\zxcvbnm,./QWERTYUIOP{}ASDFGHJKL:"|ZXCVBNM<>?';
  BgChars := ' `1234567890-.~!?+"%=:/_¹²V,óåèøùêñäçö;üÿàîæãòíâì(şéúıôõïğëáûÓÅÈØÙÊÑÄÇÖ§ÜßÀÎÆÃÒÍÂÌ×)ŞÉÚİÔÕÏĞËÁ';
  Translate:='';
  If K=1 then
    for I:=1 To Length(WrongText) do
      Translate:=Translate+BgChars[Pos(WrongText[I],EnChars)]
  else
    for I:=1 To Length(WrongText) do
      Translate:=Translate+EnChars[Pos(WrongText[I],BgChars)];
  //Translate:=WrongText;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit2.Text := Translate(Edit1.Text,1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text := Translate(Edit2.Text,2);
end;

initialization
  {$I translate.lrs}

end.

