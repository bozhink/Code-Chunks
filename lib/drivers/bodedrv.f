      program bodedrv
      implicit double precision(a-h,o-z),integer(i-n)
      external xsin
      parameter (idimv=1)
      dimension a(idimv),b(idimv)
      a(1)=0.d0
      b(1)=3.141592653589792d0
      ivar=1
      print*,ivar
      print*,a
      print*,b
      print*

      call bode(idimv,xsin,ivar,a,b,dinteg,iflag)
      print*,dinteg
      print*,iflag
      call simpson(idimv,xsin,ivar,a,b,dinteg,iflag)
      print*,dinteg
      print*,iflag
      call simps38(idimv,xsin,ivar,a,b,dinteg,iflag)
      print*,dinteg
      print*,iflag
!       call b3(idimv,a,xsin)
!       call xsin(idimv,a,fa)
!       call bodestep(idimv,xsin,ivar,a,fa,b,fb,dstep,iflag)
!       print*,a,fa
!       print*,b,fb
!       print*,dstep
!       print*,iflag
      stop
      end

      subroutine xsin(idimv,x,dres)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(idimv)
      dres=dsin(x(1))
      return
      end

      subroutine b3(idimv,a,func)
      implicit double precision (a-h,o-z),integer(i-n)
      external func
      call func(idimv,a,dres)
      print*,'b3: dres=',dres
      return
      end

