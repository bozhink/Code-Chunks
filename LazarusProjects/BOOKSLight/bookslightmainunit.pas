unit BooksLightMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BooksLightBasicProcedures;

var
  I, N  :  Integer;
  
  procedure Add;
  procedure Delete;
  procedure Search;
  procedure Main;
  procedure Init;

implementation

  procedure Add;
  var
    Adder : TAdd;
    Book  : TBook;
  begin
    With Book do begin
      WriteLn('(Adding new book...)');
      WriteLn(''); WriteLn('');
      WriteLn('          Please, fill the form:');
        Write('            + Tilte: '); ReadLn(Title);
      WriteLn('            + Author:');
        Write('              - First Name: '); ReadLn(AuthorFirstName);
        Write('              - Last Name:  '); ReadLn(AuthorLastName);
      WriteLn('            + Edition:');
        Write('              - Name:  '); ReadLn(Edition);
        Write('            + City:    '); ReadLn(City);
        Write('            + Country: '); ReadLn(Country);
        Write('            + Year:    '); ReadLn(Year);
      WriteLn(''); WriteLn('');
    end;
    Adder := AddBook(Book);
    With Adder do begin
      WriteLn(ID,' / ', FP);
      if IERR = -3 then
         WriteLn('Error: Book with this title already exists. ',
                 'You can not add it again.')
      else WriteLn('Error: ', IERR);
    end;
  end;

  procedure Delete;
  var
    Del  : TDelete;
    Book : TBook;
  begin
    With Book do begin
      WriteLn('');WriteLn('(Deleting book...)');
        Write('Enter book`s name to delete: '); Read(Title);
      WriteLn('');WriteLn('');
    end;
    Del := DeleteBook(Book);
    With Del do begin
      WriteLn(ID);
      WriteLn(FP);
      WriteLn(IERR);
    end;
  end;

  procedure Search;
  var
    fpBook  : TBookFile;
    Book    : TBook;
    flag    : TFind;
    Element : TSBook;
  begin
    With Book do begin
      WriteLn('(Search Information:)');
      WriteLn(''); WriteLn('');
      WriteLn('          Please, fill the form:');
        Write('            + Tilte: '); ReadLn(Title);
      WriteLn('            + Author:');
        Write('              - First Name: '); ReadLn(AuthorFirstName);
        Write('              - Last Name:  '); ReadLn(AuthorLastName);
      WriteLn('            + Edition:');
        Write('              - Name:  '); ReadLn(Edition);
        Write('            + City:    '); ReadLn(City);
        Write('            + Country: '); ReadLn(Country);
        Write('            + Year:    '); ReadLn(Year);
      WriteLn(''); WriteLn('');
    end;

    flag := FindNextBook(0, Book);
    while flag.IERR = 0 do begin
      assign(fpBook,FBooks);
      reset(fpBook);
      seek(fpBook,flag.FP);
      read(fpBook,Element);
      close(fpBook);
      With Element do begin
        WriteLn('"',Title,'"',':');
        WriteLn('    ',AuthorFirstName);
        WriteLn('    ',AuthorLastName);
        WriteLn('    ',Edition);
        WriteLn('    ',City);
        WriteLn('    ',Country);
        WriteLn('    ',Year);
      end;

      flag := FindNextBook(flag.FP+1,Book);
    end;
  end;

  procedure Main;
  var
    K1, K2 : Integer;
    Option : String[1];
    Menu   : Boolean;
  begin
    Menu := True;
    While Menu do begin
      WriteLn('');
      WriteLn('');
      WriteLn('          Choose option:');
      WriteLn('            1. Add new book;');
      WriteLn('            2. Delete a book;');
      WriteLn('            3. Modify a book;');
      WriteLn('            4. Search for book;');
      WriteLn('            5. Exit.');
      ReadLn(Option);
      Val(Option,K1,K2);
      If K1 = 1 then Add
      Else If K1 = 2 then Delete
      Else If K1 = 4 then Search
      Else if K1 = 5 then Menu := False
      Else WriteLn('Error: Unknown option ',Option);
      WriteLn('');
      WriteLn('');
    end;
  end;

  procedure Init;
  var
    Book   : TSBook;
    fpBook : TBookFile;
  begin
    With Book do begin
      ID    := 1;
      Title := 'Buffer Record';
      AuthorFirstName := 'Ivan';
      AuthorLastName  := 'Ivanov';
      Edition         := 'No Edition';
      City            := 'Sofia';
      Country         := 'Bulgaria';
      Year            := 2009;
    end;
    assign(fpBook,FBooks);
    rewrite(fpBook);
    seek(fpBook,0);
    Write(fpBook,Book);
    close(fpBook);
  end;

end.

