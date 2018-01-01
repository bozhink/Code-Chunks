with Ada.Text_IO; use Ada.Text_IO;
package Basic is
  function Fact(N : Integer) return Integer;
  function FFact(N : Float) return Float;
  function exp(a : Float) return Float;
  function ln(a : Float) return Float;
  function pow(a, x : Float) return Float;
  function cos(a : Float) return Float;
  function sin(a : Float) return Float;
  function atan(A : Float) return Float;
end Basic;

package body Basic is
  function Fact(N : Integer) return Integer is
	begin
		if N <= 1 then
			return 1;
		else
			return N * Fact(N - 1);
		end if;
	exception
		when Constraint_Error =>
			Put(" *** ");
			return -1;
	end Fact;
  
  function FFact(N : Float) return Float is
	begin
		if N <= 1.0 then
			return 1.0;
		else
			return N * FFact(N - 1.0);
		end if;
	exception
		when Constraint_Error =>
			Put(" *** ");
			return -1.0;
	end FFact;

  function exp(a : Float) return Float is
    Result : Float;
    R1     : Float;
    R2     : Float;
    N      : Float;
    NN1    : Float;
    NN2    : Float;
    Ni     : Integer;
  begin
    if a=0.0 then
      return 1.0;
    end if;
    Result := 0.0;
    R1 := 0.0; R2 := 0.0;
    N :=0.0;
    Ni := 0;
    loop
      NN1 := (a**(2*Ni))/FFact(2.0*N);
      NN2 := (a**(2*Ni+1))/FFact(2.0*N+1.0);
      R1 := R1 + NN1;
      R2 := R2 + NN2;
      N := N+1.0;
      Ni := Ni+1;
      exit when NN1 < 0.00000001;
    end loop;
    Result := R1 + R2;
    return Result;
  end exp;
  
  function ln(a : in Float) return Float is
    b      : Float;
    count  : Float;
    ln2   : Float := 0.6931471805599;
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
  
  function cos(a : Float) return Float is
    Result : Float;
    R1     : Float;
    R2     : Float;
    NN1    : Float;
    NN2    : Float;
    K      : Float; --Float counter
    Ki     : Integer; --Integer counter
  begin
    Result:=0.0;
    R1:=0.0; R2:=0.0;
    K := 0.0;
    Ki := 0;
    loop
      NN1 := (a**(4*Ki))/FFact(4.0*K);
      NN2 := (a**(4*Ki+2))/FFact(4.0*K+2.0);
      R1 := R1 + NN1;
      R2 := R2 + NN2;
      K := K + 1.0;
      Ki := Ki + 1;
      exit when NN2 < 0.00000001 and NN2 > 0.0-0.00000001;
    end loop;
    Result := R1 - R2;
    return Result;
  end cos;
  
  function sin(a : Float) return Float is
    Result : Float;
    R1     : Float;
    R2     : Float;
    NN1    : Float;
    NN2    : Float;
    K      : Float; --Float counter
    Ki     : Integer; --Integer counter
  begin
    Result:=0.0;
    R1:=0.0; R2:=0.0;
    K := 0.0;
    Ki := 0;
    loop
      NN1 := (a**(4*Ki+1))/FFact(4.0*K+1.0);
      NN2 := (a**(4*Ki+3))/FFact(4.0*K+3.0);
      R1 := R1 + NN1;
      R2 := R2 + NN2;
      K := K + 1.0;
      Ki := Ki + 1;
      exit when NN2 < 0.00000001 and NN2 > 0.0-0.00000001;
    end loop;
    Result := R1 - R2;
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
end Basic;



with Basic, Ada.Float_Text_IO; use Basic;
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