      program skiplines
      implicit integer(i-n), character*256(a-c)
      nlines=0
      if (iargc().lt.1) goto 10
      call getarg(1,arg)
      read(unit=arg,fmt=*,err=10) n
      nlines=n
   10 do i=1,nlines
      read(unit=*,fmt=*,err=100,end=20) carg
      enddo
      do
      read(unit=*,fmt=*,err=100,end=20) carg
      print*,carg
      enddo
   20 stop
  100 stop 'Error reading input data'
      end

