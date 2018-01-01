with Ada.Text_IO; use Ada.Text_IO;
package MathModule is
  function ch(X : Float) return Float;
  function sh(X : Float) return Float;
  function exp(X : Float) return Float;
  function ln(a : Float) return Float;
  function pow(a, x : Float) return Float;
  function cos(X : Float) return Float;
  function sin(X : Float) return Float;
  function atan(A : Float) return Float;
end MathModule;

package body MathModule is
  function ch(X : Float) return Float is
    Result : Float;
    Y      : Float;
    A      : Float;
    EPS, I : Float; 
  begin
    EPS:=0.000001;
    Y:=X*X;
    A:=1.0;
    Result:=A;
    I:=-1.0;
    loop
      I:=I+1.0;
      A:=A*Y/((2.0*I+2.0)*(2.0*I+1.0));
      Result:=Result+A;
      exit when A<EPS;
    end loop;
    return Result;
  end ch;
  
  function sh(X : Float) return Float is
    Result : Float;
    Y      : Float;
    A      : Float;
    EPS, I : Float; 
  begin
    EPS:=0.000001;
    Y:=X*X;
    A:=X;
    Result:=A;
    I:=-1.0;
    loop
      I:=I+1.0;
      A:=A*Y/((2.0*I+3.0)*(2.0*I+2.0));
      Result:=Result+A;
      exit when A<EPS;
    end loop;
    return Result;
  end sh;
  
  function exp(X : Float) return Float is
  begin
    return (ch(X)+sh(X));
  end exp;
  
  function ln(a : in Float) return Float is
    b      : Float;
    count  : Float;
    ln2    : Float := 0.6931471805599;
    --0.69314718055994530941723212145818
    Result : Float;
    R1     : Float;
    R2     : Float;
    NN1    : Float;
    NN2    : Float;
    K      : Float; --Float counter
    Ki     : Integer; --Integer counter
  begin
    if a<=0.0 then
      Put_Line("ERROR: Parameter in LN is not correct size");
      return -1.0;
    end if;
    if a=2.0 then
      Result:=0.0;
      R1:=0.0;
      R2:=0.0;
      K := 1.0;
      loop
        NN1 := 1.0/(2.0*K-1.0);
        NN2 := 1.0/(2.0*K);
        R1 := R1 + NN1;
        R2 := R2 + NN2;
        K := K + 1.0;
        exit when NN2 < 0.00000001;
      end loop;
      Result := R1 - R2;
      return Result;
    end if;
    b:=a;
    count:=0.0;
    loop
      exit when b<2.0;
      b:=b/2.0;
      count:=count+1.0;
    end loop;
    Result:=0.0;
    R1:=0.0;
    R2:=0.0;
    K := 1.0;
    Ki := 1; 
    loop
      NN1 := ((b-1.0)**(2*Ki-1))/(2.0*K-1.0);
      NN2 := ((b-1.0)**(2*Ki))/(2.0*K);
      R1 := R1 + NN1;
      R2 := R2 + NN2;
      K := K + 1.0;
      Ki := Ki + 1;
      exit when NN2 < 0.00000001;
    end loop;
    Result := R1 - R2 + count*ln2;
    return Result;
  end ln;
  
  function pow(a, x : Float) return Float is
    Result : Float;
  begin
    Result:=exp(x*ln(a));
    return Result;
  end pow;
  
  function cos(X : Float) return Float is
    Result : Float;
    A, B   : Float;
    SA, SB : Float;
    EPS, I : Float; 
  begin
    EPS:=0.000001;
    A:=1.0; B:=X*X/2.0;
    SA:=A;  SB:=B;
    I:=-1.0;
    loop
      I:=I+1.0;
      A:=A*X*X*X*X/((4.0*I+1.0)*(4.0*I+2.0)*(4.0*I+3.0)*(4.0*I+4.0));
      B:=B*X*X*X*X/((4.0*I+3.0)*(4.0*I+4.0)*(4.0*I+5.0)*(4.0*I+6.0));
      SA:=SA+A;
      SB:=SB+B;
      exit when A<EPS;
    end loop;
    Result:=SA-SB;
    return Result;
  end cos;
  
  function sin(X : Float) return Float is
    Result : Float;
    A, B, Y: Float;
    SA, SB : Float;
    EPS, I : Float; 
  begin
    EPS:=0.000001;
    Y:=X;
    if X<0.0 then
      Y:=0.0-X;
    end if;
    A:=Y; B:=Y*Y*Y/6.0;
    SA:=A;  SB:=B;
    I:=-1.0;
    loop
      I:=I+1.0;
      A:=A*Y*Y*Y*Y/((4.0*I+2.0)*(4.0*I+3.0)*(4.0*I+4.0)*(4.0*I+5.0));
      B:=B*Y*Y*Y*Y/((4.0*I+4.0)*(4.0*I+5.0)*(4.0*I+6.0)*(4.0*I+7.0));
      SA:=SA+A;
      SB:=SB+B;
      exit when A<EPS;
    end loop;
    Result:=SA-SB;
    return Result;
  end sin;
  
  function atan(a : in Float) return Float is
    b      : Float;
    count  : Float;
    Result : Float;
    R1     : Float;
    R2     : Float;
    NN1    : Float;
    NN2    : Float;
    K      : Float; --Float counter
    Ki     : Integer; --Integer counter
  begin
    if (a>=1.0) or (a<=0.0-1.0) then
      Put_Line("ERROR: Parameter in ATAN is not correct size");
      return -10.0;
    end if;
    Result:=0.0;
    R1:=0.0;
    R2:=0.0;
    K := 1.0;
    Ki := 1; 
    loop
      NN1 := (a**(4*Ki-3))/(4.0*K-3.0);
      NN2 := (a**(4*Ki-1))/(4.0*K-1.0);
      R1 := R1 + NN1;
      R2 := R2 + NN2;
      K := K + 1.0;
      Ki := Ki + 1;
      exit when NN2 < 0.00000001 and NN2 > 0.0-0.00000001;
    end loop;
    Result := R1 - R2 ;
    return Result;
  end atan;
end MathModule;



with MathModule, Ada.Float_Text_IO; use MathModule;
procedure Main is
  a : Float :=3.14;
  b : Float;
  h : Float;
  fp : File_Type;
  
  procedure Lntest is
  begin
    Create (File => fp, Mode => Out_File, Name => "ln.txt");
    a:=0.0;
    h:=0.001;
    loop
      a:=a+h;
      b:=ln(a);
      Ada.Float_Text_IO.Put(File => fp, Item => a, Fore => 2, Aft => 3, Exp => 2);
      Put(File => fp, Item => "   ");
      Ada.Float_Text_IO.Put(File => fp, Item => b, Fore => 2, Aft => 12, Exp => 2);
      Put_Line(File => fp, Item => "");
     exit when a>=1.99;
    end loop;
    Close (File => fp);
  end Lntest;
  
begin
  b := a**3;
  Put_Line(Float'Image(b));
  Put_Line("Enter number for test exp");
  Ada.Float_Text_IO.Get(a);
  b:=exp(a);
  Put_Line(Float'Image(b));
  Put_Line("Enter number for test LN");
  Ada.Float_Text_IO.Get(a);
  b:=ln(a);
  Put_Line(Float'Image(b));
  Put_Line("Enter number for test sin");
  Ada.Float_Text_IO.Get(a);
  b := sin(a);
  Put_Line(Float'Image(b));
  b := cos(a);
  Put_Line(Float'Image(b));
  b:=pow(a, b);
  Put_Line(Float'Image(b));
  b:=atan(a);
  Put_Line(Float'Image(b));
  --Lntest;

end Main;