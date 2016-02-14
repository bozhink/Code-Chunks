program BOOKS;
{$APPTYPE CONSOLE}
uses TypesUnit, BooksUnit;
const
  FBooks   = 'Books.dat';
  FAuthor  = 'Author.dat';
  FCity    = 'City.dat';
  FEdition = 'Edition.dat';

type
  TName = String[32];
  TTitle = String[255];
  TID = 0..9999;
  TBook = record
    ID        : TID;
    Title     : TTitle;
    AuthorID  : TID;
    EditionID : TID;
    CityID    : TID;
    Year      : Integer;
    end;
  TAuthor = record
    ID        : TID;
    FirstName : TName;
    LastName  : TName;
    end;
  TCity = record
    ID      : TID;
    Name    : TName;
    Country : TName;
    end;
  TEdition = record
    ID     : TID;
    Name   : TName;
    CityID : TID;
    end;
  TBookFile    = file of TBook;
  TAuthorFile  = file of TAuthor;
  TCityFile    = file of TCity;
  TEditionFile = file of TEdition;
  TFind = array[1..2] of Integer;
  TAdd  = array[1..2] of Integer;

var
  fpBook    : TBookFile;
  fpAuthor  : TAuthorFile;
  fpCity    : TCityFile;
  fpEdition : TEditionFile;
  I, N      : Integer;
  
  function FindBook(BookTitle : TTitle) : TFind;
  var
    Book : TBook;
    EndOfFile : Boolean;
  begin
    assign(fpBook,FBooks);
    reset(fpBook);
    FindBook[1] := -1;
    FindBook[2] := -1;
    EndOfFile := eof(fpBook);
    While not EndOfFile do begin
      Read(fpBook,Book);
      EndOfFile := eof(fpBook);
      If Book.Title = BookTitle then begin
        FindBook[1] := Book.ID;
        FindBook[2] := filepos(fpBook);
        EndOfFile := True;
      end;
    end;
    close(fpBook);
  end;

  function FindAuthor(AuthorName : TName) : TFind;
  var
    Author : TAuthor;
    EndOfFile : Boolean;
  begin
    assign(fpAuthor,FAuthor);
    reset(fpAuthor);
    FindAuthor[1] := -1;
    FindAuthor[2] := -1;
    EndOfFile := eof(fpAuthor);
    While not EndOfFile do begin
      Read(fpAuthor,Author);
      EndOfFile := eof(fpAuthor);
      If Author.LastName = AuthorName then begin
        FindAuthor[1] := Author.ID;
        FindAuthor[2] := filepos(fpAuthor);
        EndOfFile := True;
      end;
    end;
    close(fpAuthor);
  end;
  
  function FindCity(CityName : TName) : TFind;
  var
    City : TCity;
    EndOfFile : Boolean;
  begin
    assign(fpCity,FCity);
    reset(fpCity);
    FindCity[1] := -1;
    FindCity[2] := -1;
    EndOfFile := eof(fpCity);
    While not EndOfFile do begin
      Read(fpCity,City);
      EndOfFile := eof(fpCity);
      If City.Name = CityName then begin
        FindCity[1] := City.ID;
        FindCity[2] := filepos(fpCity);
        EndOfFile := True;
      end;
    end;
    close(fpCity);
  end;

  function FindEdition(EditionName : TName) : TFind;
  var
    Edition : TEdition;
    EndOfFile : Boolean;
  begin
    assign(fpEdition,FEdition);
    reset(fpEdition);
    FindEdition[1] := -1;
    FindEdition[2] := -1;
    EndOfFile := eof(fpEdition);
    While not EndOfFile do begin
      Read(fpEdition,Edition);
      EndOfFile := eof(fpEdition);
      If Edition.Name = EditionName then begin
        FindEdition[1] := Edition.ID;
        FindEdition[2] := filepos(fpEdition);
        EndOfFile := True;
      end;
    end;
    close(fpEdition);
  end;

  function AddCity(CityName, CountryName : TName) : TAdd;
  {Returns the physical position of the element is it already exists 
       and -1 if it was appended to the file
       and other negative number if the record was re-created}
  var
    flag : TFind;
    City : TCity;
  begin
    City.ID      := 0;
    City.Name    := CityName;
    City.Country := CountryName;
    flag := FindCity(CityName);
    If flag[1] > 0 then begin
      AddCity[1] := flag[2]; {City already exists}
      AddCity[2] := flag[1];
    end
    Else begin
      assign(fpCity,FCity);
      reset(fpCity);
      If flag[1] = 0 then begin {City was deleted}
        AddCity[1] := -flag[2];
        AddCity[2] := flag[1];
        seek(fpCity,flag[2]);
        City.ID := flag[2];
      end
      Else begin
        AddCity[1] := -1;
        AddCity[2] := flag[1];
        N := filesize(fpCity);
        seek(fpCity,N-1);
        City.ID := N;
        Write(fpCity,City);
      end;
      close(fpCity);
    end;
  end;

  function AddAuthor(AuthorFirstName, AuthorLastName : TName) : TAdd;
  {Returns the physical position of the element is it already exists 
       and -1 if it was appended to the file
       and other negative number if the record was re-created}
  var
    flag   : TFind;
    Author : TAuthor;
  begin
    Author.ID        := 0;
    Author.FirstName := AuthorFirstName;
    Author.LastName  := AuthorLastName;
    flag := FindAuthor(AuthorLastName);
    If flag[1] > 0 then begin
      AddAuthor[1] := flag[2]; {Author already exists}
      AddAuthor[2] := flag[1];
    end
    Else begin
      assign(fpAuthor,FAuthor);
      reset(fpCity);
      If flag[1] = 0 then begin {Author was deleted}
        AddAuthor[1] := -flag[2];
        AddAuthor[2] :=  flag[1];
        seek(fpAuthor,flag[2]);
        Author.ID := flag[2];
      end
      Else begin
        AddAuthor[1] := -1;
        AddAuthor[2] := flag[1];
        N := filesize(fpAuthor);
        seek(fpAuthor,N-1);
        Author.ID := N;
        Write(fpAuthor,Author);
      end;
      close(fpAuthor);
    end;
  end;

  function AddEdition(EditionName, CityName, CountryName : TName) : TAdd;
  {Returns the physical position of the element is it already exists 
       and -1 if it was appended to the file
       and other negative number if the record was re-created}
  var
    flag     : TFind;
    Adder    : TAdd;
    Edition  : TEdition;
  begin
    Edition.ID      := 0;
    Edition.Name    := EditionName;
    Edition.CityID  := 0;
    flag := FindEdition(EditionName);
    If flag[1] > 0 then begin
      AddEdition[1] := flag[2]; {Edition already exists}
      AddEdition[2] := flag[1];
    end
    Else begin
      Adder := AddCity(CityName, CountryName);
      assign(fpEdition,FEdition);
      reset(fpEdition);
      If flag[1] = 0 then begin {Edition was deleted}
        AddEdition[1] := -flag[2];
        AddEdition[2] :=  flag[1];
        seek(fpEdition,flag[2]);
        Edition.ID := flag[2];
      end
      Else begin
        AddEdition[1] := -1;
        AddEdition[2] := flag[2];
        N := filesize(fpEdition);
        seek(fpEdition,N-1);
        Edition.ID := N;
        Edition.CityID := Adder[2];
        Write(fpEdition,Edition);
      end;
      close(fpEdition);
    end;
  end;


  function AddBook(BookTitle : TTitle; AuthorFirstName, AuthorLastName : TName;
                   EditionName, CityName, CountryName : TName;
                   EditionYear : Integer) : TAdd;
  var
    Book         : TBook;
    flag         : TFind;
    AdderEdition : TAdd;
    AdderAuthor  : TAdd;
    AdderCity    : TAdd;
  begin
    Book.ID        := 0;
    Book.Title     := BookTitle;
    Book.AuthorID  := 0;
    Book.EditionID := 0;
    Book.CityID    := 0;
    Book.Year      := EditionYear;
    flag := FindBook(BookTitle);
    If flag[1] > 0 then begin
      AddBook[1] := flag[2]; {Book already exists}
      AddBook[2] := flag[1];
    end
    Else begin
      AdderEdition := AddEdition(EditionName, CityName, CountryName);
      AdderAuthor  := AddAuthor(AuthorFirstName, AuthorLastName);
      AdderCity    := AddCity(CityName, CountryName);
      assign(fpBook,FBooks);
      reset(fpBook);
      If flag[1] = 0 then begin {Book was deleted}
        AddBook[1] := -flag[2];
        AddBook[2] := flag[1];
        seek(fpBook,flag[2]);
        Book.ID := flag[2];
      end
      Else begin
        AddBook[1] := -1;
        AddBook[2] := flag[1];
        N := filesize(fpBook);
        seek(fpBook,N-1);
        Book.ID := N;
        Book.AuthorID  := AdderAuthor[2];
        Book.EditionID := AdderEdition[2];
        Book.CityID    := AdderCity[2];
        Write(fpBook,Book);
      end;
      close(fpBook);
    end;
  end;

  function DeleteCity(CityName : TName) : Integer;
  var
    flag : TFind;
    City : TCity;
  begin
    flag := FindCity(CityName);
    If flag[1] < 0 then
      DeleteCity := -1 {City does not exist}
    Else begin
      assign(fpCity,FCity);
      reset(fpCity);
      seek(fpCity,flag[2]);
      Read(fpCity,City);
      City.ID := 0;
      seek(fpCity,flag[2]);
      Write(fpCity,City);
      close(fpCity);
      DeleteCity := 0; {City was deleted}
    end;
  end;

  function DeleteAuthor(AuthorLastName : TName) : Integer;
  var
    flag : TFind;
    Author : TAuthor;
  begin
    flag := FindAuthor(AuthorLastName);
    If flag[1] < 0 then
      DeleteAuthor := -1 {Author does not exist}
    Else begin
      assign(fpAuthor,FAuthor);
      reset(fpAuthor);
      seek(fpAuthor,flag[2]);
      Read(fpAuthor,Author);
      Author.ID := 0;
      seek(fpAuthor,flag[2]);
      Write(fpAuthor,Author);
      close(fpAuthor);
      DeleteAuthor := 0; {Author was deleted}
    end;
  end;

  function DeleteEdition(EditionName : TName) : Integer;
  var
    flag : TFind;
    Edition : TEdition;
  begin
    flag := FindEdition(EditionName);
    If flag[1] < 0 then
      DeleteEdition := -1 {Edition does not exist}
    Else begin
      assign(fpEdition,FEdition);
      reset(fpEdition);
      seek(fpEdition,flag[2]);
      Read(fpEdition,Edition);
      Edition.ID := 0;
      seek(fpEdition,flag[2]);
      Write(fpEdition,Edition);
      close(fpEdition);
      DeleteEdition := 0; {Edition was deleted}
    end;
  end;

  function DeleteBook(BookTitle : TTitle) : Integer;
  var
    flag : TFind;
    Book : TBook;
  begin
    flag := FindBook(BookTitle);
    If flag[1] < 0 then
      DeleteBook := -1 {Book does not exist}
    Else begin
      assign(fpBook,FBooks);
      reset(fpBook);
      seek(fpBook,flag[2]);
      Read(fpBook,Book);
      Book.ID := 0;
      seek(fpBook,flag[2]);
      Write(fpBook,Book);
      close(fpBook);
      DeleteBook := 0; {Book was deleted}
    end;
  end;

  function ModifyCity(CityNameOld, CountryNameOld, CityNameNew, CountryNameNew : TName) : Integer;
  {Returns -1 if does not exist; -2 if is deleted; position in file if modifyed}
  var
    flag : TFind;
    City : TCity;
  begin
    City.Name    := CityNameNew;
    City.Country := CountryNameNew;
    flag := FindCity(CityNameOld);
    If flag[1] < 0 then 
      ModifyCity := -1 {City does not exist}
    Else if flag[1] = 0 then
      ModifyCity := -2 {City has been deleted}
    Else begin
      assign(fpCity,FCity);
      reset(fpCity);
      seek(fpCity,flag[2]);
      City.ID := flag[1];
      Write(fpCity,City);
      close(fpCity);
      ModifyCity := 0; {Action is successful}
    end;
  end;

  function ModifyAuthor(AuthorFirstNameOld, AuthorLastNameOld, AuthorFirstNameNew, AuthorLastNameNew : TName) : Integer;
  {Returns -1 if does not exist; -2 if is deleted; position in file if modifyed}
  var
    flag : TFind;
    Author : TAuthor;
  begin
    Author.FirstName := AuthorFirstNameNew;
    Author.LastName  := AuthorLastNameNew;
    flag := FindAuthor(AuthorLastNameOld);
    If flag[1] < 0 then 
      ModifyAuthor := -1 {Author does not exist}
    Else if flag[1] = 0 then
      ModifyAuthor := -2 {Author has been deleted}
    Else begin
      assign(fpAuthor,FAuthor);
      reset(fpAuthor);
      seek(fpAuthor,flag[2]);
      Author.ID := flag[1];
      Write(fpAuthor,Author);
      close(fpAuthor);
      ModifyAuthor := 0; {Action is successful}
    end;
  end;

  function ModifyEdition(EditionNameOld, EditionNameNew, CityNameOld, CountryNameOld, CityNameNew, CountryNameNew : TName;
                         ModifyRelatedCity : Integer) : Integer;
  var
    flag     : TFind;
    Adder    : TAdd;
    Edition  : TEdition;
    Modify   : Integer;
  begin
    flag := FindEdition(EditionNameOld);
    If flag[1] < 0 then
      ModifyEdition := -1 {Edition does not exist}
    Else if flag[1] = 0 then
      ModifyEdition := -2 {Edition has been deleted}
    Else begin
      Modify := 0;
      assign(fpEdition,FEdition);
      reset(fpEdition);
      seek(fpEdition, flag[2]);
      Read(fpEdition,Edition);
      Adder[1] := -1;
      Adder[2] := Edition.CityID;
      close(fpEdition);
      If ModifyRelatedCity = 0 then
        Modify := ModifyCity(CityNameOld, CountryNameOld, CityNameNew, CountryNameNew);
      If (ModifyRelatedCity > 0) or (Modify < 0) then
        Adder := AddCity(CityNameNew, CountryNameNew);
      {If ModifyRelatedCity < 0 then null; //Do nothing}
      assign(fpEdition,FEdition);
      reset(fpEdition);
      seek(fpEdition, flag[2]);
      Edition.ID     := flag[1];
      Edition.Name   := EditionNameNew;
      Edition.CityID := Adder[2];
      Write(fpEdition,Edition);
      close(fpEdition);
      ModifyEdition := 0;
    end;
  end;

  function ModifyBook(BookTitleOld, BookTitleNew : TTitle;
                      AuthorFirstNameOld, AuthorLastNameOld, AuthorFirstNameNew, AuthorLastNameNew : TName;
                      EditionNameOld, EditionNameNew : TName;
                      CityNameOld, CountryNameOld, CityNameNew, CountryNameNew : TName;
                      YearOld, YearNew : Integer;
                      ModifyRelatedAuthor   : Integer;
                      ModifyRelatedEdition : Integer;
                      ModifyRelatedCity    : Integer) : Integer;
  var
    flag         : TFind;
    AdderAuthor  : TAdd;
    AdderEdition : TAdd;
    AdderCity    : TAdd;
    Book         : TBook;
    Modify       : Integer;
  begin
    flag := FindBook(BookTitleOld);
    If flag[1] < 0 then
      ModifyBook := -1 {Book does not exist}
    Else if flag[1] = 0 then
      ModifyBook := -2 {Book has been deleted}
    Else begin
      Modify := 0;
      assign(fpBook,FBooks);
      reset(fpBook);
      seek(fpBook, flag[2]);
      Read(fpBook,Book);
      AdderAuthor[1]  := -1;
      AdderAuthor[2]  := Book.AuthorID;
      AdderEdition[1] := -1;
      AdderEdition[2] := Book.EditionID;
      AdderCity[1]    := -1;
      AdderCity[2]    := Book.CityID;
      close(fpBook);
      
      If ModifyRelatedAuthor = 0 then
        Modify := ModifyAuthor(AuthorFirstNameOld, AuthorLastNameOld, AuthorFirstNameNew, AuthorLastNameNew);
      If (ModifyRelatedAuthor > 0) or (Modify < 0) then
        AdderAuthor := AddAuthor(AuthorFirstNameNew, AuthorLastNameNew);
      
      If ModifyRelatedEdition = 0 then
        Modify := ModifyEdition(EditionNameOld, EditionNameNew, CityNameOld, CountryNameOld, CityNameNew, CountryNameNew, -1);
      If (ModifyRelatedEdition > 0) or (Modify < 0) then
        AdderEdition := AddEdition(EditionNameNew, CityNameNew, CountryNameNew);
      
      If ModifyRelatedCity = 0 then
        Modify := ModifyCity(CityNameOld, CountryNameOld, CityNameNew, CountryNameNew);
      If (ModifyRelatedCity > 0) or (Modify < 0) then
        AdderCity := AddCity(CityNameNew, CountryNameNew);
      
      {If ModifyRelatedObject < 0 then null; //Do nothing}
      
      assign(fpBook,FBooks);
      reset(fpBook);
      seek(fpBook, flag[2]);
      Book.ID        := flag[1];
      Book.Title     := BookTitleNew;
      Book.AuthorId  := AdderAuthor[2];
      Book.EditionID := AdderEdition[2];
      Book.CityID    := AdderCity[2];
      Book.Year      := YearNew;
      Write(fpBook,Book);
      close(fpBook);
      ModifyBook := 0;
    end;
  end;

  procedure Add;
  var
    AdderBook : TAdd;
    BookTitle : TTitle;
    AuthorFirstName, AuthorLastName : TName;
    EditionName, CityName, CountryName : TName;
    BookYear : Integer;
  begin
    WriteLn('(Adding new book...)');
    WriteLn(''); WriteLn('');
    WriteLn('          Please, fill the form:');
      Write('            + Tilte: '); ReadLn(BookTitle);
    WriteLn('            + Author:');
      Write('              - First Name: '); ReadLn(AuthorFirstName);
      Write('              - Last Name:  '); ReadLn(AuthorLAstName);
    WriteLn('            + Edition:');
      Write('              - Name:  '); ReadLn(EditionName);
      Write('            + City:    '); ReadLn(CityName);
      Write('            + Country: '); ReadLn(CountryName);
      Write('            + Year:    '); ReadLn(BookYear);
    WriteLn(''); WriteLn('');
    
    AdderBook := AddBook(BookTitle, AuthorFirstName, AuthorLastName,
                         EditionName, CityName, CountryName, BookYear);
  end;

  procedure Delete;
  
  begin
  
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
    Else if K1 = 5 then Menu := False
    Else WriteLn('Error: Unknown option ',Option);
    WriteLn('');
    WriteLn('');
    end;
  end;
  
begin
  Write('');
  Main;
end.
