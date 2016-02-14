program Simplex;
var
  n : Integer;
  m : Integer;
  
  procedure Simplex1();
  const
    m = 3;
    n = 5;
  type
    Column = array[1..m] of Real;
    IColumn = array[1..m] of Integer;
    Row = array[0..n] of Real;
    IRow = array[0..n] of Integer;
    Matrix = array[1..m, 0..n] of Real;
  var
    BaseCol   : IColumn;
    TargetCol : Column;
    TargetRow : Row;
    IndexRow  : Row;
    Table     : Matrix;
    KeyCol    : Integer;
    KeyRow    : Integer;
    I         : Integer;
    
    function LookForMax(Input : Row) : Integer;
    var
      I : Integer;
    begin
      LookForMax := 1;
      for I:=1 to n-1 do
        if Input[I]<Input[I+1] then LookForMax := I+1;
    end;

    function LookForMin(Input : Row) : Integer;
    var
      I : Integer;
    begin
      LookForMin := 1;
      for I:=1 to n-1 do
        if Input[I]>Input[I+1] then LookForMin := I+1;
    end;
    
    function IfMax(Input : Row) : Integer;
    var
      TestVal : IRow;
      I : Integer;
    begin
      IfMax := 1;
      for I:=0 to n do
        if Input[I]<0.0 then TestVal[I]:=0
        else TestVal[I]:=1;
      for I:=0 to n do
        IfMax := IfMax*TestVal[I];
    end;
    
    function IfMin(Input : Row) : Integer;
    var
      TestVal : IRow;
      I : Integer;
    begin
      IfMin := 1;
      for I:=0 to n do
        if Input[I]>0.0 then TestVal[I]:=0
        else TestVal[I]:=1;
      for I:=0 to n do
        IfMin := IfMin*TestVal[I];
    end;
    
    function FindKeyRow(T : Matrix; Key : Integer) : Integer;
    var
      Inter : Column;
      I : Integer;
    begin
      FindKeyRow := 1;
      for I:=1 to m do
        Inter[I]:=T[I,0]/T[I,Key];
      for I:=1 to m do
        if Inter[I] < 0.0 then Inter[I]:=0.0;
      for I:=1 to m-1 do
        if Inter[I]>Inter[I+1] then FindKeyRow:=I+1;
    end;
    
    procedure SetMainRow(T:Matrix; KeyR : Integer; KeyC : Integer);
    var
      KeyValue : Real;
      I        : Integer;
    begin
      KeyValue := T[KeyR, KeyC];
      for I := 0 to n do
        T[KeyR, I]:=T[KeyR,I]/KeyValue;
      if T[KeyR, KeyC]<>1.0 then T[KeyR, KeyC] := 1.0;
    end;
    
    procedure NextTable(T:Matrix; Index : Row; KeyR : Integer; KeyC : Integer);
    var
      I, J : Integer;
    begin
      for I:=1 to KeyR-1 do begin
        for J:=0 to KeyC-1 do
          T[I,J]:= T[I,J]-T[KeyR,J]*T[I,KeyC];
        for J:=KeyC+1 to n do
          T[I,J]:= T[I,J]-T[KeyR,J]*T[I,KeyC];
      end;
      for I:=KeyR+1 to m do begin
        for J:=0 to KeyC-1 do
          T[I,J]:= T[I,J]-T[KeyR,J]*T[I,KeyC];
        for J:=KeyC+1 to n do
          T[I,J]:= T[I,J]-T[KeyR,J]*T[I,KeyC];
      end;
      for I:=1 to m do T[I, KeyC]:=0.0;
      for J:=0 to KeyC-1 do
        Index[J]:= Index[J]-T[KeyR,J]*Index[KeyC];
      for J:=KeyC+1 to n do
        Index[J]:= Index[J]-T[KeyR,J]*Index[KeyC];
      Index[KeyC]:=0.0;
    end;
    
    procedure Init(T : Matrix; TargetR : Row; TargetC : Column; BaseC : IColumn; Index : Row);
    var
      I, J : Integer;
    begin
      for I:=1 to m do
        TargetC[I]:=TargetR[BaseC[I]];
      for J:=0 to n do begin
        Index[J]:= -TargetR[J];
        for I:=1 to m do
          Index[J]:=Index[J]+T[I,J]*TargetC[I];
      end;
    end;
    
    procedure InputData(T : Matrix; TargetR : Row; BaseC : IColumn);
    var
      I, J : Integer;
    begin
      writeln('Enter coefficients c1, c2, ..., cn of the linear form:');
      for J:=1 to n do
        read(TargetR[J]);
      writeln('');
      {Entering the matrix}
      for I:=1 to m do begin
        writeln('Enter conditions: a',I,'0, a',I,'1, a',I,'2, ..., a',I,'n :');
        for J:=0 to n do
          read(T[I, J]);
      end;
      for I:=1 to m do
        if T[I, 0] < 0.0 then
          for J:=0 to n do
            T[I,J]:= -T[I,J];
      writeln('Enter First Basis Column (only Integers)');
      for I:=1 to m do
        read(BaseC[I]);
      writeln('');
    end;
    
  begin
    InputData(Table, TargetRow, BaseCol);
    Init(Table, TargetRow, TargetCol, BaseCol, IndexRow);
    
    {MAX}
    I:=0;
    while I=0 do begin
      KeyCol:=LookForMin(IndexRow);
      KeyRow:=FindKeyRow(Table, KeyCol);
      BaseCol[KeyRow] := KeyCol;
      SetMainRow(Table, KeyRow, KeyCol);
      I := IfMax(IndexRow);
    end;
    writeln('Optimum :  ', IndexRow[0]);
  end;
  
begin
  {write('Enter the number of variables xj /n/ : '); read(n);
  write('Enter the number of conditions   /m/ : '); read(m);}
  Simplex1();
end.
