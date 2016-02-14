unit BooksUnit; 

{$mode objfpc}{$H+}

interface
uses
  TypesUnit;

const
  FBooks   = 'Books.dat';
  FAuthor  = 'Author.dat';
  FCity    = 'City.dat';
  FEdition = 'Edition.dat';

  function FindNextCity(fpCityPosition : Integer; City : TCity) : TFind;
  function FindNextAuthor(fpAuthorPosition : Integer; Author : TAuthor) : TFind;
  function FindNextEdition(fpEditionPosition : Integer; Edition : TEdition) : TFind;
  function FindNextBook(fpBookPosiiton : Integer; Book : TBook) : TFind;
  
implementation
  function FindNextCity(fpCityPosition : Integer; City : TCity) : TFind;
  var
    fpCity  : TCityFile;
    Element : TSCity;
    Match   : Boolean;
  begin
    assign(fpCity,FCity);
    reset(fpCity);
    if fpCityPosition < filesize(fpCity) then begin
      seek(fpCity,fpCityPosition);
      Match := False;
      While (not Match) and (not eof(fpCity)) do begin
        Read(fpCity,Element);
        With Element do
          Match := (Name = City.Name) or (Country = City.Country);
      end;
      FindNextCity.ID   := Element.ID;
      FindNextCity.FP   := filepos(fpCity);
      FindNextCity.IERR := 0;
    end
    else begin
      FindNextCity.ID   := -1;
      FindNextCity.FP   := filepos(fpCity);
      FindNextCity.IERR := -1;
    end;
    close(fpCity);
  end;

  function FindNextAuthor(fpAuthorPosition : Integer; Author : TAuthor) : TFind;
  var
    fpAuthor : TAuthorFile;
    Element : TSAuthor;
    Match   : Boolean;
  begin
    assign(fpAuthor,FAuthor);
    reset(fpAuthor);
    if fpAuthorPosition < filesize(fpAuthor) then begin
      seek(fpAuthor,fpAuthorPosition);
      Match := False;
      While (not Match) and (not eof(fpAuthor)) do begin
        Read(fpAuthor,Element);
        With Element do
          Match := (FirstName = Author.FirstName) or (LastName = Author.LastName);
      end;
      FindNextAuthor.ID   := Element.ID;
      FindNextAuthor.FP   := filepos(fpAuthor);
      FindNextAuthor.IERR := 0;
    end
    else begin
      FindNextAuthor.ID   := -1;
      FindNextAuthor.FP   := filepos(fpAuthor);
      FindNextAuthor.IERR := -1;
    end;
    close(fpAuthor);
  end;
  
  function FindNextEdition(fpEditionPosition : Integer; Edition : TEdition) : TFind;
  var
    fpEdition : TEditionFile;
    fpCity    : TCityFile;
    Element   : TSEdition;
    City      : TCity;
    Match     : Boolean;
  begin
  
  end;
  
  function FindNextBook(fpBookPosiiton : Integer; Book : TBook) : TFind;
  
  
end.

