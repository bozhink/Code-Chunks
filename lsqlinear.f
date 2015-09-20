      subroutine lsqlin(n,x,y,a,b)
*
* name: LeastSQuares Method -- Linear Regression
*
* Using data points x and y calculates coefficients in linear
* function
*            y = a*x+b
*
* 'n' -- input; number of data points
* 'x' and 'y' -- input; vectors; data points; It is supposed y=f(x)
* 'a' and 'b' -- output; calculated coefficients
*
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(n), y(n)
      sx=0.d0
      sy=0.d0
      sxy=0.d0
      sx2=0.d0
      dn=dble(n)
      do i=1,n
         sx=sx+x(i)
         sy=sy+y(i)
         sxy=sxy+x(i)*y(i)
         sx2=sx2+x(i)*x(i)
      enddo
      a=(sx*sy-dn*sxy)/(sx*sx-dn*sx2)
      b=(sy-a*sx)/dn
      return
      end
