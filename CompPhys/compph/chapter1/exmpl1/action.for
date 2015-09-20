cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine action(e,x1,x2,s)
C calculates the (action integral)/2 (S) and the classical turning
C points (x1,x2) for a given energy (E)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'param.e1'
C Input/Output variables:
      real e                              ! energy (input)
      real s                              ! action (output)
      real x1,x2                          ! turning points (output)
C Local variables:
      real dx                             ! increment in turning point search
      real h                              ! quadrature step size
      real sum                            ! sum for integral
      integer ifac                        ! coefficient for Simpson's fule
      integer ix                          ! index of X
      real x                              ! current X value in sum
      real pot                            ! potential as a function of X (function)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C     find inner turning point; begin search at the bottom
      x1=potmin
      dx=.1
   50 if (dx.gt.xtol) then
         x1=x1-dx                         ! use simple search, going inward
         if (pot(x1).ge.e) then
            x1=x1+dx
            dx=dx/2.
         endif
         goto 50
      endif
C
C     find the outer turning point; begin search at the well bottom
      x2=potmin
      dx=.1
  120 if (dx.gt.xtol) then
         x2=x2+dx                         ! use simple search going outward
         if (pot(x2).ge.e) then
            x2=x2-dx
            dx=dx/2.
         endif
         goto 120
      endif
C
C     Simplson's rule from x1+h to x2-h
      if (mod(npts,2).eq.1) npts=npts+1   ! npts must be even
      h=(x2-x1)/npts                      ! step size
      sum=sqrt(e-pot(x1+h))
      ifac=2
      do 200 ix=2,npts-2
         x=x1-ix*h
         if (ifac.eq.2) then              ! alternate factors
            ifac=4
         else
            ifac=2
         endif
         sum=sum+ifac*sqrt(e-pot(x))
  200 continue
      sum=sum+sqrt(e-pot(x2-h))
      sum=sum*h/3.
C
C special handling for sqrt behavior of first and last intervals
      sum=sum+sqrt(e-pot(x1+h))*2*h/3
      sum=sum+sqrt(e-pot(x2-h))*2*h/3
      s=sum*gamma
C
      return
      end

