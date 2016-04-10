
      subroutine secant(func,NMAX,RELERR,ABSERR,x0,fx0,x1,fx1,
     * res,iter,ifprint,ierr)
      implicit none
      integer NMAX,iter,ierr
      logical ifprint
      double precision func,RELERR,ABSERR
      external func
      double precision x0,fx0,x1,fx1,res
c func -- input; external; function of interest
c NMAX -- input; maximal number of iterations
c RELERR -- input; relative error estimate
c ABSERR -- input; absolute error estimate
c x0, x1 -- input; initial two points, in which function func is calculated
c fx0, fx1 -- input; fx0=func(x0), fx1=func(x1)
c res -- output; calcuated value of the root
c iter -- output; number of iterations for convergence
c ifprint -- input; boolean; if .true. then some information will be
c            printed to STDERR
c ierr --output; error flsg
      integer i
      double precision z0,z1,f0,f1,f,zero
      parameter(zero=1.d-300)
c
c RELERR and ABSERR will be set to be positive
      RELERR=DABS(RELERR)
      ABSERR=DABS(ABSERR)
c
      z0=x0
      z1=x1
      f0=fx0
      f1=fx1
      iter=0
      ierr=0
      do i=1,NMAX
         iter=iter+1
         f=f1-f0
         if (dabs(f).lt.zero) then
            ierr=1
            if (ifprint) write(unit=0,fmt=100)
            res=0.d0
            return
         endif
         res = z1 - f1*(z1-z0)/f
         if (dabs(z1).lt.zero) then
            if (ifprint) write(unit=0,fmt=101)
            if (dabs(res-z1).lt.ABSERR) return
         else
            if (dabs(res-z1)/dabs(z1).lt.RELERR) return
         endif
         z0=z1
         f0=f1
         z1=res
         f1=func(res)
      enddo
      return
  100 format("secant: ERROR: function func is too slowly changing by x")
  101 format("secant: WARNING: old approximation is too close to zero")
      end

