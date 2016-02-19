!     
! File:   surf1212.f
! Author: bozhin
!
! Created on Thue, 2012, Jan 24, 0:37
!
      program surfaces of Hg1212
      implicit double precision(a-h,o-z),integer(i-n)
      dimension dspec(4)
      parameter (n=500)
      character*255 arg
      common /BHPARAMS/ Ed,Es,Ep,Tpd,Tsp,Tpp
      !
      if (iargc().ge.1) then
         call getarg(1,arg)
         read(unit=arg,fmt='(f6.3)',err=10) Es
         goto 20
      endif
   10 Es = 3.934d0 ! Hg 1212
   20 continue
      !
      write(unit=0,fmt=*)Es
      pi=4.d0*datan(1.d0)
      pi3=3.d0*pi
      a=-3.d0*pi
      b=3.d0*pi
      h=(b-a)/dble(n)
      do i=0,n-1
         do j=0,n-1
            px = a+h*dble(i)
            py = a+h*dble(j)
            call spec1(px,py,dspec,info)
            if (info.ne.0) then
               write(unit=0,fmt=500)px,py,info
               cycle
            endif
            print 600,px,py,dspec
         enddo
      enddo
      stop
  500 format("specHg1212: WARNING: spectrum at point",
     * "(",f7.3,",",f7.3,")"," was not calculated correctly: ",
     * "error flag = ",i6)
  600 format(f10.6,1x,f10.6,4(1x,f11.6))
      end
