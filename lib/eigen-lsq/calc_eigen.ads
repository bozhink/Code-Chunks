package calc_eigen
is
  subtype Real is Long_Float;

  N : constant Integer := 4;
  eps : constant Real := 0.00000000000001;

  type Matrix is array(1 .. N, 1 .. N) of Real;


  procedure jacobi(d : in out Matrix; e : in out Matrix; itmax : in Integer);

end calc_eigen;

