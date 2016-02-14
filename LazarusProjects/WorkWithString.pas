program Untitled;
{$APPTYPE CONSOLE}
{uses  TestLib;}
const
  fname = 'FILES.DAT';
type
  MyBooks = record
    Title, Publisher, Author : String[60];
    Year : Integer;
  end;
  ExtBooks = record
    Book : MyBooks;
    Flag : Integer;
  end;

var
  MyBook : MyBooks;
  ExtBookArr : array of ExtBooks;
  I, ExtBookArrSize : Integer;

function AddRecord(NewBook : MyBooks): MyBooks;
begin
  with NewBook do begin
    write('Title: ....... '); readln(Title);
    write('Publisher: ... '); readln(Publisher);
    write('Author: ...... '); readln(Author);
    write('Year: ........ '); readln(Year);
  end;
  AddRecord := NewBook;
end;

procedure SearchBook(CurrentBook : ExtBooks; SearchMask : MyBooks);
begin
  with CurrentBook do begin
    if SearchMask.Title = Book.Title then Flag := 1;
    if SearchMask.Publisher = Book.Publisher then Flag := 1;
    if SearchMask.Author = Book.Author then Flag := 1;
    if SearchMask.Year = Book.Year then Flag := 1;
  end;
end;

procedure ReadFile;
var
  fp : file of MyBooks;
begin
  assign(fp, fname);
  ExtBookArrSize := 0;
  while not eof(fp) do begin
    read(fp, MyBook);
    ExtBookArrSize := ExtBookArrSize + 1;
  end;
  for I := 1 to ExtBookArrSize do
    with ExtBookArr[I] do
      read(fp, Book);
  close(fp);
end;

procedure DoRun;
var
  Mask       : MyBooks;
  MBook      : MyBooks;
  MyExtBook  : ExtBooks;
  fp         : file of MyBooks;
  ExtBookArr : array of ExtBooks;
  Ans        : String[1];
begin
  assign(fp, fname);
  rewrite(fp);
  Ans := 'y';
  while (Ans='Y') or (Ans='y') do begin
    MBook := AddRecord(MBook);
    write(fp, Mask);
    writeln('');
    write('Do you want to enter other record? Y/N '); readln(Ans);
    writeln('');
  end;
  close(fp);
  Mask := AddRecord(Mask);
  for I:= 1 to ExtBookArrSize do SearchBook(ExtBookArr[I], Mask);
  for I:= 1 to ExtBookArrSize do begin
    with ExtBookArr[I] do begin
      if Flag = 1 then write(Book.Title);
    end;
  end;
end;


begin
  DoRun;

end.
