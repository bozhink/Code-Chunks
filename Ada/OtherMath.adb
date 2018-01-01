with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

package body OtherMath is
-- ROWCH FUNCTION
  function RowCh(X : Float) return Float is
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
  end RowCh;
-- ROWSH FUNCTION  
  function RowSh(X : Float) return Float is
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
  end RowSh;
-- ROWEXP FUNCTION  
  function RowExp(X : Float) return Float is
  begin
    return (RowCh(X)+RowSh(X));
  end RowExp; 
-- PRODEXP FUNCTION  
  function ProdExp(X : Float) return Float is
    Result : Float;
    Y      : Float;
    N      : Float;
    EPS    : Float;
  begin
    EPS := 0.0001;
    Result := (1.0-X);
    N := 1.0;
    loop
      N := N + 1.0;
      Y := X/N;
      Result := Result*(1.0-Y);
      exit when Y < EPS;
    end loop;
    return Result;
  end ProdExp;
-- WALLIS' FUNCTION TO CALCULATE PI/2
  function Wallis return Float is
    Result : Float;
    N      : Float;
    I      : Integer;
  begin
    Result := 1.0;
    for I in 1..2000 loop
      N := 2.0*Float(I);
      Result := Result*((N/(N-1.0))*(N/(N+1.0)));
    end loop;
    return Result;
  end Wallis; 
end OtherMath;