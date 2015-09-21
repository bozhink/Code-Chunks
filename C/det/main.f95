      program calcdet
      implicit double precision(a-z)
      external det
      integer i,j
      integer n
      parameter (n=3)
      dimension a(n,n)
      do i=1,n
          do j=1,n
              a(i,j) = 1.0/real(i+j+1)
          enddo
      enddo
      
      s = det(n, a)
      
      do i=1,n
      print 100,(a(i,j),j=1,n)
      enddo
      print*
      print *,s
      stop
  100 format(3(f6.3,1x))
  110 format(f6.3)
      end

