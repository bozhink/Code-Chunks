with Ada.Text_IO, MyPack;
use Ada.Text_IO, MyPack;

procedure InsDelLook_Test is
  C : Character;
  package CMyPack is new MyPack(Character, range(1..10));
  with CMyPack; use CMyPack;
  
begin
  C:='c';
  --Get(C);
  Put(C);
  New_Line;
  
end InsDelLook_Test;