      subroutine bodestep(idimv,func,ivar,a,fa,b,fb,dstep,iflag)
c
c Bode step
c
c 'idimv'  -- input; dimension of argument x of external 'func'
c 'func'   -- input; external; subroutine func(idimv,x,result)
c             where:
c                   double precision x(idimv) !idimv-dimensional vector
c                   double precision result   !scalar
c 'ivar'   -- input; number of vector component, which is integration variable
c 'a'      -- input; vector(idimv); left boundary
c 'fa'     -- input; scalar; func(idimv,a,fa)
c 'b'      -- input; vector(idimv); right boundary
c 'fb'     -- output; scalar; func(idimv,b,fb)
c 'dstep'  -- output; calculated value of the integral over the interval [a,b]
c 'iflag'  -- output; error flag:
c                     0 -- subroutine exited without errors
c                     1 -- 'ivar' is not in range [1,idimv]
c                     2 -- stride is too small
c
      implicit none
      external func
      integer idimv,ivar,i,iflag
      double precision a(idimv),fa,b(idimv),fb,dstep
      double precision h,hmin,x(idimv),fx1,fx2,fx3
      double precision t0,t1,t2
      parameter (t0=14.d0/45.d0)
      parameter (t1=64.d0/45.d0)
      parameter (t2=24.d0/45.d0)
      parameter (hmin=1.d-14)
      iflag=0
      if (ivar.lt.1 .or. ivar.gt.idimv) then
         write(unit=0,fmt=*)
     +     'Error in bodestep: "ivar" is not in range [1,idimv]'
         iflag=1
         fb=0.d0
         dstep=0.d0
         return
      endif
      h=0.25d0*(b(ivar)-a(ivar))
      if (dabs(h).lt.hmin) then
        write(unit=0,fmt=*)
     +     'Error in bodestep: stride is too small'
         iflag=2
         fb=0.d0
         dstep=0.d0
         return
      endif
c
      do i=1,idimv
         x(i)=a(i)
      enddo
c
      x(ivar)=x(ivar)+h
      call func(idimv,x,fx1)
c
      x(ivar)=x(ivar)+h
      call func(idimv,x,fx2)
c
      x(ivar)=x(ivar)+h
      call func(idimv,x,fx3)
c
      call func(idimv,b,fb)
c
      dstep=h*(t0*(fa+fb) + t1*(fx1+fx3) + t2*fx2)
      return
      end
