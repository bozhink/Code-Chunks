program __TEST__;
type
  TRArr = array[1..100] of Integer;
  TRType = record
    ID : Integer;
    XX : String[10];
    end;
  TSType = record
    ID : Integer;
    ZZ : TRType;
    end;

  procedure mov(const inn : TRType; var outt : TRType);
  begin
    outt.ID := inn.ID;
    outt.XX := inn.XX;
  end;

var
  S1, S2 : TRType;
  SS : TSType;

begin
  S1.ID := 1;
  S1.XX := 'Hello';
  mov(S1, S2);
  writeln(S2.ID, '  ', S2.XX);
  //if not(S1=S2) then writeln('?');
  
  SS.ID := 5;
  mov(S1, SS.ZZ);
  writeln (SS.ZZ.XX);

end.
