      subroutine LSQSETAB(idimv,x,y,m,a,b)
*
* name: Least SQuares SET A and B matrices
*
* 'idimv' -- input; number of data points
* 'x', 'y' -- input; vectors; input data points to be fitted
*             It is supposed y=f(x)
* 'm' -- input; order of polinomial
* 'a' -- output; matrix, returned matrix
* 'b' -- ouptut; vector, returned vector
*
* a*COEFF = b,
* where COEFF are coefficients for polynomial
*
      implicit doubleprecision(a-h,o-z),integer(i-n)
      dimension x(idimv),y(idimv)
      dimension a(m+1,m+1),b(m+1)
      dimension sx(0:2*m)
      m2=2*m
      mp1=m+1
      do i=0,m2
         sx(i)=0.d0
      enddo
      do i=1,mp1
         b(i)=0.d0
      enddo

      sx(0)=dble(idimv)
      do j=1,idimv
         xx=x(j)
         do i=1,m2
            sx(i) = sx(i) + xx
            xx = xx*x(j)
         enddo
      enddo
      do j=1,idimv
         xx=y(j)
         do i=1,m2
            b(i) = b(i) + xx
            xx = xx*x(j)
         enddo
      enddo
      do i=1,mp1
         do j=1,mp1
            a(i,j)=sx(i+j-2)
         enddo
      enddo
      return
      end
