unit BooksLightBasicProcedures;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  FBooks   = 'Books.dat';

type
  TName  = String[32];
  TTitle = String[255];
  TSBook = record
    ID              : Integer;
    Title           : TTitle;
    AuthorFirstName : TName;
    AuthorLastName  : TName;
    Edition         : TName;
    City            : TName;
    Country         : TName;
    Year            : Integer;
    end;
  TBook  = record
    Title           : TTitle;
    AuthorFirstName : TName;
    AuthorLastName  : TName;
    Edition         : TName;
    City            : TName;
    Country         : TName;
    Year            : Integer;
    end;

  TAction = record
    ID   : Integer;
    FP   : Integer;
    IERR : Integer;
    end;
  TFind        = TAction;
  TAdd         = TAction;
  TModify      = TAction;
  TDelete      = TAction;
  TBookFile    = file of TSBook;

var
  I, N  :  Integer;

  function FindNextBook(fpBookPosition : Integer; Book : TBook) : TFind;
  function AddBook(Book : TBook) : TAdd;
  function DeleteBook(Book : TBook) : TDelete;
  function ModifyBook(BookOld, BookNew : TBook) : TModify;

implementation


  function FindNextBook(fpBookPosition : Integer; Book : TBook) : TFind;
  var
    fpBook  : TBookFile;
    Element : TSBook;
    Match   : Boolean;
  begin
    assign(fpBook,FBooks);
    reset(fpBook);
    if fpBookPosition < filesize(fpBook) then begin
      Match := False;
      While (not Match) and (not eof(fpBook)) do begin
        Read(fpBook,Element);
        With Element do
        Match := (Title = Book.Title) or
                 (AuthorFirstName = Book.AuthorFirstName) or
                 (AuthorLastName = Book.AuthorLastName) or
                 (Edition = Book.Edition) or
                 (City = Book.City) or
                 (Country = Book.Country) or
                 (Year = Book.Year);
      end;
      If (not Match) and eof(fpBook) then begin
        FindNextBook.ID   := -1;
        FindNextBook.FP   := filepos(fpBook);
        FindNextBook.IERR := -1;
        {There is no match, but the end of the file is reached}
      end else begin
        FindNextBook.ID   := Element.ID;
        FindNextBook.FP   := filepos(fpBook);
        FindNextBook.IERR := 0;
      end;
    end else begin
      FindNextBook.ID   := -1;
      FindNextBook.FP   := filepos(fpBook)-1;
      FindNextBook.IERR := -2;
      {Input parameters are wrong}
    end;
    close(fpBook);
  end;

  function AddBook(Book : TBook) : TAdd;
  var
    fpBook       : TBookFile;
    Element      : TSBook;
    Finder       : TBook;
    flag         : TFind;
    N            : Integer;
  begin
    With Finder do begin
      Title           := Book.Title;
      AuthorFirstName := '';
      AuthorLastName  := '';
      Edition         := '';
      City            := '';
      Country         := '';
      Year            := -9999;
    end;
    With Element do begin
      ID              := 0;
      Title           := Book.Title;
      AuthorFirstName := Book.AuthorFirstName;
      AuthorLastName  := Book.AuthorLastName;
      Edition         := Book.Edition;
      City            := Book.City;
      Country         := Book.Country;
      Year            := Book.Year;
    end;

    flag := FindNextBook(0, Finder);

    If flag.IERR = 0 then begin
      {Book already exists}
      AddBook.ID   := flag.ID;
      AddBook.FP   := flag.FP;
      AddBook.IERR := -3;
    end
    else if flag.IERR = -2 then begin
      {There is an error in file size}
      AddBook.ID   := -1;
      AddBook.FP   := -1;
      AddBook.IERR := -2;
    end
    else begin
      assign(fpBook,FBooks);
      reset(fpBook);
      If flag.ID = 0 then begin
        {Book has been deleted}
        AddBook.ID   := flag.FP+1;
        AddBook.FP   := flag.FP;
        AddBook.IERR := 1;
        seek(fpBook,flag.FP);
        Element.ID := flag.FP+1;
      end
      Else begin
        N := filesize(fpBook);
        seek(fpBook,N);
        Element.ID   := N+1;
        AddBook.ID   := N+1;
        AddBook.FP   := N;
        AddBook.IERR := 0;
      end;
      Write(fpBook,Element);
      close(fpBook);
    end;
  end;

  function DeleteBook(Book : TBook) : TDelete;
  var
    fpBook  : TBookFile;
    flag    : TFind;
    Element : TSBook;
    Finder  : TBook;
  begin
    With Finder do begin
      Title           := Book.Title;
      AuthorFirstName := '';
      AuthorLastName  := '';
      Edition         := '';
      City            := '';
      Country         := '';
      Year            := -9999;
    end;
    flag := FindNextBook(0,Finder);

    If flag.IERR = -1 then begin
      {Book does not exist}
      DeleteBook.ID   := -1;
      DeleteBook.FP   := -1;
      DeleteBook.IERR := -4;
    end
    else if flag.IERR = -2 then begin
      {There is a problem with the file}
      DeleteBook.ID   := -1;
      DeleteBook.FP   := -1;
      DeleteBook.IERR := -2;
    end
    Else begin
      assign(fpBook,FBooks);
      reset(fpBook);

      seek(fpBook,flag.FP);
      Read(fpBook,Element);
      Element.ID := 0;

      seek(fpBook,flag.FP);
      Write(fpBook,Element);
      close(fpBook);

      DeleteBook.ID   := 0;
      DeleteBook.FP   := flag.FP;
      DeleteBook.IERR := 0;
    end;
  end;


  function ModifyBook(BookOld, BookNew : TBook) : TModify;
  var
    fpBook       : TBookFile;
    flag         : TFind;
    Element      : TSBook;
    Finder       : TBook;
  begin
    With Finder do begin
      Title           := BookOld.Title;
      AuthorFirstName := '';
      AuthorLastName  := '';
      Edition         := '';
      City            := '';
      Country         := '';
      Year            := -9999;
    end;
    With Element do begin
      ID              := 0;
      Title           := BookNew.Title;
      AuthorFirstName := BookNew.AuthorFirstName;
      AuthorLastName  := BookNew.AuthorLastName;
      Edition         := BookNew.Edition;
      City            := BookNew.City;
      Country         := BookNew.Country;
      Year            := BookNew.Year;
    end;

    flag := FindNextBook(0, Finder);

    If flag.IERR = -1 then begin
      {Book does not exist}
      ModifyBook.ID   := -1;
      ModifyBook.FP   := -1;
      ModifyBook.IERR := -5;
    end
    Else if flag.IERR = -2 then begin
      ModifyBook.ID   := -1;
      ModifyBook.FP   := -1;
      ModifyBook.IERR := -2;
    end
    Else begin
      assign(fpBook,FBooks);
      reset(fpBook);
      seek(fpBook, flag.FP);

      If flag.ID = 0 then begin
        {Book has been deleted}
        ModifyBook.ID   := flag.FP+1;
        ModifyBook.FP   := flag.FP;
        ModifyBook.IERR := 2;
        Element.ID      := flag.FP+1;
      end
      Else begin
        Element.ID      := flag.ID;
        ModifyBook.ID   := flag.ID;
        ModifyBook.FP   := flag.FP;
        ModifyBook.IERR := 0;
      end;

      Write(fpBook,Element);
      close(fpBook);
    end;
  end;

end.

