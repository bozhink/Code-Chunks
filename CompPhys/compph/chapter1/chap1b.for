c chap1b.for
      func(x)=exp(x) ! function to integrate
      exact=exp(1.)-1.
   30 print*,'Enter n even (.lt. 2 to stop)'
      read*,n
      if (n.lt.2) stop
      if (mod(n,2).ne.0) n=n+1
      h=1./n
      sum=func(0.)           ! contribution from x=0
      fac=2                  ! factor for Simpson's rule
      do 10 i=1,n-1          ! loop over lattice points
         if (fac.eq.2) then  ! factors alternate
            fac=4
         else
            fac=2.
         endif
         x=i*h
         sum=sum+fac*func(x)
   10 continue
      sum=sum+func(1.)
      xint=sum*h/3.
      diff=exact-xint
      print 20,n,diff
   20 format (5x,'n=',i5,5x,'error=',e15.8)
      goto 30              ! get another value of n
      end

