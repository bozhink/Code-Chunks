      program lagrange_iterpolation
c n = number of data points
c f(i) = known function values at x(i), i=1,2,...,n
c ff = function value at xx (to be computed)
      implicit none
      integer n
      parameter (n = 3)
      real x(n), f(n)
      real xx
      parameter (xx=251.0)
      real  ff, s
      integer i, j
      data x /94.0,205.0,371.0/
      data f /929.0,902.0,860.0/
      
      print 1, n
    1 format ('Lagrange interpolation using',i4,1x,'data points',//)
      do i = 1, n
      print 2, i, x(i)
    2 format(' Value of x(',i1,'):',1x,f7.2)
      end do
      do i = 1, n
      print 3, i, f(i)
    3 format(' Value of f(',i1,'):',1x,f7.2)
      end do
    
      ff = 0.0
      do i = 1, n
         s = 1.0
         do j = 1, n
            if (j.ne.i) then
               s = s * (xx - x(j)) / (x(i) - x(j))
            end if
        end do
        ff = ff + s*f(i)
      end do
      print 4
    4 format(/,'Result of interpolation:',/)
      print 5, xx
    5 format(' xx = ',f7.2)
      print 6, ff
    6 format(' ff = ',f7.2)
      print*
      stop
      end