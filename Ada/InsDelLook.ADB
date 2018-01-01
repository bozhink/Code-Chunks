package body MyPack is   
  procedure Initialize(T : in out Table) is
  begin
    T.LastIn := 0;
  end Initialize;
  
  procedure Insert(T : in out Table; NewElement : in MyKeyType) is
  begin
    T.LastIn := T.LastIn + 1;
    T.Row(T.LastIn) := NewElement;
  end Insert;
  
  procedure Delete(T : in out Table; Position : in Integer) is
    I : Integer;
  begin
    for I in Position..T.LastIn-1 loop
      T.Row(I) := T.Row(I+1);
    end loop;
    T.LastIn := T.LastIn-1;
  end Delete;
  
  function  Lookup(T : in Table; Element : in MyKeyType) return Integer is
    I : Integer;
  begin
    for I in 1..T.LastIn loop
      if T.Row(I) = Element then
        return I;
      end if;
    end loop;
    return 0;
  end Lookup;
  
end MyPack;