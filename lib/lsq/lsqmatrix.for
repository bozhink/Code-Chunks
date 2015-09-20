      subroutine lsqmat(n,m,x,y,A,B)
      implicit none
c 'n' -- input; number of of data points
c 'm' -- input; order of polynomial
c 'x', 'y' -- input; input data
c 'A' -- output; matrix
c 'B' -- output; vector
c
c A.c = B
c 'c' -- vector of coefficients
c             T
c y = f(x) = c . x
c
      integer n,m,i,j,m2
      double precision x(n), y(n)
      double precision B(0:m),sx(2*m),A(0:m,0:m)
      double precision xx
      m2 = 2*m
      do i=1,m2
         sx(i)=0.0d0
      enddo
      do j=1,n
         xx=x(j)
         do i=1,m2
            sx(i)=sx(i)+xx
            xx=xx*x(j)
         enddo
      enddo
      do i=0,m
         do j=0,m
            if ((i.eq.0).and.(j.eq.0)) then
               A(i,j)=dble(n)
            else
               A(i,j)=sx(i+j)
            endif
         enddo
      enddo
      do i=0,m
         B(i)=0.0d0
      enddo
      do j=1,n
         xx=y(j)
         do i=0,m
            B(i)=B(i)+xx
            xx=xx*x(j)
         enddo
      enddo
      return
      end
 