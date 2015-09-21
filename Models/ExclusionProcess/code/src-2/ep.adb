with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;
with calc_eigen;
use Ada.Text_IO, Ada.Float_Text_IO, calc_eigen;

procedure ep
is
  p : constant Float := 0.5;
  q : constant Float := 0.7;
  Number_of_Iterations : constant Integer := 10000;
  
  Number_of_States : constant Integer := 6;
  Lattice_Size : constant Integer := 4;
  type Particle is (Empty, Full);
  type Flow is range 0 .. 1;
  type Position is mod Lattice_Size;
  type Node
    is record
      now : Particle;
      old : Particle;
      input_flow : Flow;
    end record;
  
  type State is array(Position) of Particle;
  type States is range 1 .. Number_of_States;
  -- States L=4, N=2
  C : constant array(States) of State :=
    (
      (Full, Full, Empty, Empty),
      (Empty, Full, Full, Empty),
      (Empty, Empty, Full, Full),
      (Full, Empty, Empty, Full),
      (Full, Empty, Full, Empty),
      (Empty, Full, Empty, Full)
    );
  
  package Random_Particle is new Ada.Numerics.Discrete_Random (Particle);
  use Random_Particle;
  G : Generator;
  
  fG : Ada.Numerics.Float_Random.Generator;
  
  chain : array(Position) of Node;
  probability_matrix : array (States, States) of Float;
  pm, e : Matrix;
  
  function Calculate_Chain_State return States
  is
    st : State;
    s : States;
  begin
    for i in Position loop st(i) := chain(i).now; end loop;
    for i in States loop
      if st = C(i) then
        s := i;
      end if;
    end loop;
    return s;
  end Calculate_Chain_State;
  
  procedure Randomize_Chain is begin
    randomize_init:
      for i in Position
      loop
        chain(i).now := Random(G);
        chain(i).old := chain(i).now;
        chain(i).input_flow := 0;
      end loop
    randomize_init;
  end Randomize_Chain;
  
  procedure Set_Chain_State (st : States) is begin
    set_state_init:
      for i in Position
      loop
        chain(i).now := C(st)(i);
        chain(i).old := chain(i).now;
        chain(i).input_flow := 0;
      end loop
    set_state_init;
  end Set_Chain_State;
  
  procedure Print_Chain is begin
    for i in Position loop Put(Particle'Image(chain(i).now)&" "); end loop;
  end Print_Chain;
  procedure Print_Flow is begin
    for i in Position loop Put(Flow'Image(chain(i).input_flow)); end loop;
  end Print_Flow;
  
  procedure Update_Chain (start_position: Integer)
  is
    probability : Float;
    i : Position;
  begin
    update_chain_by_position:
      for j in reverse start_position .. start_position + Lattice_Size - 1
      loop
        i := Position(j mod Lattice_Size) + 1;
        case chain(i).old is
	  when Empty => probability := p;
	  when Full => probability := q;
	end case;
        if chain(i).now = Empty and
           chain(i-1).now = Full and
           probability > Ada.Numerics.Float_Random.Random(fG)
        then
            chain(i).now := Full; chain(i-1).now := Empty;
            chain(i).old := Full; chain(i-1).old := Full;
            chain(i).input_flow := 1;
        else
          chain(i).input_flow := 0;
          chain(i).old := chain(i).now;
          chain(i-1).old := chain(i-1).now;
        end if;
      end loop
    update_chain_by_position;
  end Update_Chain;
  
  procedure Init is begin
    Reset (G);
    Ada.Numerics.Float_Random.Reset (fG);
    --Randomize_Chain;
    Set_Chain_State(2);
    initialize_probability_matrix:
       for i in States loop
         for j in States loop
           probability_matrix(i,j) := 0.0;
         end loop;
       end loop
    initialize_probability_matrix;
  end Init;
  
  procedure Simulate
  is
    st : States;
  begin
    perform_iterative_simulation:
      for iteration in 1 .. Number_of_Iterations
      loop
        for s in States
        loop
          Set_Chain_State(s);
          Update_Chain(2);
          st := Calculate_Chain_State;
          probability_matrix(s, st) := probability_matrix(s, st) + 1.0;
        end loop;
      end loop
    perform_iterative_simulation;
  end Simulate;
  
  procedure Normalize_Probability_Matrix
  is
    sum : Float;
  begin
    sum := 0.0;
    for i in States loop
      sum := 0.0;
      for j in States loop
        sum := sum + probability_matrix(i,j);
      end loop;
      for j in States loop
        probability_matrix(i,j) := probability_matrix(i,j) / sum;
      end loop;
    end loop;
  end Normalize_Probability_Matrix;
  
  procedure Print_Probability_Matrix
  is
  begin
    for i in States loop
      for j in States loop
        --Put(Float'Image(probability_matrix(i,j)) & " ");
        Put(Item => probability_matrix(i,j), Fore => 5, Aft => 3, Exp => 0);
      end loop;
      Put_Line("");
    end loop;
  end Print_Probability_Matrix;

begin
  Init;

  Print_Chain;Put_Line("");
  Print_Flow;Put_Line("");
  Put_Line("");

  Update_Chain(3);
  Print_Chain;Put_Line("");
  Print_Flow;Put_Line("");

  Put_Line(States'Image(Calculate_Chain_State));
  
  Simulate;
  Normalize_Probability_Matrix;
  Print_Probability_Matrix;
 
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 
  for i in States loop
    for j in States loop
      pm(Integer(i), Integer(j)) := probability_matrix(j,i);
    end loop;
  end loop;


  Put_Line("Original matrix:");
  Put_Line("");
  
  for i in 1 .. N loop
    for j in 1 .. N loop
      Put(Float'Image(pm(i,j)) & " ");
    end loop;
    Put_Line("");
  end loop;
  
  jacobi ( pm, e, 100 );
  
  Put_Line("");
  Put_Line("Transformed matrix:");
  Put_Line("");
  
  for i in 1 .. N loop
    for j in 1 .. N loop
      Put(Float'Image(pm(i,j)) & " ");
    end loop;
    Put_Line("");
  end loop;
  
  Put_Line("");
  Put_Line("Eigenvalues");
  Put_Line("");
  for i in 1 .. N loop Put(Float'Image(pm(i,i)) & " "); end loop;
  Put_Line("");
  
end ep;
