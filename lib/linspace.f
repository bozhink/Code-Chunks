      subroutine dlinspace(xmin,xmax,n,x)
      implicit none
      integer n, i
      double precision xmin,xmax,x(n),h
      h=(xmax-xmin)/dfloat(n)
      x(1)=xmin
      do i=2,n
         x(i) = x(i-1)+h
      enddo
      return
      end
      
      subroutine linspace(xmin,xmax,n,x)
      implicit none
      integer n, i
      real xmin,xmax,x(n),h
      h=(xmax-xmin)/float(n)
      x(1)=xmin
      do i=2,n
         x(i) = x(i-1)+h
      enddo
      return
      end

