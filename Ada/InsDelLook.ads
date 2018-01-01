
generic
  type MyKeyType is private;
  type Index is (<>);
package MyPack is   
  type Table_Row is array (Index range<>) of MyKeyType;
  type Table is record
    Row    : Table_Row;
    LastIn : Integer;
    end record;
  procedure Initialize(T : in out Table);
  procedure Insert(T : in out Table; NewElement : in MyKeyType);
  procedure Delete(T : in out Table; Position : in Integer);
  function  Lookup(T : in Table; Element : in MyKeyType) return Integer;
end MyPack;