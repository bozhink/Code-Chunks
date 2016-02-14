unit TypesUnit; 

{$mode objfpc}{$H+}

interface

type
  TID = 0..9999;
  TName  = String[32];
  TTitle = String[255];
  TSBook = record
    ID        : Integer;
    Title     : TTitle;
    AuthorID  : Integer;
    EditionID : Integer;
    CityID    : Integer;
    Year      : Integer;
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
  TSAuthor = record
    ID        : Integer;
    FirstName : TName;
    LastName  : TName;
    end;
  TAuthor  = record
    FirstName : TName;
    LastName  : TName;
    end;
  TSCity = record
    ID      : Integer;
    Name    : TName;
    Country : TName;
    end;
  TCity  = record
    Name    : TName;
    Country : TName;
    end;
  TSEdition = record
    ID      : Integer;
    Name    : TName;
    CityID  : Integer;
    end;
  TEdition = record
    Name    : TName;
    City    : TName;
    Country : TName;
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
  TAuthorFile  = file of TSAuthor;
  TCityFile    = file of TSCity;
  TEditionFile = file of TSEdition;

implementation

end.

