      subroutine mcms(dimx,dimy,S,R)
c  Monte Carlo Micro Step
      implicit none
      integer :: dimx, dimy, S(dimx,dimy)
      integer :: i,j,ni,nj,f
      real :: a(3)
      double precision :: R(-1:1,-4:4)
      call random_number(a)
      i = int( float(dimx)*a(1) ) + 1
      j = int( float(dimy)*a(2) ) + 1
      ni = dimx+i-1
      nj = dimy+j-1
      f  = S( mod(ni+1,dimx)+1, j ) + S( mod(ni-1,dimx)+1, j )
     *   + S( i, mod(nj+1,dimy)+1 ) + S( i, mod(nj-1,dimy)+1 )
      if ( dble(a(3)) .lt. R(S(i,j),f) ) then
         S(i,j) = -S(i,j)
      endif
      return
      end

      subroutine mcmks(ns,dimx,dimy,S,R)
c  Monte Carlo Macro Step
c 'ns' - number of micro steps
c 'n' - dimension of square materix S
c 'S' - spin matrix
c 'R' - probability matrix
      implicit none
      integer :: ns, dimx, dimy, S(dimx,dimy)
      integer :: i,j,ni,nj,f,ii
      real :: a(ns,3),fx,fy
      double precision :: R(-1:1,-4:4)
      call random_number(a)
      fx = float(dimx)
      fy = float(dimy)
      do ii=1,ns
         i = int( fx*a(ii,1) ) + 1
         j = int( fy*a(ii,2) ) + 1
         ni = dimx+i-1
         nj = dimy+j-1
         f  = S( mod(ni+1,dimx)+1, j ) + S( mod(ni-1,dimx)+1, j )
     *      + S( i, mod(nj+1,dimy)+1 ) + S( i, mod(nj-1,dimy)+1 )
         if ( dble(a(ii,3)) .lt. R(S(i,j),f) ) S(i,j) = -S(i,j)
      enddo
      return
      end

