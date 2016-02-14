program KNIGA;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, CustApp, KNIGA_Unit;

  procedure Menu();
  var
    N : Integer;
  begin
  while True do begin
    Writeln('');
    Writeln('Select Option:');
    Writeln('  0. Initialize');
    Writeln('  1. Add new book');
    Writeln('  2. Delete old book');
    Writeln('  3. Modify old book');
    Writeln('  4. View all books');
    Writeln('  5. Exit');
    Writeln('');
    Readln(N);
    if N = 0 then Init
    else if N = 1 then Add
    else if N = 2 then Delete
    else if N = 3 then Modify
    else if N = 4 then ReadBook
    else if N = 5 then Halt;
  end;
  end;
  
begin
  Menu;
  readln();
end.

