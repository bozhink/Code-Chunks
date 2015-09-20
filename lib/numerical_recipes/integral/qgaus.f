      subroutine qgaus(func,a,b,ss)
      implicit none
      real a,b,ss,func
      external func
c Return as ss the integral of the function func between a and b, by
c ten-point Gauss-Legendre integration: the function is evaluated exactly
c ten times at interior in the range integration.
      integer j
      real dx,xm,xr,w(5),x(5)
      save w,x
c x -- abscissas; w -- weights
      data w/.2955242247,.2692667193,.2190863625,
     *       .1494513491,.0666713443/ 
      data x/.1488743389,.4333953941,.6794095682,
     *       .8650633666,.9739065285/
      xm=0.5*(b+a)
      xr=0.5*(b-a)
      ss=0.0
      do j=1,5
         dx=xr*x(j)
         ss=ss+w(j)*(func(xm+dx)+func(xm-dx))
      enddo
      ss=xr*ss
      return
      end
