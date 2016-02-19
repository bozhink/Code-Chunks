!     
! File:   getspec.f
! Author: bozhin
!
! Created on Thue, 2012, Jan 24, 0:13
!
      program spec of Hg1212
      implicit double precision(a-h,o-z),integer(i-n)
      dimension dspec(4)
      do
         read(unit=*,fmt=*,iostat=ierr,err=100,end=10)px,py
         call spec1(px,py,dspec,info)
         if (info.ne.0) then
            write(unit=0,fmt=500)px,py,info
            cycle
         endif
         print 600,px,py,dspec
      enddo
   10 continue
      stop
  100 write(unit=0,fmt=101)ierr
  101 format("specH1212: ERROR: input value is not a number.",
     * " error=",i4)
      stop "NaN"
  500 format("specHg1212: WARNING: spectrum at point",
     * "(",f7.3,",",f7.3,")"," was not calculated correctly: ",
     * "error flag = ",i6)
  600 format(f10.6,1x,f10.6,4(1x,f11.6))
      end
