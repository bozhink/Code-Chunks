package calc_eigen
is
  subtype Real is Long_Float;

  N : constant Integer := 6;
  eps : constant Float := 0.0000001;

  type Matrix is array(1 .. N, 1 .. N) of Float;


  procedure jacobi(d : in out Matrix; e : in out Matrix; itmax : in Integer);

end calc_eigen;

