with Ada.Text_IO, calc_eigen;
use Ada.Text_IO, calc_eigen;

procedure eigenvalue
is

  A : Matrix;
  e : Matrix;
  itmax: Integer;

begin

  A(1,1):= -2.0; A(1,2):= 1.0; A(1,3):= 3.0; A(1,4):= 4.0;
  A(2,1):= 1.0; A(2,2):=-3.0; A(2,3):= 1.0; A(2,4):= 5.0;
  A(3,1):= 3.0; A(3,2):= 1.0; A(3,3):= 6.0; A(3,4):=-2.0;
  A(4,1):= 4.0; A(4,2):= 5.0; A(4,3):=-2.0; A(4,4):=-1.0;
  
  itmax:=50;
  
  Put_Line("Original matrix:");
  Put_Line("");
  
  for i in 1 .. N loop
    for j in 1 .. N loop
      Put(Float'Image(A(i,j)) & " ");
    end loop;
    Put_Line("");
  end loop;
  
  jacobi ( A, e, itmax);
  
  Put_Line("");
  Put_Line("Transformed matrix:");
  Put_Line("");
  
  for i in 1 .. N loop
    for j in 1 .. N loop
      Put(Float'Image(A(i,j)) & " ");
    end loop;
    Put_Line("");
  end loop;
  
  Put_Line("");
  Put_Line("Eigenvalues");
  Put_Line("");
  for i in 1 .. N loop Put(Float'Image(A(i,i)) & " "); end loop;
  Put_Line("");

end eigenvalue;

