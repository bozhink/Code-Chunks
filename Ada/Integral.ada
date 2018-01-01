with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Generic_Elementary_Functions;
use Ada.Text_IO, Ada.Numerics.Generic_Elementary_Functions;
procedure Integrate is
  y : Float;
  --e : Float :=2.71828182846;
  function Fat(N : Float) return Float is
	begin
		if N <= 1.0 then
			return 1.0;
		else
			return N * Fat(N - 1.0);
		end if;
	end Fat;
  
  function exponential(x: in Float) return Float is
  i : Integer;
  n : Float :=0.0;
  sum : Float :=0.0;
	begin
    for i in 0..60 loop
      sum:=sum+(x**i)/Fat(n);
      n:=n+1.0;
    end loop;
    x:=sum;
    return x;
  end exponential;
  
  function f(x: in Float) return Float is
  begin
    x:=exponential(-(x**2));
    return x;
  end f;
  
  function integral(a,b,h : in Float) return Float is
  n : Float :=0.0;
  x : Float;
  fx : Float;
  total : Float;
  begin
    if a>=b then
      Put("ERROR! a >= b");
      return -1.0;
    end if;
    total:=0.5*(f(a)+f(b));
    loop
      x:=a+n*h;
      total:=total+f(x);
      n:=n+1.0;
      exit when x>=b;
    end loop;
    fx:=h*total;
    return fx;
  end integral;
  
begin
  y:= 3.2**2;
  Put(Float'Image(y));
  New_Line;
  y:=exponential(-0.0012);
  Put(Float'Image(y));
  New_Line;
  --y:=integral(-4.0, 4.0, 0.001);
  y:=f(y);
  y:=y**2;
  Put(Float'Image(y));
  New_Line;
end Integrate;