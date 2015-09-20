      subroutine gauher(x,w,n)
      implicit none
      integer n, maxit
      real w(n),x(n)
      double precision eps, pim4
      parameter (eps=3.D-14,pim4=.7511255444649425D0,maxit=10)
c Given n, this routine returns arrays x(1:n) and w(1:n) containing the
c abscissas and weights of the n-point Gauss-Hermite quadrature formula.
c The langest abscissa is returned in x(1), the most negative in x(n)
c Parameters: eps is the relative precision, pim4=1/\pi^{1/4}, maxit=maximum iterations
      integer i,its,j,m
      double precision p1,p2,p3,pp,z,z1
      m=(n+1)/2
c The roots are symmetric about the origin, so we have to find half of them.
      do i=1,m
         if (i.eq.1) then
            z=sqrt(float(2*n+1))-1.85575*(2*n+1)**(-0.166667)
         elseif (i.eq.2) then
            z=z-1.14*n**.426/z
         elseif (i.eq.3) then
            z=1.86*z-.86*x(1)
         elseif (i.eq.4) then
            z=1.91*z-.91*x(2)
         else
            z=2.*z-x(i-2)
         endif
         do its=1,maxit
            p1=pim4
            p2=0.d0
            do j=1,n
               p3=p2
               p2=p1
               p1=z*sqrt(2.d0/j)*p2-sqrt(dble(j-1)/dble(j))*p3
            enddo
            pp=sqrt(2.d0*n)*p2
            z1=z
            z=z1-p1/pp
            if (abs(z-z1).le.eps) goto 1
         enddo
         write(unit=0,fmt=*) 'too many iterations in gauher'
    1    x(i)=z
         x(n+1-i)=-z
         w(i)=2.d0/(pp*pp)
         w(n+1-i)=w(i)
      enddo
      return
      end
