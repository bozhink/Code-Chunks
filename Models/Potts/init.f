      subroutine setR(J,B,R)
c set R matrix
      implicit none
      double precision :: J,B,R(-1:1,-4:4)
      integer :: ii,jj
      do ii=-1,1
      do jj=-4,4
         R(ii,jj) = dexp( -dble(2*ii) * (B+J*dble(jj)) )
      enddo
      enddo
      return
      end

      subroutine stateGen(dimx,dimy,S)
c Generates initial lattice
      implicit none
      integer :: dimx, dimy, S(dimx,dimy), i, j
      real :: a(dimx,dimy)
      call init_random_seed()
      call random_number(a)
      do i=1,dimx
      do j=1,dimy
      if ( a(i,j).lt.1.0/3.0 ) then
         S(i,j) = -1
      elseif ( a(i,j).lt.2.0/3.0 ) then
         S(i,j) =  0
      else
         S(i,j) =  1
      endif
      enddo
      enddo
      return
      end

