      subroutine simpson(idimv,func,ivar,a,b,dinteg,iflag)
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=10)
      external func
      dimension a(idimv),b(idimv)
      dimension x1(idimv),x2(idimv)
      if (ivar.lt.1 .or. ivar.gt.idimv) then
         write(unit=0,fmt=*)
     +     'Error in simpson: "ivar" is not in range [1,idimv]'
         iflag=1
         dinteg=0.d0
         return
      endif
      h=(b(ivar)-a(ivar))/dble(n)
      dinteg=0.d0
      x1=a
      call func(idimv,x1,fa)
      do i=1,n
         x2=x1
         x2(ivar)=x2(ivar)+h
         call simpstep(idimv,func,ivar,x1,fa,x2,fb,dstep,iflag)
         if (iflag.ne.0) return
         dinteg=dinteg+dstep
         fa=fb
         x1=x2
      enddo
      return
      end

      subroutine simps38(idimv,func,ivar,a,b,dinteg,iflag)
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=10)
      external func
      dimension a(idimv),b(idimv)
      dimension x1(idimv),x2(idimv)
      if (ivar.lt.1 .or. ivar.gt.idimv) then
         write(unit=0,fmt=*)
     +     'Error in simps38: "ivar" is not in range [1,idimv]'
         iflag=1
         dinteg=0.d0
         return
      endif
      h=(b(ivar)-a(ivar))/dble(n)
      dinteg=0.d0
      x1=a
      call func(idimv,x1,fa)
      do i=1,n
         x2=x1
         x2(ivar)=x2(ivar)+h
         call simpst38(idimv,func,ivar,x1,fa,x2,fb,dstep,iflag)
         if (iflag.ne.0) return
         dinteg=dinteg+dstep
         fa=fb
         x1=x2
      enddo
      return
      end

      subroutine simpadpt(idimv,func,ivar,a,b,dinteg,iflag)
      implicit double precision(a-h,o-z),integer(i-n)
      external func
      dimension a(idimv),b(idimv)
      dimension x1(idimv),x2(idimv)
      if (ivar.lt.1 .or. ivar.gt.idimv) then
         write(unit=0,fmt=*)
     +     'Error in simpadpt: "ivar" is not in range [1,idimv]'
         iflag=1
         dinteg=0.d0
         return
      endif
      n=10
      h=(b(ivar)-a(ivar))/dble(n)
      dinteg=0.d0
      x1=a
      call func(idimv,x1,fa)
      do i=1,n
         x2=x1
         x2(ivar)=x2(ivar)+h
         call simpstep(idimv,func,ivar,x1,fa,x2,fb,dstep1,iflag)
         call simpst38(idimv,func,ivar,x1,fa,x2,fb,dstep2,iflag)
         if (iflag.ne.0) return
         dinteg=dinteg+dstep
         fa=fb
         x1=x2
      enddo
      return
      end