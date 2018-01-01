package Complex_IO is
  type Complex is record
    Re: Float;
    Im: Float;
  end record;
  function "+"(c1, c2 : Complex) return Complex;
  function "-"(c1, c2 : Complex) return Complex;
  function "*"(c1, c2 : Complex) return Complex;
  function "/"(c1, c2 : Complex) return Complex;
  function R2C(r : Float) return Complex;
  procedure Put(cc : Complex);
  procedure Put_Line(cc : Complex);  
end Complex_IO;