      program Special Conformal Transformation
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=3)
      dimension z(n),x(n),b(n)
      character*32 arg
      if (iargc().lt.3) then
      write(unit=0,fmt=*) "Enter data in format: x y z bx by bz"
      do
         read(unit=*,fmt=*,iostat=ierr,err=100,end=100)
     *       x(1),x(2),x(3),b(1),b(2),b(3)
         call dsct(n,x,b,z)
         print*,z(1),z(2),z(3)
      enddo
      else
      call getarg(1,arg)
      read(unit=arg,fmt=*,iostat=ierr,err=100) b(1)
      call getarg(2,arg)
      read(unit=arg,fmt=*,iostat=ierr,err=100) b(2)
      call getarg(3,arg)
      read(unit=arg,fmt=*,iostat=ierr,err=100) b(3)
      do
         read(unit=*,fmt=*,iostat=ierr,err=100,end=100)
     *       x(1),x(2),x(3)
         call dsct(n,x,b,z)
         print*,z(1),z(2),z(3)
      enddo
      endif
  100 stop
      end

    
