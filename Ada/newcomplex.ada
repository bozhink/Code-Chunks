with Ada.Text_IO, Ada.Float_Text_IO;
with Basic; use Basic;

package Complex_IO is
  type Complex is record
    Re: Float;
    Im: Float;
  end record;
  function "+"(c1, c2 : Complex) return Complex;
  function "-"(c1, c2 : Complex) return Complex;
  function "*"(c1, c2 : Complex) return Complex;
  function "/"(c1, c2 : Complex) return Complex;
  function Module(c : Complex) return Float;
  function Arg(c : Complex) return Float;
  function R2C(r : Float) return Complex;
  procedure Put(cc : Complex);
  procedure Put_Line(cc : Complex);  
end Complex_IO;

package body Complex_IO is
  --START ALGEBRA
  function "+"(c1, c2 : Complex) return Complex is
    Result : Complex;
  begin
    Result.Re := c1.Re + c2.Re;
    Result.Im := c1.Im + c2.Im;
    return Result;
  end "+";
  
  function "-"(c1, c2 : Complex) return Complex is
    Result : Complex;
  begin
    Result.Re := c1.Re - c2.Re;
    Result.Im := c1.Im - c2.Im;
    return Result;
  end "-";
  
  function "*"(c1, c2 : Complex) return Complex is
    Result : Complex;
  begin
    Result.Re := c1.Re * c2.Re - c1.Im * c2.Im;
    Result.Im := c1.Im * c2.Re + c2.Im * c1.Re;
    return Result;
  end "*";
  
  function "/"(c1, c2 : Complex) return Complex is
    Result : Complex;
  begin
    if (c2.Re * c2.Re + c2.Im * c2.Im) = 0.0 then
      Ada.Text_IO.Put_Line("DIVISOR ZERO!!!");
      Result := (0.0, 0.0);
    else
      Result.Re := (c1.Re * c2.Re + c1.Im * c2.Im)/(c2.Re * c2.Re + c2.Im * c2.Im);
      Result.Im := (c1.Re * c2.Im - c1.Im * c2.Re)/(c2.Re * c2.Re + c2.Im * c2.Im);
    end if;
    return Result;
  end "/";
  
  function R2C(r : Float) return Complex is
    --returns real to complex
    Result : Complex;
  begin
    Result.Re := r;
    Result.Im :=0.0;
    return Result;
  end R2C;
  
  function Module(c : Complex) return Float is
    Result : Float;
  begin
    Result := (c.Re)**2+(c.Im)**2;
    Result := pow(Result, 0.5);
    return Result;
  end Module;
  
  function Arg(c : Complex) return Float is
    Result : Float;
  begin
    if c.Re > 0.0 then
      Result := atan(c.Im/c.Re);
    else
      Result := pi+atan(c.Im/c.Re);
    end if;
    return Result;
  end Arg;
  --END ALGEBRA
  --********************************************
  --START I/O
  procedure Put(cc : Complex) is
  begin
    Ada.Float_Text_IO.Put(cc.Re);
    Ada.Text_IO.Put("  ");
    Ada.Float_Text_IO.Put(cc.Im);
  end Put;
  
  procedure Put_Line(cc : Complex) is
  begin
    Ada.Float_Text_IO.Put(cc.Re);
    Ada.Text_IO.Put("  ");
    Ada.Float_Text_IO.Put(cc.Im);
    Ada.Text_IO.New_Line;
  end Put_Line;
  --END I/O
  --END PACKAGE
end Complex_IO;

with Ada.Text_IO, Complex_IO;
use Ada.Text_IO, Complex_IO;
procedure test is
  a1 : Complex :=(1.0, 1.0);
  a2 : Complex :=(2.0, 2.0);
  b  : Float;
begin
  a1:=a1+a2;
  Put_Line(Float'Image(a1.Re));
  Put_Line(Float'Image(a1.Im));
  a1:=a1-a2;
  Put_Line(Float'Image(a1.Re));
  Put_Line(Float'Image(a1.Im));
  a1:=a1*a2;
  Put_Line(Float'Image(a1.Re));
  Put_Line(Float'Image(a1.Im));
  Complex_IO.Put(a2);
  New_Line;
  Complex_IO.Put_Line(a1);
  a1 := R2C(3.14);
  a2 := a1 * a2;
  Complex_IO.Put_Line(a2);
  b:=Module(a2);
  Put_Line(Float'Image(b));
  b:=Arg(a2+a1);
  Put_Line(Float'Image(b));
end test;
  