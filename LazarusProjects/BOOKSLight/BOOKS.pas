program BOOKS;
{$APPTYPE CONSOLE}
const
  FBooks   = 'Books.dat';

type
  TID = 0..9999;
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
  fpBook    : TBookFile;
  I, N      : Integer;
  
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
      WriteLn(ID);
      WriteLn(FP);
      WriteLn(IERR);
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
    Book : TBook;
    flag : TFind;
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
    reset(fpBook);
    seek(fpBook,0);
    Write(fpBook,Book);
    close(fpBook);
  end;
  
begin
  Write('');
  Init;
  Main;
end.
