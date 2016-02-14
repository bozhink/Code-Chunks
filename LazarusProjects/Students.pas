
program Students;
{$APPTYPE CONSOLE}
const
  fname='StudentsBook.dat';

type
  StudentsType = record
    FirstName : String[20];
    LastName  : String[20];
    Grade     : String[3]; 
	  GradeNo   : Integer;
	  Mark      : Real;
	  Income    : Real;
  end;
  MyExtendedType = record
    FieldOfStudentsType : StudentsType;
    Flag : Integer;
  end;

var
  DefaultValue : StudentsType;
  SizeOfFile   : Integer;
  fp           : file of StudentsType;

  function PromptRecord : StudentsType;
  begin
    with PromptRecord do begin
      write('FirstName (or enter default value ', DefaultValue.FirstName, '):  '); readln(FirstName);
      write('LastName (or enter default value ', DefaultValue.LastName, '):  '); readln(LastName);      
      write('Grade (or enter default value ', DefaultValue.Grade, '):  '); readln(Grade);
	    write('GradeNo (or enter default value ', DefaultValue.GradeNo, '):  '); readln(GradeNo);
	    write('Mark (or enter default value ', DefaultValue.Mark, '):  '); readln(Mark);
	    write('Income (or enter default value ', DefaultValue.Income, '):  '); readln(Income);
    end;
  end;

  function File2Array(filename : String[20]): array of MyExtendedType;
  var
    fp         : file of StudentsType;
    I          : Integer;
    SizeOfFile : Integer;
  begin
    assign(fp, filename);
    SizeOfFile := filesize(fp);
    SetLength(File2Array, SizeOfFile);
    for I:=1 to SizeOfFile do
      with File2Array do begin
        read(fp, FieldOfStudentsType);
        Flag := 0;
      end;
    close(fp);
  end;

  function Search(VarOfMyExtendedType : MyExtendedType; Mask : StudentsType) : MyExtendedType;
  var
    TestVal : array[1..6] of Integer;
    I       : Integer;
  begin
    Search := VarOfMyExtendedType;
    for I:=1 to 6 do TestVal[I]:=0;
    with Search do begin
      if ((Mask.FirstName = FieldOfStudentsType.FirstName) and not (FieldOfStudentsType.FirstName = DefaultValue.FirstName)) or (Mask.FirstName = DefaultValue.FirstName) then TestVal[1]:=1;
      if ((Mask.LastName = FieldOfStudentsType.LastName) and not (FieldOfStudentsType.LastName = DefaultValue.LastName)) or (Mask.LastName = DefaultValue.LastName) then TestVal[2]:=1;      
      if ((Mask.Grade = FieldOfStudentsType.Grade) and not (FieldOfStudentsType.Grade = DefaultValue.Grade)) or (Mask.Grade = DefaultValue.Grade) then TestVal[N]:=1;
	    if ((Mask.GradeNo = FieldOfStudentsType.GradeNo) and not (FieldOfStudentsType.GradeNo = DefaultValue.GradeNo)) or (Mask.GradeNo = DefaultValue.GradeNo) then TestVal[N]:=1;
	    if ((Mask.Mark = FieldOfStudentsType.Mark) and not (FieldOfStudentsType.Mark = DefaultValue.Mark)) or (Mask.Mark = DefaultValue.Mark) then TestVal[N]:=1;
	    if ((Mask.Income = FieldOfStudentsType.Income) and not (FieldOfStudentsType.Income = DefaultValue.Income)) or (Mask.Income = DefaultValue.Income) then TestVal[N]:=1;
    end;
    for I:=1 to 6 do TestVal[1]:=TestVal[1]*TestVal[I];
    if TestVal[1]<>0 then Flag:=1;
  end;

  procedure PrintRecord(MyVar : StudentsType);
  begin
    with MyVar do begin
      write('FirstName:  '); writeln(FirstName);
      write('LastName:  '); writeln(LastName);      
      write('Grade:  '); writeln(Grade);
	    write('GradeNo:  '); writeln(GradeNo);
	    write('Mark:  '); writeln(Mark);
	    write('Income:  '); writeln(Income);
    end;
  end;

  procedure AddRecord(filename : String);
  var
    fp         : file of MtType;
    MainArr    : array of StudentsType;
    MyArray    : array of MyExtendedType;
    I          : Integer;
    SizeOfFile : Integer;
  begin
    MyArray := File2Array(filename);
    assign(fp, filename);
    SizeOfFile := filesize(fp);
    SetLength(MainArr, SizeOfFile+1);
    for I:=1 to SizeOfFile do
      with MyArray[I] do
        MainArr[I] := FieldOfStudentsType;
    MainArr[SizeOfFile+1] := PromptRecord;
    rewrite(fp);
    for I:=1 to SizeOfFile do
      write(fp, MainArr[I]);
    close(fp);
  end;

  procedure DeleteRecord(filename : String);
  var
    fp         : file of MtType;
    Mask       : StudentsType;
    MyArray    : array of MyExtendedType;
    I          : Integer;
    SizeOfFile : Integer;
  begin
    MyArray := File2Array(filename);
    assign(fp, filename);
    SizeOfFile := filesize(fp);
    writeln('Enter data for the mask of deletion');
    Mask := PromptRecord;
    for I:=1 to SizeOfFile do
      MyArray[I] := Search(MyArray[I], Mask);
    rewrite(fp);
    for I:=1 to SizeOfFile do
      with MyArray[I] do
        if Flag=0 then write(fp, FieldOfStudentsType);
    close(fp);
  end;

  procedure ModifyRecord(filename : String);
  var
    fp         : file of MtType;
    Mask       : StudentsType;
    MyArray    : array of MyExtendedType;
    I          : Integer;
    SizeOfFile : Integer;
    Ans        : String[1];
  begin
    MyArray := File2Array(filename);
    assign(fp, filename);
    SizeOfFile := filesize(fp);
    writeln('You are about modifying a record');
    writeln('Enter data for the mask of search');
    Mask := PromptRecord;
    for I:=1 to SizeOfFile do
      MyArray[I] := Search(MyArray[I], Mask);
    rewrite(fp);
    for I:=1 to SizeOfFile do
      with MyArray[I] do
        if Flag=1 then begin
          writeln('Encountered record: ');
          PrintRecord(FieldOfStudentsType);
          Ans:='y';
          write('Do you want to modify this record? Y/N '); readln(Ans);
          if (Ans='Y') or (Ans='y') then begin
            writeln('Enter new data for this record:');
            FieldOfStudentsType := PromptRecord;
          end else begin
            writeln('You have choosen not to modify this record');
            writeln('');
          end;
        end;
      rewrite(fp);
      for I:=1 to SizeOfFile do
        with MyArray[I] do
          write(fp, FieldOfStudentsType);
    close(fp);
  end;

  procedure PrintFileContent(filename : String);
  var
    fp         : file of MtType;
    MyArray    : array of MyExtendedType;
    I          : Integer;
    SizeOfFile : Integer;
  begin
    MyArray := File2Array(filename);
    assign(fp, filename);
    SizeOfFile := filesize(fp);
    close(fp);
    writeln('Contents of the file ', filename);
    for I:=1 to SizeOfFile do
      with MyArray[I] do begin
        PrintRecord(FieldOfStudentsType);
        writeln('');
      end;
  end;

begin
  with DefaultValue do begin
    FirstName :='nil';
    LastName  :='nil';    
    Grade     :='nil';
	  GradeNo   :=0;
  	Mark      :=0;
  	Income    :=0;
  end;
  assign(fp, fname);
  SizeOfFile:=filesize(fp);
  close(fp);
end.
