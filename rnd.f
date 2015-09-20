      program rnd
      implicit double precision(a-h,o-z),integer(i-n)
      character*256 arg
      if (iargc().lt.1) then
         n=10
      else
         call getarg(1,arg)
         read(unit=arg,fmt=*,iostat=ierr,err=10) n
      endif
      call system_clock(iclock)
      call srand(iclock)
      do i=1,n
         print*,rand()
      enddo
      stop
   10 stop 'Invalid number of points'
      end

