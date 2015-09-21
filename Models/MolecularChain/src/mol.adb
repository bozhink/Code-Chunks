with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Mol
is

  Number_of_Iterations : constant Integer := 100000;
  left_L : constant Integer := 1;
  right_L : constant Integer := 2000;
  L : constant Integer := 10;
  type Spin is mod 4;

  package Random_Spin is new Ada.Numerics.Discrete_Random (Spin);
  use Random_Spin;
  G : Generator;

  lattice : array(left_L .. right_L, left_L .. right_L) of Spin;
  
  size : Integer := 0;
  
  procedure PrintDebug is
  begin
    for i in 1 .. 3 loop
      for j in 1 .. 3 loop
        Put(Spin'Image(lattice(i,3-j+1)) & " ");
      end loop;
      Put_Line("");
    end loop;
  end;
  
  procedure Randomize is
  begin
    -- Initialization of the lattice
    for i in left_L .. right_L loop
      for j in left_L .. right_L loop
        lattice(i,j) := Random(G);
      end loop;
    end loop;
  end;
  
  procedure Touch(i, j : Integer; rsv: Spin) is
  -- rsv is the required spin value to begin the dynamical process
  begin
    if i < left_L or i > right_L or j < left_L or j > right_L then return; end if;
    if (lattice(i,j) /= rsv) and (lattice(i,j)+1 /= rsv) then return; end if;
    -- Increment the spin by 1
    lattice(i,j) := lattice(i,j) + 1;
    -- Increment the size parameter of the avalanche
    size := size + 1;
    -- Activate nearest neighbours
    case lattice(i,j) is
      when 0 => Touch(i+1, j, lattice(i,j) + 1); Touch(i, j+1, lattice(i,j) + 2);
      when 1 => Touch(i, j+1, lattice(i,j) + 1); Touch(i-1, j, lattice(i,j) + 2);
      when 2 => Touch(i-1, j, lattice(i,j) + 1); Touch(i, j-1, lattice(i,j) + 2);
      when 3 => Touch(i, j-1, lattice(i,j) + 1); Touch(i+1, j, lattice(i,j) + 2);
    end case;
  end;
  
begin
  Reset (G);
  -- Initialization of the lattice
  --Randomize;
  --PrintDebug;
  --Put_Line("______________");
  --Randomize;
  --PrintDebug;
  --Put_Line("______________");
  --size := 0;
  --Touch(1,1, lattice(1,1));
  --PrintDebug;

  --Put_Line("Size of avalanche " & Integer'Image(size));
  
  for i in 1 .. Number_of_Iterations loop
    size := 0;
    Randomize;
    Touch ( 2, 2, lattice(2, 2) );
    Put_Line (Integer'Image(size));
  end loop;
  
end;
