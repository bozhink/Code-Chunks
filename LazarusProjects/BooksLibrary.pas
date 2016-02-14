program BooksLibrary;
const
  filename = 'LIB.DAT';
  
type
  MTID = String[1]; {1-BOOK; 2-MAGAZINE; 3-NEWSPAPER}
  MTFlag = Integer;
  MTMaterial = record
    id        : MTID;
    Title     : String[60];
    Publisher : String[60];
    Author    : String[60];
    No        : Integer;
    Volume    : Integer;
    Day       : Integer;
    Month     : Integer;
    Year      : Integer;
  end;
  MTSearch = record
    Material : MTMaterial;
    Flag     : MTFlag;
  end;
  
var
  fp          : file of MTMaterial;
  MyMat       : MTMaterial;
  {MySearch    : MTMaterial;
  Mask        : MTMaterial;
  MyMatArr    : array of MTMaterial;
  MySearchArr : array of MTSearch;    }
  Ans         : String[1];

begin
  assign(fp, filename);
  reset(fp);
  with MyMat do begin
      write('Select type: Book (b), Magazine (m), Newspaper (n): ');
      readln(Ans);
      write('Title: ....... '); readln(Title);
      write('Publisher: ... '); readln(Publisher);
      write('Year: ........ '); readln(Year);
      id := Ans;
      if Ans='b' then begin
        write('Author: ...... '); readln(Author);
        No := 0; Volume := 0; Day := 0; Month := 0;
      end else if Ans='m' then begin
        write('No: ......... '); readln(No);
        write('Volume: ..... '); readln(Volume);
        Author := 'Null'; Day := 0; Month := 0;
      end else begin
        write('Day: ........ '); readln(Day);
        write('Month: ...... '); readln(Month);
        No := 0; Volume := 0;
      end;
    end;
  write(fp, MyMat);
  close(fp);
  read();
end.
