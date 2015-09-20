      subroutine cint(n,y,h,z)
c Curve integrate
c 'y' -- input, array(dim=n); y(i) = f(x(i)),
c where f is the function to be integrated
c         s
c         /
c         [
c  z(s) = I   f(x) dx
c         ]
c         /
c         s0
c
c               i
c             ====
c             \
c  z(i) =      >    f(j) * h
c             /
c             ====
c             j = 1
c
      double precision y(*), h, z(*)
      integer i, j, n
      do i = 1, n
         z(i) = 0.d0
         do j = 1, i
            z(i) = z(j) + h*y(j)
         enddo
      enddo
      end

