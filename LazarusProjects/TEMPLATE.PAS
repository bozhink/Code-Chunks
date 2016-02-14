
program Template;
{$APPTYPE CONSOLE}
const
  fname='myfile';

type
  MyType = record
    Field1 : BaseType1;
    Field2 : BaseType2;
    ...
    FieldN : BaseTypeN; {N is the number of fields in MyType}
  end;
  MyExtendedType = record
    FieldOfMyType : MyType;
    Flag : Integer;
  end;

var
  DefaultValue : MyType;
  
  function PromptRecord : MyType;
  begin
    with PromptRecord do begin
      write('Field1 (or enter default value ', DefaultValue.Field1, '): ... '); readln(Field1);
      write('Field2 (or enter default value ', DefaultValue.Field2, '): ... '); readln(Field2);
      ...
      write('FieldN (or enter default value ', DefaultValue.FieldN, '): ... '); readln(FieldN);
    end;
  end;
  
  function File2Array(filename : String) : array of MyExtendedType;
  var
    fp         : file of MyType;
    I          : Integer;
    SizeOfFile : Integer;
  begin
    assign(fp, filename);
    SizeOfFile := filesize(fp);
    SetLength(File2Array, SizeOfFile);
    for I:=1 to SizeOfFile do
      with File2Array do begin
        read(fp, FieldOfMyType);
        Flag := 0;
      end;
    close(fp);
  end;
  
  function Search(VarOfMyExtendedType : MyExtendedType; Mask : MyType) : MyExtendedType;
  var
    TestVal : array[1..N] of Integer;
    I       : Integer;
  begin
    Search := VarOfMyExtendedType;
    for I:=1 to N do TestVal[I]:=0;
    with Search do begin
      if ((Mask.Field1 = FieldOfMyType.Field1) and not (FieldOfMyType.Field1 = DefaultValue.Field1)) or (Mask.Field1 = DefaultValue.Field1) then TestVal[1]:=1;
      if ((Mask.Field2 = FieldOfMyType.Field2) and not (FieldOfMyType.Field2 = DefaultValue.Field2)) or (Mask.Field2 = DefaultValue.Field2) then TestVal[2]:=1;
      ...
      if ((Mask.FieldN = FieldOfMyType.FieldN) and not (FieldOfMyType.FieldN = DefaultValue.FieldN)) or (Mask.FieldN = DefaultValue.FieldN) then TestVal[N]:=1;
    end;
    for I:=1 to N do TestVal[1]:=TestVal[1]*TestVal[I];
    if TestVal[1]<>0 then Flag:=1;
  end;
  
  procedure PrintRecord(MyVar : MyType);
  begin
    with MyVar do begin
      write('Field1: ... '); writeln(Field1);
      write('Field2: ... '); writeln(Field2);
      ...
      write('FieldN: ... '); writeln(FieldN);
    end;
  end;
  
  procedure AddRecord(filename : String);
  var
    fp         : file of MtType;
    MainArr    : array of MyType;
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
        MainArr[I] := FieldOfMyType;
    MainArr[SizeOfFile+1] := PromptRecord;
    rewrite(fp);
    for I:=1 to SizeOfFile do
      write(fp, MainArr[I]);
    close(fp);
  end;
  
  procedure DeleteRecord(filename : String);
  var
    fp         : file of MtType;
    Mask       : MyType;
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
        if Flag=0 then write(fp, FieldOfMyType);
    close(fp);
  end;
  
  procedure ModifyRecord(filename : String);
  var
    fp         : file of MtType;
    Mask       : MyType;
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
          PrintRecord(FieldOfMyType);
          Ans:='y';
          write('Do you want to modify this record? Y/N '); readln(Ans);
          if (Ans='Y') or (Ans='y') then begin
            writeln('Enter new data for this record:');
            FieldOfMyType := PromptRecord;
          end else begin
            writeln('You have choosen not to modify this record');
            writeln('');
          end;
        end;
      rewrite(fp);
      for I:=1 to SizeOfFile do
        with MyArray[I] do
          write(fp, FieldOfMyType);
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
        PrintRecord(FieldOfMyType);
        writeln('');
      end;
  end;

begin
  with DefaultValue do begin
    Field1:=0;
    Field2:=0;
    ...
    FieldN:=0;
  end;
end.
