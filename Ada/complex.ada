with Ada.Text_IO, Ada.Float_Text_IO, Complex_Functions; 
use Ada.Text_IO;
procedure complexequat is
  a : Float;
  b : Float;
  type Complex is record
    Re : Float;
    Im : Float;
    end record;
  c : Complex;
  d : Complex :=(1.0, 2.0);
  
begin
  Put("Enter Real part a: ");
  Ada.Float_Text_IO.Get(a);
  New_Line;
  Put("Enter Imag part b: ");
  Ada.Float_Text_IO.Get(b);
  c:=(a,b);
  New_Line;
  Ada.Float_Text_IO.Put(c.Re);
  New_Line;
  Complex_Functions.Sum(c1=>c, c2=>d);
  Put(Complex'Image(c));
  New_Line;
end complexequat;