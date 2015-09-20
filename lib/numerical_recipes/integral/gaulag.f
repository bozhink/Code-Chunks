      subroutine gaulag(x,w,n,alf)
      implicit none
      integer n,maxit
      real alf,w(n),x(n)
      double precision eps
      parameter (eps=3.d-14,maxit=10)
c uses gammln
c
c Given alf, the parameter \alfa of the Laguerre polynomials, this routine
c returns arrays x(1:n) and w(1:n) containing the abscissas and weights
c of the n-point Gauss-Laguerre quadrature formula. The smallest abscissa is
c returned in x(1), the largest in x(n)
      integer i,its,j
      real ai,gammln
      double precision p1,p2,p3,pp,z,z1
      do i=1,n
         if (i.eq.1) then
            z=(1.+alf)*(3.+.92*alf)/(1.+2.4*n+1.8*alf)
         else if(i.eq.2) then
            z=z+(15.+6.25*alf)/(1.+.9*alf+2.5*n)
         else
            ai=i-2
            z=z+((1.+2.55*ai)/(1.9*ai)+1.26*ai*alf/(1.+3.5*ai))
     *          *(z-x(i-2))/(1.+.3*alf)
         endif
         do its=1,maxit
            p1=1.d0
            p2=0.d0
            do j=1,n
               p3=p2
               p2=p1
               p1=((2*j-1+alf-z)*p2-(j-1+alf)*p3)/j
            enddo
            pp=(n*p1-(n+alf)*p2)/z
            z1=z
            z=z1-p1/pp
            if (abs(z-z1).le.eps) goto 1
         enddo
         write(unit=0,fmt=*) 'too many iterations in gaulag'
    1    x(i)=z
         w(i)=-exp(gammln(alf+n)-gammln(float(n))) / (pp*n*p2)
      enddo
      return
      end
