      subroutine gaujac(x,w,n,alf,bet)
      implicit none
      integer n,maxit
      real alf,bet,w(n),x(n)
      double precision eps
      parameter (eps=3.d-14, maxit=10)
c uses gammln
c
c Given alf and bet, the parameters of the Jacobi polynomial, this routine returns
c arrays(1:n) and w(1:n) containing the abscissas and weights of the 
c n-point Gauss-Jacobi quadrature formula. The largest abscissa is returned in x(1),
c the smallest in x(n).
      integer i,its,j
      real alfbet,an,bn,r1,r2,r3,gammln
      double precision a,b,c,p1,p2,p3,pp,temp,z,z1
      do i=1,n
         if (i.eq.1) then
            an=alf/n
            bn=bet/n
            r1=(1.+alf)*(2.78/(4.+n*n)+.768*an/n)
            r2=1.+1.48*an+.96*bn+.452*an*an+.83*an*bn
            z=1.-r1/r2
         else if (i.eq.2) then
            r1=(4.1+alf)/((1.+alf)*(1.+.156*alf))
            r2=1.+.06*(n-8.)*(1.-.12*alf)/n
            r3=1.+.012*bet*(1.+.25*abs(alf))/n
            z=z-(1.-z)*r1*r2*r3
         elseif (i.eq.3) then
            r1=(1.67+.28*alf)/(1.+.37*alf)
            r2=1.+.22*(n-8.)/n
            r3=1.+8.*bet/((6.28+bet)*n*n)
            z=z-(x(1)-z)*r1*r2*r3
         else if (i.eq.n-1) then
            r1=(1.+.235*bet)/(.766+.119*bet)
            r2=1./(1.+.639*(n-4.)/(1.+.71*(n-4.)))
            r3=1./(1.+20.*alf/((7.5+alf)*n*n))
            z=z+(z-x(n-3))*r1*r2*r3
         else if (i.eq.n) then
            r1=(1.+.37*bet)/(1.67+.28*bet)
            r2=1./(1.+.22*(n-8.)/n)
            r3=1./(1.+8.*alf/((6.28+alf)*n*n))
            z=z+(z-x(n-2))*r1*r2*r3
         else
            z=3.*x(i-1)-3.*x(i-2)+x(i-3)
         endif
         alfbet=alf+bet
         do its=1,maxit
            temp=2.d0+alfbet
            p1=(alf-bet+temp*z)/2.d0
            p2=1.d0
            do j=2,n
               p3=p2
               p2=p1
               temp=2*j+alfbet
               a=2*j*(j+alfbet)*(temp-2.d0)
               b=(temp-1.d0)*(alf*alf-bet*bet+temp*(temp-2.d0)*z)
               c=2.d0*(j-1+alf)*(j-1+bet)*temp
               p1=(b*p2-c*p3)/a
            enddo
            pp=(n*(alf-bet-temp*z)*p1+
     *          2.d0*(n+alf)*(n+bet)*p2)/(temp*(1.d0-z*z))
            z1=z
            z=z1-p1/pp
            if (abs(z-z1).le.eps) goto 1
         enddo
         write(unit=0,fmt=*) 'too many iterations in gaujac'
    1    x(i)=z
         w(i)=exp(gammln(alf+n)+gammln(bet+n)-gammln(n+1.)-
     *        gammln(n+alfbet+1.))*temp*2.**alfbet/(pp*p2)
      enddo
      return
      end
