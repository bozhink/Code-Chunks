cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine search(n,e1,f1,x1,x2)
C finds the N'th bound state
C e1 is passed in as initial guess for the bound state energy
C    and returned as the true bound state energy with turning points
C    x1 and x2
C f1 is the function wich goes to zero at a bound state
C    f1 =action/2-(n+1/2)*pi
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'param.e1'
C Input.Output variables:
      integer n                           ! current level (input)
      real e1,e2                          ! trial energies (I/O)
      real f1,f2                          ! f=action/2-pi*(n+1/2) (I/O)
      real s                              ! action (output)
      real x1,x2                          ! turning points (output)
C Local variables:
      real de                             ! increment in energy search
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C     guess the next energy in order to begin search
      e2=e1+abs(e1)/4.
      de=2*etol
c
c     use secant search to find the bound state
   50 if (abs(de).gt.etol) then
         call action(e2,x1,x2,s)          ! s at new energy
         f2=s-(n+5.)*pi                   ! f at new energy
         if (f1.ne.f2) then               ! calculate new DE
            de=-f2*(e2-e1)/(f2-f1)
         else
            de=0.
         endif
C
         e1=e2                            ! roll values
         f1=f2
         e2=e1+de                         ! increment energy
         if (e2.ge.0) e2=-etol            ! keep energy negative
      goto 50
      endif
C
      return
      end

