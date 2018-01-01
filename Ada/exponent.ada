with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO;
procedure Integrate is
  y : Float;
  --***********************************************
  function Fat(N : Float) return Float is
	begin
		if N <= 1.0 then
			return 1.0;
		else
			return N * Fat(N - 1.0);
		end if;
	end Fat;
  --***********************************************
  function exponential(x: in Float) return Float is
  i : Integer;
  n : Float :=0.0;
  sum : Float :=0.0;
  sum2 : Float :=0.0;
  begin
    if x>=0.0 then
      for i in 0..60 loop
        sum:=sum+(x**i)/Fat(n);
        n:=n+1.0;
      end loop;
      x:=sum;
      return x;
    else
      for i in 0..60 loop
        sum:=sum+(x**(2*i))/Fat(2.0*n);
        sum2:=sum2+(x**(2*i+1))/Fat(2.0*n+1.0);
        n:=n+1.0;
      end loop;
      x:=sum+sum2;
      return x;
    end if;
  end exponential;
  --***********************************************
    
begin
  Put("Enter a number: ");
  New_Line;
  Ada.Float_Text_IO.Get(y);
  y:=exponential(y);
  Put(Float'Image(y));
  New_Line;
end Integrate;