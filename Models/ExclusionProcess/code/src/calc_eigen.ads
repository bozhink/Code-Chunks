package calc_eigen
is
  subtype Real is Long_Float;

  N : constant Integer := 6;
  eps : constant Float := 0.0000001;

  type Matrix is array(1 .. N, 1 .. N) of Float;
  type Vector is array(1 .. N) of Float;


  procedure jacobi(d : in out Matrix; e : in out Matrix; itmax : in Integer);
  
  procedure gauss_jordan(a : in out Matrix; parameter : Integer; lambda : Float; ierr: out Integer);

end calc_eigen;

