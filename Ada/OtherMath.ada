with Ada.Text_IO, Ada.Float_Text_IO, OtherMath;
use Ada.Text_IO, Ada.Float_Text_IO, OtherMath;

procedure Test is
  XX : Float;
begin
  New_Line(3);
  Put("Enter number: ");
  Get(XX);
  Put("Testing ROWEXP  :  ");
      Put(RowExp(XX));
      New_Line;
  Put("Testing PRODEXP :  ");
      Put(ProdExp(XX));
      New_Line;
  Put("Wallis function :  ");
      Put(Wallis);
      New_Line;
  New_Line(3);
end Test;