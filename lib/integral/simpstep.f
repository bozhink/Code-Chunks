      subroutine simpstep(idimv,func,ivar,a,fa,b,fb,dstep,iflag)
c
c Simpson step
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
      double precision h,hmin,x(idimv),fx
      parameter (hmin=1.d-14)
      iflag=0
      if (ivar.lt.1 .or. ivar.gt.idimv) then
         write(unit=0,fmt=*)
     +     'Error in simpstep: "ivar" is not in range [1,idimv]'
         iflag=1
         fb=0.d0
         dstep=0.d0
         return
      endif
      h=0.5d0*(b(ivar)-a(ivar))
      if (dabs(h).lt.hmin) then
        write(unit=0,fmt=*)
     +     'Error in simpstep: stride is too small'
         iflag=2
         fb=0.d0
         dstep=0.d0
         return
      endif
      do i=1,idimv
         x(i)=a(i)
      enddo
      x(ivar)=x(ivar)+h
      call func(idimv,x,fx)
      call func(idimv,b,fb)
      dstep=h*(fa+4.d0*fx+fb)/3.d0
      return
      end

      subroutine simpst38(idimv,func,ivar,a,fa,b,fb,dstep,iflag)
c
c Simpson 3/8 step
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
      double precision h,hmin,x(idimv),fx1,fx2
      parameter (hmin=1.d-14)
      iflag=0
      if (ivar.lt.1 .or. ivar.gt.idimv) then
         write(unit=0,fmt=*)
     +     'Error in simpst38: "ivar" is not in range [1,idimv]'
         iflag=1
         fb=0.d0
         dstep=0.d0
         return
      endif
      h=(b(ivar)-a(ivar))/3.d0
      if (dabs(h).lt.hmin) then
        write(unit=0,fmt=*)
     +     'Error in simpst38: stride is too small'
         iflag=2
         fb=0.d0
         dstep=0.d0
         return
      endif
      do i=1,idimv
         x(i)=a(i)
      enddo
      x(ivar)=x(ivar)+h
      call func(idimv,x,fx1)
      x(ivar)=x(ivar)+h
      call func(idimv,x,fx2)
      call func(idimv,b,fb)
      dstep=0.375d0*h*(fa+3.d0*fx1+3.d0*fx2+fb)                         ! 0.375=3./8.
      return
      end
