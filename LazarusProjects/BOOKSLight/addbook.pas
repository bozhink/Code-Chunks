unit AddBook;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TAddForm }

  TAddForm = class(TForm)
    AuthorEdt: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PriceEdt: TEdit;
    TitleTEdt: TEdit;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AddForm: TAddForm;

implementation

initialization
  {$I addbook.lrs}

end.

