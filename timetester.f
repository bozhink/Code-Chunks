      program timer
      implicit double precision(a-h,o-z),integer(i-n)
      external dran0
      parameter (n=1000)
      dimension A(n,n), B(n,n), C(n,n)
      idum = 127
      do 2 i = 1, n
      do 1 j = 1, n
      A(i,j) = dran0(idum)
      B(i,j) = dran0(idum)
    1 continue
    2 continue
      do 30 i = 1, n
      do 20 j = 1, n
      C(i,j) = 0.d0
      do 10 k = 1, n
      C(i,j) = C(i,j) + A(i,k)*B(k,j)
   10 continue
   20 continue
   30 continue
      stop
      end
