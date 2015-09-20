c Integrates 2D Heaviside Theta function dtheta
c using QUANC8
      implicit double precision(a-h,o-z),integer(i-n)
      external dtheta1,quanc8
      common /params/ a,b,relerr,abserr
      data a,b,relerr,abserr/-2.d0,2.d0,1.d-6,1.d-8/
      save
      print*,a,b,relerr,abserr
!       call  quanc8(dtheta1,a,b,abserr,relerr,res,errest,nofun,flag)
!       if (flag.ne.0) then
!          print*,'main: ',flag,errest,nofun
!          stop
!       endif
!       print*,res
      do x=-2.d0,2.d0,0.25d0
      print*,(dtheta(x,y),y=-2.d0,2.d0,0.25d0)
      enddo
      tt=dtheta1(1.d-3)
      print*,tt
      stop
      end

      function dtheta(x,y)
      implicit none
      double precision x,y,dtheta
      if ((x*x+y*y).lt.1.d0) then
         dtheta=1.d0
      else
         dtheta=0.d0
      endif
      return
      end

      function dtheta0(x)
      implicit none
      double precision dtheta,dtheta0,x,y
      common /yin/ y
      dtheta0=dtheta(x,y)
      return
      end

      function dtheta1(y)
      implicit none
      double precision dtheta0,dtheta1,y,yy
      double precision a,b,relerr,abserr,res,flag,errest
      integer nofun
      external dtheta0
      common /params/ a,b,relerr,abserr
      common /yin/yy
      yy=y
      call quanc8(dtheta0,a,b,abserr,relerr,res,errest,nofun,flag)
      if (flag.ne.0) then
         print*,'dtheta1: ',flag,errest,nofun
         stop
      endif
      dtheta1=res
      return
      end

