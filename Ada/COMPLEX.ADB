with Ada.Text_IO, Ada.Float_Text_IO;
package body Complex_IO is
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
  --return real to complex
    Result : Complex;
  begin
    Result.Re := r;
    Result.Im :=0.0;
    return Result;
  end R2C;

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
end Complex_IO;