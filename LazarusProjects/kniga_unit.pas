unit KNIGA_Unit;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils; 

const
  FB = 'Knigi.dat';

type
  TName = String[30];

  TBook = record
    Name, Author : TName;
    Price : Real;
  end;

var
  F : file of TBook;
  B : TBook;
  I : Integer;
  
  procedure Init();
  procedure Add();
  procedure Delete();
  procedure Modify();
  procedure ReadBook();
  
  function AddBook(Book : TBook) : Integer;
  function DelBook(Title : TName) : Integer;
  function ModBook(BookOld, BookNew : TBook) : Integer;
  
implementation

procedure Init();
begin
  assign(F,FB);
  Rewrite(F);
  with B do begin
    writeln('Enter Book No ', I);
    write('Name:  '); readln(Name);
    write('Author:  '); readln(Author);
    write('Price:  '); readln(Price);
  end;
  write(F, B);
  close(F);
end;

procedure Add();
var
  Book : TBook;
  N : Integer;
begin
  Writeln('Adding new book...');
  Write('Title:  '); Readln(Book.Name);
  Write('Author: '); Readln(Book.Author);
  Write('Price:  '); Readln(Book.Price);
  N := AddBook(Book);
  Write(N);
end;

procedure Delete();
var
  Book : TBook;
  N : Integer;
begin
  Writeln('Deleting old book...');
  Write('Title:  '); Readln(Book.Name);
  Book.Author := '  ';
  Book.Price := 0.00;
  N := DelBook(Book.Name);
  WriteLn(N);
end;

procedure Modify();
var
  BookOld, BookNew : TBook;
  N : Integer;
begin
  Writeln('Modifying old book...');
  Write('Old Book Title:  '); Readln(BookOld.Name);
  BookOld.Author := '  ';
  BookOld.Price := 0.00;
  Write('New Book Title:  '); Readln(BookNew.Name);
  Write('New Book Author: '); Readln(BookNew.Author);
  Write('New Book Price:  '); Readln(BookNew.Price);
  N := ModBook(BookOld, BookNew);
  WriteLn(N);
end;

procedure ReadBook();
begin
  assign(F,FB);
  reset(F);
  while not eof(F) do begin
    read(F,B);
    with B do
      writeln(Name:31, Author:31, Price:8:2);
  end;
  close(F);
end;

function AddBook(Book : TBook) : Integer;
begin
  assign(F, FB);
  reset(F);
  write(F, Book);
  close(F);
  AddBook := 0;
end;

function DelBook(Title : TName) : Integer;
var
  Book : TBook;
begin
  assign(F, FB);
  reset(F);
  read(F,Book);
  while not ( (Title = Book.Name) or eof(F) ) do begin
    read(f, Book);
  end;
  if eof(F) then DelBook := -1
  else begin
    with Book do begin
      Name := '  ';
      Author := '  ';
      Price := 0.00;
    end;
    seek(F, filepos(F)-1);
    write(F, Book);
    DelBook := 0;
  end;
  close(F);
end;

  
function ModBook(BookOld, BookNew : TBook) : Integer;
var
  Book : TBook;
begin
  assign(F, FB);
  reset(F);
  read(F,Book);
  while not ( (BookOld.Name = Book.Name) or eof(F) ) do begin
    read(f, Book);
  end;
  if eof(F) then ModBook := -1
  else begin
    seek(F, filepos(F)-1);
    write(F, BookNew);
    ModBook := 0;
  end;
  close(F);
end;

end.

