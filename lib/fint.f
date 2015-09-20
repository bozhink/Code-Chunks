      subroutine fint(n,y,h,z)
c Fast integrate subroutine
c 'y' -- input, array(dim=n) of points y=f(x),
c where f is the function to be integrated
c 'z' -- approximate integral value
c 'h' -- step
c            n
c          ------
c          \
c z =       >      h * y(i)
c          /
c          ------
c           i=1
c
      double precision y(*), h, z
      integer n, i
      z = 0.d0
      do i = 1, n
         z = z + y(i)*h
      enddo
      end


