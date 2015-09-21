with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Mol
is
  L : constant Integer := 10;
  type Spin is mod 4;
  package Random_Spin is new Ada.Numerics.Discrete_Random (Spin);
  use Random_Spin;
  G : Generator;
  s : Spin;
  lattice : array(-L .. L, -L .. L) of Spin;
  
  procedure PrintDebug is
  begin
    for i in 0 .. 3 loop
      for j in 0 .. 3 loop
        Put(Spin'Image(lattice(i,j)) & " ");
      end loop;
      Put_Line("");
    end loop;
  end;
  
  procedure Randomize is
  begin
    -- Initialization of the lattice
    for i in -L .. L loop
      for j in -L .. L loop
        lattice(i,j) := Random(G);
      end loop;
    end loop;
  end;
  
  procedure Touch(i, j : Integer; k : Integer) is
  begin
    -- Increment the spin by 1
    lattice(i,j) := lattice(i,j) + 1;
    -- Activate nearest neighbours
    Put_Line(Integer'Image(k));
    case lattice(i,j) is
      when 0 => Touch((i+1) mod 4,(j) mod 4, k+1); --Touch(i,j+1);
      when 1 => Touch((i) mod 4,(j+1) mod 4, k+1); --Touch(i-1,j);
      when 2 => Touch((i-1) mod 4,(j) mod 4, k+1); --Touch(i,j-1);
      when 3 => Touch((i) mod 4,(j-1) mod 4, k+1); --Touch(i+1,j);
    end case;
  end;
  
begin
  Reset (G);
  -- Initialization of the lattice
  Randomize;
  PrintDebug;
  Put_Line("______________");
  Randomize;
  PrintDebug;
  Put_Line("______________");
  Touch(1,1,0);
  PrintDebug;

  s:=0;

  for i in 1..5 loop
    s := s + 1;
    Put_Line(Integer'Image(i) & "  " & Spin'Image(s));
  end loop;


  Put_Line("Test " & Integer'Image(L));
end;
